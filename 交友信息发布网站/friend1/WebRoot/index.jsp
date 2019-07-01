<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<head>

    <meta charset="utf-8">
   
    <title>friend-index</title>

	<link rel="stylesheet" type="text/css" href="css/mystyle.css">
	<style>
	
		.carousel-inner{
			width: 950px;
			height: 450px;
			position: relative;
			overflow: hidden;
			
		}
		.item{
			width: 100%;
			position: absolute;
			top: 0;
			left: 0;
		}
	</style>
	<script src="js/myfeel.js"></script>
	
<%@ include file="head.jsp" %>
</head>

<body>
	<!--  <div id="contain">
	
	<a id="a1" href="javascript:;"><</a>
	<a id="a2" href="javascript:;">></a>
	<p id="p1"></p>
	<span id="s1">1/2</span>
	<img id="img1">
	</div> -->
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                           <div class="item active">
                                <img id="auto" class="img-responsive img-full" src="img/slide-1.jpg" alt="">
                            </div>
                            <!-- <div class="item">
                                <img class="img-responsive img-full" src="img/slide-2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img id="auto" class="img-responsive img-full" src="img/slide-3.jpg" alt="">
                            </div> -->
                        </div>

                        <!-- Controls -->
                        <a id="prev" class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a id="next" class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                    <h2 class="brand-before">
                        <small>Welcome to</small>
                    </h2>
                    <h1>Dating Wall</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>ps:
                            <strong>快寻找你志同道合的伙伴吧</strong>
                        </small>
                    </h2>
                </div>
            </div>
        </div>
                    

       <div class="row">
        	<div class="clearfix">
            <div class="box hight">
                <div >
                    <hr>
                    <h2 class="intro-text text-center"><strong>简介</strong>
                    </h2>
                    <hr>
                    <div class="bleft"> 
                    <img src="img/intro-pic.jpg" alt="">
                    </div> 
					<div class="bright">
					 <p>Dating Wall是人们为了摆脱自己单身的生活，而去结交认识他人的过程。交友的类型可以是女朋友或者男朋友，也可以是普通朋友。指出主要是包括一方对另一方的信任，并把信任给予对方，允许对方与自己交往，含有互动交友。</p>
					</div>         
                </div>
            </div>
            </div>
        </div>



    </div>
    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
            
                <div class="col-lg-12 text-center">
                    <p>课设组长乔露露 - 组员方琦</p>
                </div>
            
            </div>
        </div>
    </footer>


<script>
	window.onload = function(){
		var oAuto = document.getElementById("auto");
		var oPrev = document.getElementById("prev");
		var oNext = document.getElementById("next");
		var num = 0;
		var arrImg = ['img/slide-1.jpg','img/slide-2.jpg','img/slide-3.jpg'];
		
		
		setInterval(function(){
			num++;
			if( num == 3 ){	
				num=0;
			}
			oAuto.src = arrImg[num];
		},1000);
		
		
		oPrev.onclick = function(){
			
			num--;
			if( num == -1 ){	
				num=2;
			}
			oAuto.src = arrImg[num];
			
		}
		oNext.onclick = function(){
			
			
			num++;
			if( num == 3 ){	
				num=0;
			}
			
			oAuto.src = arrImg[num];
			
		}
		
	}
</script>

</body>

</html>
