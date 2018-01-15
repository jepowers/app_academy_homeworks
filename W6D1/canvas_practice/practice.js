document.addEventListener("DOMContentLoaded", function(){
  const canv = document.getElementById("mycanvas");

  canv.width = 500;
  canv.height = 500;

  const ctx = canv.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect = (0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(50, 50 , 50, 0 , 2*Math.PI, false);
  ctx.strokeStyle("orange");
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "red";
  ctx.fill();

});
