var countDownDate = new Date("Sep 8, 2024 23:59:59").getTime();
var x = setInterval(function() {
  var now = new Date().getTime();
  var distance = countDownDate - now;
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  document.getElementById("demo").innerHTML = days + " : " + hours + " : "
  + minutes + " : " + seconds;
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "SELESAI";
  }
}, 1000);
