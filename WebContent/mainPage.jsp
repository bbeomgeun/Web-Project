<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����μ��� ���� ������</title>
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
	<div id = "mainTop"><h1>���� �μ��� ���� Ȩ������</h1></div>
	<%String sessionId = (String)session.getAttribute("sessionID");
	String sessionNickName = (String)session.getAttribute("sessionNickname");%>
	
	<h4>ID = <%=sessionId%></h4>
	<header>
		<form method="post" action="logout.jsp"> 
			�г��� : <%=sessionNickName %>�� ȯ���մϴ�
			<input type="submit" value="�α׾ƿ�" />
		</form>
		<ul>
			<li><a href = "mainPage.jsp">���� ������</a></li>
			<li><a href = "rankingPage.jsp">��ŷ ������</a></li>
			<li><a href="communityPage.jsp">���� �� �Խ���</a></li>
		</ul>
		<canvas id = "myCanvas" width = "480" height = "320"></canvas><p>
		<div class="button">
			<button onclick = "gameStart()" >���� �����ϱ�</button>
			<button onclick = "reload()" display: block>���� ������ϱ�</button><p>
		</div>
	<hr>
	
	<div class="button">
		<h3>��ŷ ����</h3>
		<form id = "recordForm" method="post" action="recordSave.jsp" >
			�г��� : <input type = "text" id = "nickName" name = "nickName" value = <%=sessionNickName %>><p>
			���ھ� : <input type = "text" id = "score" name = "score">
			<input type = "submit" value="��ŷ�� �����ϱ�">
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
		//x, y, �ʺ�, ����
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
			else if(y + dy > canvas.height- ballRadius){ // ������ �������µ�
				if(x > paddleX && x < paddleX + paddleWidth){ // �׶� �е���̿� ������ ������ �ٲ��ش�.
					dy = -dy;
					
					// �е� ������� ������ �ϰ� ������ dx += 1; dy -= 1;
				}
				else{
					alert("GAME OVER");
					clearInterval(motor); // ���� ����
					record();
				}
			}
			
			if(rightPressed && paddleX + paddleWidth <  canvas.width)
				paddleX += 7;
			else if(leftPressed && paddleX > 0)
				paddleX -= 7;
		}
		function record(){
			alert("��ŷ�� ����� ������ �ϴ��� ��ŷ ���� ��ư�� ��������!");
		}
	}
</script>

</body>
</html>