<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<style>
		* { padding : 0; margin : 0;}
		canvas { background : #eee; display: block; margin : 0 auto;}
	</style>
</head>
<body>
<form method="post" action="mainPage.jsp">
	<canvas id = "myCanvas" width = "480" height = "320"></canvas>
</form>
x위치 : <input type = "text" id = "x"><p>
y위치 : <input type = "text" id = "y"><p>
점수  : <input type = "text" id = "score"><p>
<button onclick = "gameStart()">게임 시작하기</button>

<script type="text/javascript">
	var canvas = document.getElementById("myCanvas");
	var ctx = canvas.getContext("2d");
	var whereX = document.getElementById("x");
	var whereY = document.getElementById("y");
	var scoreBoard = document.getElementById("score");

	var score = 0;
	
	var x = canvas.width/2;
	var y = canvas.height-30;
	var dx = 2;
	var dy = -2;
	var ballRadius = 10;
	var paddleHeight = 10;
	var paddleWidth = 75;
	var paddleX = (canvas.width-paddleWidth)/2;
	var rightPressed = false;
	var leftPressed = false;
	
	var brickRowCount = 5;
	var brickColumnCount = 3;
	var brickWidth = 75;
	var brickHeight = 20;
	var brickPadding = 10;
	var brickOffsetTop = 30;
	var brickOffsetLeft = 30;

	var start = false;
	
	var motor = setInterval(draw, 10);
	
	function gameStart() {
		start = true;
	}
	
	var bricks = [];
	for(var c = 0 ; c < brickColumnCount; c++){
		bricks[c] = [];
		for(var r = 0 ; r<brickRowCount ; r++){
			bricks[c][r] = {x:0, y:0, status : 1};
		}
	}
	
	document.addEventListener("keydown", keyDownHandler, false);
	document.addEventListener("keyup", keyUpHandler, false);
	
	function keyDownHandler(e) {
		if(e.keyCode == 39){
			rightPressed = true;
		}
		else if(e.keyCode == 37){
			leftPressed = true;
		}
	}
	
	function keyUpHandler(e) {
		if(e.keyCode == 39){
			rightPressed = false;
		}
		else if(e.keyCode == 37){
			leftPressed = false;
		}
	}
	
	function collisionDetection() {
		for(var c = 0 ; c<brickColumnCount ; c++){
			for(var r =0 ; r<brickRowCount ; r++){
				var b = bricks[c][r];
				if(b.status == 1){
					if(x > b.x && x < b.x+brickWidth && y > b.y && y < b.y+brickHeight){
						dy = -dy;
						b.status = 0;
						score++;
					  	if(score == brickRowCount*brickColumnCount) {
	                        alert("YOU WIN, CONGRATULATIONS!");
	                        confirm("결과를 순위에 기록할까요?");
	                        clearInterval(motor);
						}
					}
				}
			}
		}
	}
	
	function makeBall(){
		ctx.beginPath();
		ctx.arc(x,y, ballRadius, 0, Math.PI*2);
		ctx.fillStyle = "#0095DD";
		ctx.fill();
		ctx.closePath();
	}
	
	function makePaddle() {
		ctx.beginPath();
		ctx.rect(paddleX, canvas.height-paddleHeight, paddleWidth, paddleHeight);
		//x, y, 너비, 높이
		ctx.fillStyle = "#0095DD";
		ctx.fill();
		ctx.closePath();
	}
	
	function makeBricks() {
		for(var c = 0 ; c < brickColumnCount ; c++){
			for(var r = 0; r<brickRowCount ; r++){
				if(bricks[c][r].status == 1){
					var brickX = (c*(brickWidth+brickPadding))+brickOffsetLeft;
					var brickY = (r*(brickHeight+brickPadding))+brickOffsetTop;
					bricks[c][r].x = brickX;
					bricks[c][r].y = brickY;
					ctx.beginPath();
					ctx.rect(brickX, brickY, brickWidth, brickHeight);
					ctx.fillStyl = "#0095DD";
					ctx.fill();
					ctx.closePath();
				}
			}
		}
	}
	
	function writeScore() {
	    ctx.font = "16px Arial";
	    ctx.fillStyle = "#0095DD";
	    ctx.fillText("Score: "+score, 8, 20);
	}
	
	function draw() {
		if(start == true){
			whereX.value = x;
			whereY.value = y;
			scoreBoard.value = score;
			
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			makeBricks();
			makeBall();
			makePaddle();
			collisionDetection();
			writeScore();
			
			x += dx;
			y += dy;
			
			if(x + dx > canvas.width-ballRadius || x + dx < ballRadius){  
				dx = -dx;	}
			if(y + dy < ballRadius){
				dy = -dy;}
			else if(y + dy > canvas.height- ballRadius){ // 땅으로 떨어지는데
				if(x > paddleX && x < paddleX + paddleWidth){ // 그때 패들사이에 있으면 방향을 바꿔준다.
					dy = -dy;
					
					// 패들 닿았을때 빠르게 하고 싶으면 dx += 1; dy -= 1;
				}
				else{
					alert("GAME OVER");
					clearInterval(motor); // 게임 종료
					confirm("결과를 순위에 기록할까요?");
					document.location.reload();
				}
			}
			
			if(rightPressed && paddleX + paddleWidth <  canvas.width)
				paddleX += 7;
			else if(leftPressed && paddleX > 0)
				paddleX -= 7;
		}
		function record(){
			var answer = confirm("결과를 순위에 기록할까요?");
			
			if(answer){
				
			}
		}
	}
</script>

</body>
</html>