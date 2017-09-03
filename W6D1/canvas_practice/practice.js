document.addEventListener("DOMContentLoaded", function(){
	var canvas = document.getElementById('mycanvas')
	var ctx = canvas.getContext('2d');
	canvas.height = 500;
	canvas.width = 500;
	ctx.fillStyle = 'red';
	ctx.fillRect(50, 50, 50, 50);

	ctx.beginPath();
	ctx.arc(75, 75, 50, 0, 2 * Math.PI);
	ctx.lineWidth = 1;
	ctx.stroke();

	ctx.beginPath();
	ctx.fillStyle = 'blue'
  ctx.moveTo(0, 50);
  ctx.lineTo(100, 75);
  ctx.lineTo(100, 25);
  ctx.fill();
});
