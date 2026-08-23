/* ==========================================================
   BEE BALLISTICS — projectile mini game
   Launch point is exactly (0, 0) so every standard
   projectile formula applies without adjustment.

   The physics world resizes with the viewport: a phone gets a
   smaller field so each metre still gets enough pixels to be
   readable and aimable.
   ========================================================== */

(function () {
  'use strict';

  const canvas = document.getElementById('field');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');

  const G = 10;                 // m/s²
  const A_MIN = 1, A_MAX = 89;
  const V_MIN = 10;

  // ---------- responsive world ----------
  function worldConfig(cssW) {
    if (cssW < 560) return { W: 120, H:  80, aspect: .92, hitR: 5.0, vMax: 48 };
    if (cssW < 900) return { W: 160, H: 100, aspect: .70, hitR: 4.8, vMax: 54 };
    return              { W: 200, H: 120, aspect: .58, hitR: 4.5, vMax: 60 };
  }

  let CFG   = worldConfig(900);
  let WORLD = { w: CFG.W, h: CFG.H };
  let VIEW  = viewFor(CFG);
  let HIT_R = CFG.hitR;

  function viewFor(c) {
    return {
      x0: -c.W * 0.065, x1: c.W * 1.04,
      y0: -c.H * 0.075, y1: c.H * 1.03
    };
  }

  /** Apply a config. Returns true when the world actually changed size. */
  function applyConfig(cssW) {
    const c = worldConfig(cssW);
    if (c.W === WORLD.w) return false;
    CFG = c;
    WORLD = { w: c.W, h: c.H };
    VIEW = viewFor(c);
    HIT_R = c.hitR;

    el.vel.max = el.velRange.max = c.vMax;
    if (getVel() > c.vMax) el.vel.value = el.velRange.value = c.vMax;
    return true;
  }

  // ---------- state ----------
  let map = null, solution = null, flight = null;
  let ghosts = [];
  let shots = 0, hits = 0, best = null;
  let difficulty = 1;

  const el = {
    vel: document.getElementById('vel'),
    velRange: document.getElementById('velRange'),
    ang: document.getElementById('ang'),
    angRange: document.getElementById('angRange'),
    fire: document.getElementById('fireBtn'),
    newMap: document.getElementById('newBtn'),
    hint: document.getElementById('hintBtn'),
    clear: document.getElementById('clearBtn'),
    diff: document.getElementById('diffBtns'),
    status: document.getElementById('statusLine'),
    readout: document.getElementById('readout'),
    shots: document.getElementById('shotCount'),
    hits: document.getElementById('hitCount'),
    best: document.getElementById('bestScore')
  };

  // ==========================================================
  // PHYSICS
  // ==========================================================

  function simulate(v, angleDeg, m, hitR, dt, keepPath) {
    const th  = angleDeg * Math.PI / 180;
    const vx  = v * Math.cos(th);
    const vy0 = v * Math.sin(th);
    const path = keepPath ? [{ x: 0, y: 0 }] : null;

    let t = 0;
    while (t < 40) {
      t += dt;
      const x = vx * t;
      const y = vy0 * t - 0.5 * G * t * t;
      if (keepPath) path.push({ x, y });

      if (Math.hypot(x - m.crab.x, y - m.crab.y) <= hitR)
        return { result: 'hit', t, x, y, path };

      for (let i = 0; i < m.walls.length; i++) {
        const w = m.walls[i];
        if (x >= w.x && x <= w.x + w.w && y >= w.y && y <= w.y + w.h)
          return { result: 'wall', t, x, y, path };
      }

      if (y < 0)       return { result: 'ground', t, x, y, path };
      if (x > VIEW.x1) return { result: 'out', t, x, y, path };
      if (y > WORLD.h * 6) return { result: 'out', t, x, y, path };
    }
    return { result: 'timeout', t, x: vx * t, y: 0, path };
  }

  /** Brute-force (v, θ) to prove the map is beatable. */
  function findSolutions(m, limit) {
    const found = [];
    const vHi = CFG.vMax;
    for (let v = V_MIN; v <= vHi; v += 1) {
      for (let a = 5; a <= 85; a += 1) {
        if (simulate(v, a, m, HIT_R * 0.72, 0.02, false).result === 'hit') {
          found.push({ v, angle: a });
          if (limit && found.length >= limit) return found;
        }
      }
    }
    return found;
  }

  // ==========================================================
  // MAP GENERATION
  // ==========================================================

  const rand  = (a, b) => a + Math.random() * (b - a);
  const randI = (a, b) => Math.floor(rand(a, b + 1));

  function buildCandidate(wallCount) {
    const W = WORLD.w, H = WORLD.h;
    const crab = { x: rand(W * 0.45, W * 0.92), y: rand(H * 0.10, H * 0.80) };

    const walls = [];
    const usedX = [];
    let guard = 0;

    while (walls.length < wallCount && guard++ < 60) {
      const wx = rand(W * 0.14, crab.x - W * 0.09);
      if (usedX.some(x => Math.abs(x - wx) < W * 0.1)) continue;

      const thick = rand(W * 0.026, W * 0.042);
      let w;
      if (Math.random() < 0.6) {
        w = { x: wx, y: 0, w: thick, h: rand(H * 0.22, H * 0.78), kind: 'pillar' };
      } else {
        const top = rand(H * 0.40, H * 0.92);
        const h   = rand(H * 0.22, H * 0.44);
        w = { x: wx, y: Math.max(H * 0.12, top - h), w: thick, h, kind: 'slab' };
      }

      const pad = HIT_R + W * 0.02;
      const buried =
        crab.x > w.x - pad && crab.x < w.x + w.w + pad &&
        crab.y > w.y - pad && crab.y < w.y + w.h + pad;
      if (buried) continue;

      walls.push(w);
      usedX.push(wx);
    }
    return { crab, walls };
  }

  function generateMap(wallCount) {
    for (let attempt = 0; attempt < 80; attempt++) {
      const cand = buildCandidate(wallCount);
      const sols = findSolutions(cand, 14);
      if (sols.length >= 4) { cand.solutions = sols; return cand; }
    }
    const open = {
      crab: { x: rand(WORLD.w * 0.5, WORLD.w * 0.88), y: rand(WORLD.h * 0.15, WORLD.h * 0.6) },
      walls: []
    };
    open.solutions = findSolutions(open, 6);
    return open;
  }

  function newMap() {
    map = generateMap(difficulty);
    solution = map.solutions[randI(0, map.solutions.length - 1)];
    flight = null; ghosts = []; shots = 0;
    updateScore();
    setStatus(
      `🦀 Kepiting di (${map.crab.x.toFixed(0)}, ${map.crab.y.toFixed(0)}) · ` +
      `${map.walls.length} halangan · peta sudah dicek bisa diselesaikan`, ''
    );
    updateReadout();
    draw();
  }

  // ==========================================================
  // DRAWING
  // ==========================================================

  let plot = { l: 34, r: 10, t: 10, b: 26, w: 0, h: 0 };

  function resize() {
    const cssW = canvas.parentElement.clientWidth;
    const changed = applyConfig(cssW);

    plot.l = cssW < 560 ? 30 : 40;
    plot.b = cssW < 560 ? 24 : 30;

    const cssH = Math.round(cssW * CFG.aspect);
    const dpr  = window.devicePixelRatio || 1;

    canvas.width  = Math.round(cssW * dpr);
    canvas.height = Math.round(cssH * dpr);
    canvas.style.height = cssH + 'px';
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    plot.w = cssW - plot.l - plot.r;
    plot.h = cssH - plot.t - plot.b;

    if (changed && map) newMap(); else draw();
  }

  const sx = x => plot.l + ((x - VIEW.x0) / (VIEW.x1 - VIEW.x0)) * plot.w;
  const sy = y => plot.t + plot.h - ((y - VIEW.y0) / (VIEW.y1 - VIEW.y0)) * plot.h;
  const scale = () => plot.w / (VIEW.x1 - VIEW.x0);

  function gridStep() {
    return WORLD.w <= 120 ? { minor: 10, major: 20 } : { minor: 10, major: 20 };
  }

  function drawGrid() {
    const st = gridStep();
    const small = plot.w < 340;
    ctx.lineWidth = 1;
    ctx.font = `${small ? 9 : 10}px "Segoe UI", sans-serif`;

    ctx.strokeStyle = 'rgba(150,225,255,.07)';
    ctx.beginPath();
    for (let x = 0; x <= WORLD.w; x += st.minor) { ctx.moveTo(sx(x), sy(VIEW.y0)); ctx.lineTo(sx(x), sy(VIEW.y1)); }
    for (let y = 0; y <= WORLD.h; y += st.minor) { ctx.moveTo(sx(VIEW.x0), sy(y)); ctx.lineTo(sx(VIEW.x1), sy(y)); }
    ctx.stroke();

    ctx.strokeStyle = 'rgba(150,225,255,.18)';
    ctx.beginPath();
    for (let x = 0; x <= WORLD.w; x += st.major) { ctx.moveTo(sx(x), sy(VIEW.y0)); ctx.lineTo(sx(x), sy(VIEW.y1)); }
    for (let y = 0; y <= WORLD.h; y += st.major) { ctx.moveTo(sx(VIEW.x0), sy(y)); ctx.lineTo(sx(VIEW.x1), sy(y)); }
    ctx.stroke();

    ctx.fillStyle = 'rgba(240,250,255,.5)';
    ctx.textAlign = 'center'; ctx.textBaseline = 'top';
    for (let x = 0; x <= WORLD.w; x += st.major) ctx.fillText(x, sx(x), sy(0) + 6);
    ctx.textAlign = 'right'; ctx.textBaseline = 'middle';
    for (let y = st.major; y <= WORLD.h; y += st.major) ctx.fillText(y, sx(VIEW.x0) - 3, sy(y));

    ctx.strokeStyle = 'rgba(255,201,60,.5)';
    ctx.lineWidth = 1.5;
    ctx.beginPath();
    ctx.moveTo(sx(VIEW.x0), sy(0)); ctx.lineTo(sx(VIEW.x1), sy(0));
    ctx.moveTo(sx(0), sy(VIEW.y0)); ctx.lineTo(sx(0), sy(VIEW.y1));
    ctx.stroke();

    ctx.fillStyle = 'rgba(255,201,60,.85)';
    ctx.font = `bold ${small ? 9 : 10}px "Segoe UI", sans-serif`;
    ctx.textAlign = 'right'; ctx.textBaseline = 'top';
    ctx.fillText('x (m)', sx(VIEW.x1) - 2, sy(0) + 6);
    ctx.textAlign = 'left';
    ctx.fillText('y (m)', sx(0) + 4, sy(VIEW.y1) + 1);
  }

  function drawWalls() {
    map.walls.forEach(w => {
      const x = sx(w.x), y = sy(w.y + w.h);
      const ww = Math.max(4, w.w * scale());
      const hh = w.h * (plot.h / (VIEW.y1 - VIEW.y0));

      const grad = ctx.createLinearGradient(x, y, x + ww, y + hh);
      grad.addColorStop(0, '#14567f');
      grad.addColorStop(1, '#0a3553');
      ctx.fillStyle = grad;
      ctx.strokeStyle = 'rgba(150,225,255,.4)';
      ctx.lineWidth = 1.4;
      ctx.beginPath();
      ctx.roundRect(x, y, ww, hh, 4);
      ctx.fill(); ctx.stroke();

      const cap = Math.max(13, Math.min(24, ww * 1.6));
      ctx.font = `${cap}px serif`;
      ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
      ctx.fillText(w.kind === 'pillar' ? '🪸' : '🪨', x + ww / 2, y - 1);
    });
  }

  /** Emoji sized off the hit radius so glyph and ring always agree. */
  function markerPx(mult) {
    return Math.max(15, Math.min(30, HIT_R * scale() * mult));
  }

  function drawCrab() {
    const cx = sx(map.crab.x), cy = sy(map.crab.y);
    const r  = HIT_R * scale();

    ctx.strokeStyle = 'rgba(255,201,60,.5)';
    ctx.setLineDash([4, 4]);
    ctx.lineWidth = 1.3;
    ctx.beginPath(); ctx.arc(cx, cy, r, 0, Math.PI * 2); ctx.stroke();
    ctx.setLineDash([]);

    ctx.font = `${markerPx(2.0)}px serif`;
    ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
    ctx.fillText('🦀', cx, cy);

    ctx.font = `bold ${plot.w < 340 ? 9 : 10}px "Segoe UI", sans-serif`;
    ctx.fillStyle = 'rgba(255,201,60,.92)';
    ctx.textBaseline = 'bottom';
    ctx.fillText(`(${map.crab.x.toFixed(0)}, ${map.crab.y.toFixed(0)})`, cx, cy - r - 3);
  }

  function drawPath(path, colour, width, upTo) {
    if (!path || path.length < 2) return;
    const end = upTo === undefined ? path.length : upTo;
    ctx.strokeStyle = colour;
    ctx.lineWidth = width;
    ctx.beginPath();
    ctx.moveTo(sx(path[0].x), sy(path[0].y));
    for (let i = 1; i < end && i < path.length; i++) ctx.lineTo(sx(path[i].x), sy(path[i].y));
    ctx.stroke();
  }

  /* The 🐝 glyph faces LEFT in every common emoji font, so it is
     mirrored, then rotated to point along its velocity vector. */
  function drawBee(x, y, vxw, vyw) {
    const phi = Math.atan2(-vyw, vxw);
    ctx.save();
    ctx.translate(sx(x), sy(y));
    ctx.scale(-1, 1);
    ctx.rotate(-phi);
    ctx.font = `${markerPx(1.7)}px serif`;
    ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
    ctx.fillText('🐝', 0, 0);
    ctx.restore();
  }

  function drawLauncher() {
    const px = sx(0), py = sy(0);
    const th = getAngle() * Math.PI / 180;
    const len = Math.max(26, plot.w * 0.11);

    ctx.strokeStyle = 'rgba(255,201,60,.6)';
    ctx.setLineDash([5, 5]);
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.moveTo(px, py);
    ctx.lineTo(px + Math.cos(th) * len, py - Math.sin(th) * len);
    ctx.stroke();
    ctx.setLineDash([]);

    if (!flight) drawBee(0, 0, Math.cos(th), Math.sin(th));
  }

  function draw() {
    if (!map) return;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawGrid();
    drawWalls();
    drawCrab();
    ghosts.forEach(g => drawPath(g, 'rgba(240,250,255,.16)', 1.4));

    if (flight) {
      drawPath(flight.path, 'rgba(255,201,60,.95)', 2.2, flight.index);
      const p = flight.path[Math.min(flight.index, flight.path.length - 1)];
      const th = flight.angle * Math.PI / 180;
      drawBee(p.x, p.y, flight.v * Math.cos(th), flight.v * Math.sin(th) - G * flight.t);
    }
    drawLauncher();
  }

  // ==========================================================
  // SHOOTING
  // ==========================================================

  function fire() {
    if (flight) return;
    const v = getVel(), a = getAngle();
    const res = simulate(v, a, map, HIT_R, 0.008, true);
    shots++;
    flight = { path: res.path, index: 0, v, angle: a, t: 0, res };
    el.fire.disabled = true;
    updateScore();
    animate();
  }

  let rafId = null;
  function animate() {
    flight.index += 3;
    flight.t = flight.index * 0.008;
    if (flight.index >= flight.path.length) { finishShot(); return; }
    draw();
    rafId = requestAnimationFrame(animate);
  }

  function finishShot() {
    cancelAnimationFrame(rafId);
    const r = flight.res;

    if (r.result === 'hit') {
      hits++;
      if (best === null || shots < best) best = shots;
      setStatus(`🎯 Kena! Selesai dalam ${shots} tembakan. Tekan “Peta Baru” untuk tantangan berikutnya.`, 'hit');
    } else {
      const why = {
        wall:    '🪸 Menabrak halangan',
        ground:  `🌊 Jatuh ke air di x ≈ ${r.x.toFixed(1)} m`,
        out:     '➡️ Terbang melewati lapangan',
        timeout: '⏱️ Tembakan tidak sampai'
      }[r.result] || 'Meleset';
      setStatus(`${why}. Coba lagi.`, 'miss');
      ghosts.push(flight.path);
      if (ghosts.length > 6) ghosts.shift();
    }

    flight = null;
    el.fire.disabled = false;
    updateScore();
    draw();
  }

  // ==========================================================
  // READOUT
  // ==========================================================

  function updateReadout() {
    if (!map) return;
    const v = getVel(), a = getAngle();
    const th = a * Math.PI / 180;

    const vx  = v * Math.cos(th);
    const vy0 = v * Math.sin(th);
    const R   = (v * v * Math.sin(2 * th)) / G;
    const H   = (vy0 * vy0) / (2 * G);
    const T   = (2 * vy0) / G;

    const vMin = Math.sqrt(G * (map.crab.y + Math.hypot(map.crab.x, map.crab.y)));

    el.readout.innerHTML = `
      <div class="ro"><span>vₓ tetap</span><b>${vx.toFixed(1)} m/s</b></div>
      <div class="ro"><span>v y awal</span><b>${vy0.toFixed(1)} m/s</b></div>
      <div class="ro"><span>Jangkauan R</span><b>${R.toFixed(1)} m</b></div>
      <div class="ro"><span>Tinggi H</span><b>${H.toFixed(1)} m</b></div>
      <div class="ro"><span>Waktu T</span><b>${T.toFixed(2)} s</b></div>
      <div class="ro ${v >= vMin ? 'ok' : 'warn'}"><span>v minimum</span><b>${vMin.toFixed(1)} m/s</b></div>`;
  }

  // ==========================================================
  // UI
  // ==========================================================

  const clamp = (n, lo, hi) => Math.min(hi, Math.max(lo, n));
  const getVel   = () => clamp(parseFloat(el.vel.value) || V_MIN, V_MIN, CFG.vMax);
  const getAngle = () => clamp(parseFloat(el.ang.value) || A_MIN, A_MIN, A_MAX);

  function setStatus(text, cls) {
    el.status.textContent = text;
    el.status.className = cls || '';
  }

  function updateScore() {
    el.shots.textContent = shots;
    el.hits.textContent  = hits;
    el.best.textContent  = best === null ? '—' : best;
  }

  function syncPair(numEl, rangeEl) {
    const push = () => { updateReadout(); draw(); };
    numEl.addEventListener('input',  () => { rangeEl.value = numEl.value; push(); });
    rangeEl.addEventListener('input', () => { numEl.value = rangeEl.value; push(); });
    numEl.addEventListener('change', () => {
      numEl.value = (numEl === el.vel ? getVel() : getAngle());
      rangeEl.value = numEl.value; push();
    });
  }
  syncPair(el.vel, el.velRange);
  syncPair(el.ang, el.angRange);

  /* Tap the field to aim — the primary input on a touchscreen. */
  canvas.addEventListener('pointerdown', e => {
    if (flight) return;
    const r  = canvas.getBoundingClientRect();
    const mx = e.clientX - r.left, my = e.clientY - r.top;
    const wx = VIEW.x0 + ((mx - plot.l) / plot.w) * (VIEW.x1 - VIEW.x0);
    const wy = VIEW.y0 + ((plot.t + plot.h - my) / plot.h) * (VIEW.y1 - VIEW.y0);
    if (wx <= 1) return;
    const a = clamp(Math.atan2(wy, wx) * 180 / Math.PI, A_MIN, A_MAX);
    el.ang.value = el.angRange.value = a.toFixed(1);
    updateReadout(); draw();
  });

  el.fire.addEventListener('click', fire);
  el.newMap.addEventListener('click', newMap);
  el.clear.addEventListener('click', () => { ghosts = []; draw(); });

  el.hint.addEventListener('click', () => {
    if (!solution) return;
    el.vel.value = el.velRange.value = solution.v;
    el.ang.value = el.angRange.value = solution.angle;
    updateReadout(); draw();
    setStatus(`💡 Salah satu jawaban benar: v₀ = ${solution.v} m/s, θ = ${solution.angle}°. Masih ada jawaban lain.`, '');
  });

  el.diff.addEventListener('click', e => {
    const btn = e.target.closest('button');
    if (!btn) return;
    difficulty = parseInt(btn.dataset.diff, 10);
    [...el.diff.children].forEach(b => b.classList.toggle('on', b === btn));
    best = null; hits = 0;
    newMap();
  });

  document.addEventListener('keydown', e => {
    if (e.key === 'Enter' && !el.fire.disabled) fire();
  });

  /* Debounced, and ignores the soft-keyboard height change that
     fires a resize on mobile whenever a number input is focused. */
  let lastW = 0, resizeTimer = null;
  window.addEventListener('resize', () => {
    const w = canvas.parentElement.clientWidth;
    if (w === lastW) return;
    lastW = w;
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(resize, 120);
  });

  if (!ctx.roundRect) {
    CanvasRenderingContext2D.prototype.roundRect = function (x, y, w, h, r) {
      r = Math.min(r, w / 2, h / 2);
      this.moveTo(x + r, y);
      this.arcTo(x + w, y, x + w, y + h, r);
      this.arcTo(x + w, y + h, x, y + h, r);
      this.arcTo(x, y + h, x, y, r);
      this.arcTo(x, y, x + w, y, r);
      this.closePath();
      return this;
    };
  }

  // ---------- start ----------
  lastW = canvas.parentElement.clientWidth;
  applyConfig(lastW);
  plot.l = lastW < 560 ? 30 : 40;
  plot.b = lastW < 560 ? 24 : 30;
  newMap();
  resize();
})();