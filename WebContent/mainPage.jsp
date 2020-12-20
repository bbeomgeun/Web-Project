<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>벽돌부수기 메인 페이지</title>
<style>
	body{
		text-align: center;
		color: black;
		background-color: black;
		width : 100%;
		height : 100%;
		margin : 0 auto;
	}
	#board{
		background-color: white;
		margin : 0 auto;
		height : 1300px;
		width : 1200px;
	}
	
	div#wrapper{
		width:90%;
		text-align : left;
		min-height : 300px;
		margin : 0 auto;
	}
	
	header {
		height : 40%;
		background-color: WHITE;
		border-top:2px solid black;
		border-bottom : 2px solid black;
	}

	canvas { background-color : black ; display: block; margin : 0 auto;}
	
	div.button{
	  text-align: center;
   }
</style>
</head>

<body>
<div id = "board">
	<div id="wrapper">
	<div id = "mainTop"><h1>벽돌 부수기 게임 홈페이지</h1></div>
	<%String sessionId = (String)session.getAttribute("sessionID");
	String sessionNickName = (String)session.getAttribute("sessionNickname");%>
	
	<h4>ID = <%=sessionId%></h4>
	<header>
		<form method="post" action="logout.jsp"> 
			닉네임 : <%=sessionNickName %>님 환영합니다
			<input type="submit" value="로그아웃" />
		</form>
		<ul>
			<li><a href = "mainPage.jsp">게임 페이지</a></li>
			<li><a href = "rankingPage.jsp">랭킹 페이지</a></li>
			<li><a href="communityPage.jsp">한줄 평 게시판</a></li>
		</ul>
		<canvas id = "myCanvas" width = "480" height = "320"></canvas><p>
		<div class="button">
			<button onclick = "gameStart()" >게임 시작하기</button>
			<button onclick = "reload()" display: block>게임 재시작하기</button><p>
		</div>
	<hr>
	
	<div class="button">
		<h3>랭킹 저장</h3>
		<form id = "recordForm" method="post" action="recordSave.jsp" >
			닉네임 : <input type = "text" id = "nickName" name = "nickName" value = <%=sessionNickName %>><p>
			스코어 : <input type = "text" id = "score" name = "score">
			<input type = "submit" value="랭킹에 저장하기">
		</form>
	</div>
	</header>
	</div>
</div>

<script type="text/javascript">
	function reload(){
		document.location.reload();
	}
	var canvas = document.getElementById("myCanvas");
	var ctx = canvas.getContext("2d");
	var scoreBoard = document.getElementById("score");
	var form = document.getElementById("recordForm");
	
	
	var gameScore = 0;
	
	var x = canvas.width/2;
	var y = canvas.height-30;
	var dx = 2;
	var dy = -2;
	var ballRadius = 10;
	var paddleHeight = 10;
	var paddleWidth = 100;
	var paddleX = (canvas.width-paddleWidth)/2;
	var rightPressed = false;
	var leftPressed = false;
	
	var brickRowCount = 5;
	var brickColumnCount = 5;
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
			bricks[c][r] = {x:0, y:0, status : 3};
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
				if(b.status > 0){
					if(x > b.x && x < b.x + brickWidth && y > b.y && y < b.y + brickHeight){
						dy = -dy;
						b.status--;;
						gameScore++;
					  	if(score == brickRowCount*brickColumnCount*3) {
	                        alert("YOU WIN, CONGRATULATIONS!");
	                        record();
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
		ctx.fillStyle = "white";
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
			for(var r = 0; r < brickRowCount ; r++){
				if(bricks[c][r].status > 0){
					var brickX = (c*(brickWidth+brickPadding))+brickOffsetLeft;
					var brickY = (r*(brickHeight+brickPadding))+brickOffsetTop;
					bricks[c][r].x = brickX;
					bricks[c][r].y = brickY;
					ctx.beginPath();
					ctx.rect(brickX, brickY, brickWidth, brickHeight);
					if(bricks[c][r].status == 3)
						ctx.fillStyle = "red";
					else if(bricks[c][r].status == 2)
						ctx.fillStyle = "orange";
					else if(bricks[c][r].status == 1)
						ctx.fillStyle = "yellow";
					ctx.fill();
					ctx.closePath();
				}
			}
		}
	}
	
	function writeScore() {
	    ctx.font = "16px Arial";
	    ctx.fillStyle = "#0095DD";
	    ctx.fillText("Score: "+gameScore, 8, 20);
	}
	
	function draw() {
		if(start){
			scoreBoard.value = gameScore;
			
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
					record();
				}
			}
			
			if(rightPressed && paddleX + paddleWidth <  canvas.width)
				paddleX += 7;
			else if(leftPressed && paddleX > 0)
				paddleX -= 7;
		}
		function record(){
			alert("랭킹에 남기고 싶으면 하단의 랭킹 제출 버튼을 누르세요!");
		}
	}
</script>

</body>
</html>