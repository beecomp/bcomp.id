/* ==========================================================
   BEE BALLISTICS — projectile mini game
   Launch point is exactly (0, 0) so every standard
   projectile formula applies without adjustment.
   ========================================================== */

(function () {
  'use strict';

  const canvas = document.getElementById('field');
  if (!canvas) return;                       // page doesn't have the game
  const ctx = canvas.getContext('2d');

  // ---------- constants ----------
  const G = 10;                              // m/s²
  const WORLD = { w: 200, h: 120 };          // playable metres
  const VIEW  = { x0: -12, x1: 208, y0: -9, y1: 124 };  // drawn metres (padding for axes)

  const HIT_R        = 4.5;   // metres — generous during play
  const VERIFY_HIT_R = 3.2;   // stricter during solvability check, so a verified map is always winnable
  const V_MIN = 10, V_MAX = 60;
  const A_MIN = 1,  A_MAX = 89;

  // ---------- state ----------
  let map      = null;
  let solution = null;        // one verified {v, angle}
  let flight   = null;        // active shot
  let ghosts   = [];          // faded previous trajectories
  let shots = 0, hits = 0, best = null;
  let difficulty = 1;
  let hintShown = false;

  // ---------- element refs ----------
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

  /**
   * Simulate one shot from (0,0).
   * Returns { result, t, x, y, path } where result is one of
   * 'hit' | 'wall' | 'ground' | 'out' | 'timeout'.
   */
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

      // target
      if (Math.hypot(x - m.crab.x, y - m.crab.y) <= hitR)
        return { result: 'hit', t, x, y, path };

      // obstacles
      for (let i = 0; i < m.walls.length; i++) {
        const w = m.walls[i];
        if (x >= w.x && x <= w.x + w.w && y >= w.y && y <= w.y + w.h)
          return { result: 'wall', t, x, y, path };
      }

      if (y < 0)          return { result: 'ground', t, x, y, path };
      if (x > VIEW.x1)    return { result: 'out',    t, x, y, path };
      if (y > 600)        return { result: 'out',    t, x, y, path };
    }
    return { result: 'timeout', t, x: vx * t, y: 0, path };
  }

  /**
   * Brute-force the (v, θ) space to prove a map is beatable.
   * Returns an array of working {v, angle} pairs.
   */
  function findSolutions(m, limit) {
    const found = [];
    for (let v = V_MIN; v <= V_MAX; v += 1) {
      for (let a = 5; a <= 85; a += 1) {
        if (simulate(v, a, m, VERIFY_HIT_R, 0.02, false).result === 'hit') {
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
    const crab = {
      x: rand(85, 182),
      y: rand(10, 92)
    };

    const walls = [];
    const usedX = [];
    let guard = 0;

    while (walls.length < wallCount && guard++ < 60) {
      const wx = rand(26, crab.x - 16);
      if (usedX.some(x => Math.abs(x - wx) < 20)) continue;   // keep them spread out

      let w;
      if (Math.random() < 0.6) {
        // coral pillar rising from the seabed
        w = { x: wx, y: 0, w: rand(5, 8), h: rand(28, 92), kind: 'pillar' };
      } else {
        // floating rock slab
        const top = rand(46, 108);
        const h   = rand(26, 52);
        w = { x: wx, y: Math.max(14, top - h), w: rand(5, 8), h, kind: 'slab' };
      }

      // never bury the crab inside an obstacle
      const pad = HIT_R + 4;
      const overlaps =
        crab.x > w.x - pad && crab.x < w.x + w.w + pad &&
        crab.y > w.y - pad && crab.y < w.y + w.h + pad;
      if (overlaps) continue;

      walls.push(w);
      usedX.push(wx);
    }

    return { crab, walls };
  }

  /** Generate a map and guarantee it can actually be beaten. */
  function generateMap(wallCount) {
    for (let attempt = 0; attempt < 80; attempt++) {
      const candidate = buildCandidate(wallCount);
      const sols = findSolutions(candidate, 14);
      // demand a few distinct solutions so the map isn't a pixel-perfect fluke
      if (sols.length >= 4) {
        candidate.solutions = sols;
        return candidate;
      }
    }
    // extremely unlikely fallback: an open map with no obstacles
    const open = { crab: { x: rand(90, 170), y: rand(15, 70) }, walls: [] };
    open.solutions = findSolutions(open, 6);
    return open;
  }

  function newMap() {
    map = generateMap(difficulty);
    solution = map.solutions[randI(0, map.solutions.length - 1)];
    flight = null;
    ghosts = [];
    shots = 0;
    hintShown = false;
    updateScore();
    setStatus(
      `🦀 Kepiting di (${map.crab.x.toFixed(0)} m, ${map.crab.y.toFixed(0)} m) · ` +
      `${map.walls.length} halangan · peta terverifikasi bisa diselesaikan`, ''
    );
    updateReadout();
    draw();
  }

  // ==========================================================
  // DRAWING
  // ==========================================================

  let plot = { l: 40, r: 12, t: 12, b: 30, w: 0, h: 0 };

  function resize() {
    const cssW = canvas.parentElement.clientWidth;
    // narrow screens get a taller aspect ratio so the field
    // isn't squashed into a thin strip
    const ratio = cssW < 480 ? 0.85 : cssW < 700 ? 0.68 : 0.58;
    const cssH = Math.round(cssW * ratio);
    const dpr  = window.devicePixelRatio || 1;

    canvas.width  = Math.round(cssW * dpr);
    canvas.height = Math.round(cssH * dpr);
    canvas.style.height = cssH + 'px';
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    plot.w = cssW - plot.l - plot.r;
    plot.h = cssH - plot.t - plot.b;
    draw();
  }

  const sx = x => plot.l + ((x - VIEW.x0) / (VIEW.x1 - VIEW.x0)) * plot.w;
  const sy = y => plot.t + plot.h - ((y - VIEW.y0) / (VIEW.y1 - VIEW.y0)) * plot.h;
  const scale = () => plot.w / (VIEW.x1 - VIEW.x0);   // px per metre

  function drawGrid() {
    ctx.lineWidth = 1;
    ctx.font = '10px "Segoe UI", sans-serif';

    // minor grid every 10 m
    ctx.strokeStyle = 'rgba(150,225,255,.07)';
    ctx.beginPath();
    for (let x = 0; x <= WORLD.w; x += 10) { ctx.moveTo(sx(x), sy(VIEW.y0)); ctx.lineTo(sx(x), sy(VIEW.y1)); }
    for (let y = 0; y <= WORLD.h; y += 10) { ctx.moveTo(sx(VIEW.x0), sy(y)); ctx.lineTo(sx(VIEW.x1), sy(y)); }
    ctx.stroke();

    // major grid every 20 m + labels
    ctx.strokeStyle = 'rgba(150,225,255,.17)';
    ctx.fillStyle   = 'rgba(240,250,255,.5)';
    ctx.beginPath();
    for (let x = 0; x <= WORLD.w; x += 20) { ctx.moveTo(sx(x), sy(VIEW.y0)); ctx.lineTo(sx(x), sy(VIEW.y1)); }
    for (let y = 0; y <= WORLD.h; y += 20) { ctx.moveTo(sx(VIEW.x0), sy(y)); ctx.lineTo(sx(VIEW.x1), sy(y)); }
    ctx.stroke();

    ctx.textAlign = 'center'; ctx.textBaseline = 'top';
    for (let x = 0; x <= WORLD.w; x += 20) ctx.fillText(x, sx(x), sy(0) + 7);
    ctx.textAlign = 'right'; ctx.textBaseline = 'middle';
    for (let y = 20; y <= WORLD.h; y += 20) ctx.fillText(y, sx(VIEW.x0) - 4, sy(y));

    // axes
    ctx.strokeStyle = 'rgba(255,201,60,.5)';
    ctx.lineWidth = 1.5;
    ctx.beginPath();
    ctx.moveTo(sx(VIEW.x0), sy(0)); ctx.lineTo(sx(VIEW.x1), sy(0));   // seabed / x-axis
    ctx.moveTo(sx(0), sy(VIEW.y0)); ctx.lineTo(sx(0), sy(VIEW.y1));   // y-axis
    ctx.stroke();

    // axis captions
    ctx.fillStyle = 'rgba(255,201,60,.85)';
    ctx.font = 'bold 10px "Segoe UI", sans-serif';
    ctx.textAlign = 'right'; ctx.textBaseline = 'top';
    ctx.fillText('x (m)', sx(VIEW.x1) - 2, sy(0) + 7);
    ctx.textAlign = 'left'; ctx.textBaseline = 'top';
    ctx.fillText('y (m)', sx(0) + 5, sy(VIEW.y1) + 2);
  }

  function drawWalls() {
    map.walls.forEach(w => {
      const x = sx(w.x), y = sy(w.y + w.h);
      const ww = w.w * scale();
      const hh = w.h * (plot.h / (VIEW.y1 - VIEW.y0));

      const grad = ctx.createLinearGradient(x, y, x + ww, y + hh);
      grad.addColorStop(0, '#14567f');
      grad.addColorStop(1, '#0a3553');
      ctx.fillStyle = grad;
      ctx.strokeStyle = 'rgba(150,225,255,.4)';
      ctx.lineWidth = 1.5;
      ctx.beginPath();
      ctx.roundRect(x, y, ww, hh, 4);
      ctx.fill(); ctx.stroke();

      // themed cap
      ctx.font = `${Math.max(13, ww * 1.5)}px serif`;
      ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
      ctx.fillText(w.kind === 'pillar' ? '🪸' : '🪨', x + ww / 2, y - 2);
    });
  }

  function drawCrab() {
    const cx = sx(map.crab.x), cy = sy(map.crab.y);
    const r  = HIT_R * scale();
    const fontPx = 26 * (scale() / 5.7);

    // hit-radius ring so the margin for error is visible
    ctx.strokeStyle = 'rgba(255,201,60,.45)';
    ctx.setLineDash([4, 4]);
    ctx.lineWidth = 1.2;
    ctx.beginPath(); ctx.arc(cx, cy, r, 0, Math.PI * 2); ctx.stroke();
    ctx.setLineDash([]);

    ctx.font = `${fontPx}px serif`;
    ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
    ctx.fillText('🦀', cx, cy);

    // coordinate label
    ctx.font = 'bold 10px "Segoe UI", sans-serif';
    ctx.fillStyle = 'rgba(255,201,60,.9)';
    ctx.textBaseline = 'bottom';
    ctx.fillText(`(${map.crab.x.toFixed(0)}, ${map.crab.y.toFixed(0)})`, cx, cy - r - 4);
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

  /**
   * The 🐝 glyph faces LEFT in essentially every emoji font, so it is
   * mirrored horizontally and then rotated to face along its velocity.
   */
  function drawBee(x, y, vxw, vyw) {
    const px = sx(x), py = sy(y);
    const phi = Math.atan2(-vyw, vxw);   // screen angle (canvas y grows downward)
    const fontPx = 22 * (scale() / 5.7);

    ctx.save();
    ctx.translate(px, py);
    ctx.scale(-1, 1);                    // now the glyph points along +x
    ctx.rotate(-phi);                    // mirrored frame reverses rotation sense
    ctx.font = `${fontPx}px serif`;
    ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
    ctx.fillText('🐝', 0, 0);
    ctx.restore();
  }

  function drawLauncher() {
    const px = sx(0), py = sy(0);
    const th = getAngle() * Math.PI / 180;
    const len = 34;

    // aim guide
    ctx.strokeStyle = 'rgba(255,201,60,.55)';
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
      const vx = flight.v * Math.cos(th);
      const vy = flight.v * Math.sin(th) - G * flight.t;
      drawBee(p.x, p.y, vx, vy);
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
    const STEP = 3;                       // path points consumed per frame
    flight.index += STEP;
    flight.t = flight.index * 0.008;

    if (flight.index >= flight.path.length) {
      finishShot();
      return;
    }
    draw();
    rafId = requestAnimationFrame(animate);
  }

  function finishShot() {
    cancelAnimationFrame(rafId);
    const r = flight.res;

    if (r.result === 'hit') {
      hits++;
      if (best === null || shots < best) best = shots;
      setStatus(`🎯 Kena! Kepiting tertembak dalam ${shots} tembakan. Tekan “Peta Baru” untuk tantangan berikutnya.`, 'hit');
    } else {
      const why = {
        wall:    '🪸 Menabrak halangan',
        ground:  `🌊 Jatuh ke air di x ≈ ${r.x.toFixed(1)} m`,
        out:     '➡️ Terbang melewati batas lapangan',
        timeout: '⏱️ Tembakan tidak sampai'
      }[r.result] || 'Meleset';
      setStatus(`${why} — coba lagi.`, 'miss');
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

    const cx = map.crab.x, cy = map.crab.y;
    const vMin = Math.sqrt(G * (cy + Math.hypot(cx, cy)));
    const reachable = v >= vMin;

    el.readout.innerHTML = `
      <div class="ro"><span>vₓ (tetap)</span><b>${vx.toFixed(1)} m/s</b></div>
      <div class="ro"><span>v_y0 (awal)</span><b>${vy0.toFixed(1)} m/s</b></div>
      <div class="ro"><span>Jangkauan R</span><b>${R.toFixed(1)} m</b></div>
      <div class="ro"><span>Titik tertinggi H</span><b>${H.toFixed(1)} m</b></div>
      <div class="ro"><span>Waktu terbang T</span><b>${T.toFixed(2)} s</b></div>
      <div class="ro ${reachable ? 'ok' : 'warn'}">
        <span>v minimum</span><b>${vMin.toFixed(1)} m/s</b>
      </div>`;
  }

  // ==========================================================
  // HELPERS + UI WIRING
  // ==========================================================

  const clamp = (n, lo, hi) => Math.min(hi, Math.max(lo, n));
  const getVel   = () => clamp(parseFloat(el.vel.value) || V_MIN, V_MIN, V_MAX);
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
    numEl.addEventListener('input', () => {
      rangeEl.value = numEl.value;
      updateReadout(); draw();
    });
    rangeEl.addEventListener('input', () => {
      numEl.value = rangeEl.value;
      updateReadout(); draw();
    });
    numEl.addEventListener('change', () => {
      numEl.value = numEl === el.vel ? getVel() : getAngle();
      rangeEl.value = numEl.value;
      updateReadout(); draw();
    });
  }

  syncPair(el.vel, el.velRange);
  syncPair(el.ang, el.angRange);

  el.fire.addEventListener('click', fire);
  el.newMap.addEventListener('click', newMap);
  el.clear.addEventListener('click', () => { ghosts = []; draw(); });

  el.hint.addEventListener('click', () => {
    if (!solution) return;
    hintShown = true;
    el.vel.value = el.velRange.value = solution.v;
    el.ang.value = el.angRange.value = solution.angle;
    updateReadout(); draw();
    setStatus(`💡 Salah satu jawaban benar: v₀ = ${solution.v} m/s, θ = ${solution.angle}°. Masih ada solusi lain — coba cari sendiri!`, '');
  });

  el.diff.addEventListener('click', e => {
    const btn = e.target.closest('button');
    if (!btn) return;
    difficulty = parseInt(btn.dataset.diff, 10);
    [...el.diff.children].forEach(b => b.classList.toggle('on', b === btn));
    best = null;
    hits = 0;
    newMap();
  });

  document.addEventListener('keydown', e => {
    if (e.key === 'Enter' && !el.fire.disabled) fire();
  });

  window.addEventListener('resize', resize);

  // prevent double-tap-to-zoom on the game buttons specifically
  [el.fire, el.newMap, el.hint, el.clear].forEach(btn => {
    btn.addEventListener('touchend', e => e.preventDefault(), { passive: false });
  });

  // roundRect polyfill for older browsers
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

  // ---------- go ----------
  newMap();
  resize();
})();