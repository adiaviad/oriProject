<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="game.aspx.cs" Inherits="game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center>
    <p><h1 style="color:dimgrey;font-family:Roboto;">BREAKOUT</h1></p>
  <p><h1 style="color:dimgrey;font-family:Roboto;">HAVE FUN!</h1></p>
    </center>
 
<body>
        <center>
<canvas id="myCanvas" width="1500" height="738" style="color:black"></canvas>

<script>
   

    var canvas = document.getElementById("myCanvas");
    var ctx = canvas.getContext("2d");
    canvas.style.background = "black"
    var ballRadius = 10;
    var x = canvas.width / 2;
    var y = canvas.height - 30;
    var dx = 2;
    var orgdx = 2;
    var dir = 1;
    var dy = -2;
    var paddleHeight = 10;
    var paddleWidth = 200;
    var paddleX = (canvas.width - paddleWidth) / 2;
    var rightPressed = false;
    var leftPressed = false;
    var brickRowCount = 3;
    var brickColumnCount = 17;
    var brickWidth = 75;
    var brickHeight = 20;
    var brickPadding = 10;
    var brickOffsetTop = 30;
    var brickOffsetLeft = 30;
    var brickX = (c * (brickWidth + brickPadding)) + brickOffsetLeft;
    var brickY = (r * (brickHeight + brickPadding)) + brickOffsetTop;
    var color = "#0095DD";
    var score = 0;
    var brickscolor;

    function drawScore() {
        ctx.font = "50px Varela Round";
        ctx.fillStyle = "#0095DD";
        ctx.fillText("Score: " + score, 650, 350);
    }
    //random color 
   function getRandomColor(){
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
       }
       setInterval(1000)
       return color;

    }

   
    document.addEventListener("keydown", keyDownHandler, false);//movment with keys
    document.addEventListener("keyup", keyUpHandler, false);
    document.addEventListener("mousemove", mouseMoveHandler, false);//movment with mouse
    //mouse
    function mouseMoveHandler(e) {
        var relativeX = e.clientX - canvas.offsetLeft;
        if (relativeX > 0 && relativeX < canvas.width) {
            paddleX = relativeX - paddleWidth / 2;
        }
    }
    //keys
    function keyDownHandler(e) {
        if (e.key == "Right" || e.key == "ArrowRight") {
            rightPressed = true;
        }
        else if (e.key == "Left" || e.key == "ArrowLeft") {
            leftPressed = true;
        }
    }

    function keyUpHandler(e) {
        if (e.key == "Right" || e.key == "ArrowRight") {
            rightPressed = false;
        }
        else if (e.key == "Left" || e.key == "ArrowLeft") {
            leftPressed = false;
        }
    }
    var bricks = [];//creating the bricks
    for (var c = 0; c < brickColumnCount; c++) {
        bricks[c] = [];
        for (var r = 0; r < brickRowCount; r++) {
            bricks[c][r] = { x: 0, y: 0, status: 1 };
        }
    }
    
    //draw bricks
    function drawBricks() {
        brickscolor = getRandomColor();
        for (var c = 0; c < brickColumnCount; c++) {
            for (var r = 0; r < brickRowCount; r++) {
                if (bricks[c][r].status == 1) {
                    var brickX = (c * (brickWidth + brickPadding)) + brickOffsetLeft;
                    var brickY = (r * (brickHeight + brickPadding)) + brickOffsetTop;
                    bricks[c][r].x = brickX;
                    bricks[c][r].y = brickY;
                    ctx.beginPath();
                    ctx.rect(brickX, brickY, brickWidth, brickHeight);
                    ctx.fillStyle = "#0095DD";
                    ctx.fill();
                    ctx.closePath();
                }
            }
        }
    }
    //calculation for collison
    function collisionDetection() {
        for (var c = 0; c < brickColumnCount; c++) {
            for (var r = 0; r < brickRowCount; r++) {
                var b = bricks[c][r];
                if (b.status == 1) {
                    if (x > b.x && x < b.x + brickWidth && y > b.y && y < b.y + brickHeight) {
                        dy = -dy;
                        dir = -dir;
                        dx = orgdx * dir;
                        
                        dx = -dx * (Math.random() * 2 +1);
                        b.status = 0;
                        color = getRandomColor();
                        score++;
                    }
                }
            }
        }
    }
    //check if win if yes chrome sends u win
    function CheckWin() {
        var iswin = true;
        for (var c = 0; c < brickColumnCount; c++) {
            for (var r = 0; r < brickRowCount; r++) {
                if (bricks[c][r].status == 1) {
                    iswin = false;
                }
            }
        }
        if (iswin) {
            alert("YOU WIN!");
            document.location.reload();
            clearInterval(interval);
        }
    }
    //drawing the ball
    function drawBall() {
        ctx.beginPath();
        ctx.arc(x, y, ballRadius, 0, Math.PI * 2);
        ctx.fillStyle = color;
        ctx.fill();
        ctx.closePath();
    }
    // drawing the paddle
    function drawPaddle() {
        ctx.beginPath();
        ctx.rect(paddleX, canvas.height - paddleHeight, paddleWidth, paddleHeight);
        ctx.fillStyle = "#0095DD";
        ctx.fill();
        ctx.closePath();
    }
    
    //draw + move paddel by keys A or D or left Arrow Right Arrow + ball movment and  change diraction, each 10 milisec clear board and redraw every thing
    //checks if game over 
    function draw() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        drawBall();
        drawPaddle();
        drawBricks();
        collisionDetection();
        CheckWin();
        drawScore();
        if (x + dx > canvas.width - ballRadius || x + dx < ballRadius) {
            
            dx = -dx;
        }
        if (y + dy < ballRadius) {
            dy = -dy;
        }
        else if (y + dy > canvas.height - ballRadius) {
            if (x > paddleX && x < paddleX + paddleWidth) {
                dy = -dy;
             
            }
            else {
                alert("DICKLA U NOOB");
                document.location.reload();
                clearInterval(interval); //Chrom message
            }
        }

        if (rightPressed && paddleX < canvas.width - paddleWidth) {
            paddleX += 7;
        }
        else if (leftPressed && paddleX > 0) {
            paddleX -= 7;
        }

        x += dx;
        y += dy;
        requestAnimationFrame(draw);
    }
   
    draw();
   
</script>
</center>
</body>

</asp:Content>


