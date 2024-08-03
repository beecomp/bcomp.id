var countDownDate = new Date("Sep 8, 2024 23:59:59").getTime();
var x = setInterval(function() {
  var now = new Date().getTime();
  var distance = countDownDate - now;
  var ndays = Math.floor(distance / (1000 * 60 * 60 * 24));
  var nhours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var nminutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var nseconds = Math.floor((distance % (1000 * 60)) / 1000);
  let days = String(ndays);
  let hours = String(nhours);
  let minutes = String(nminutes);
  let seconds = String(nseconds);
  if (hours.length == 0) {
    hours = "0" + hours;
  }
  if (minutes.length == 0) {
    minutes = "0" + minutes;
  }
  if (seconds.length == 0) {
    seconds = "0" + seconds;
  }
  document.getElementById("demo").innerHTML = days + " : " + hours + " : "
  + minutes + " : " + seconds;
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "SELESAI";
  }
}, 1000);
