<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE >
<html>
  <head>
    
    
    <title>My JSP 'login.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function npd(){
			var f1=$("#f1").serialize();
			$.get("register.do",f1,function(data){
					if(data==1){
						$("#s1").show();
						$("#s1").html("用户名已存在");
					}else{
						$("#s1").hide();
					}
			});
		}
		function zc(){
			$("#jiazai_modal").modal("show");
		var f1=$("#f1").serialize();
			
			$.post("register.do",f1,function(data){
				if(data==1){
				$("#jiazai_modal").modal("hide");
					$("#s1").hide();
					$("#s2").hide();
					$("#s3").hide();
					location.href="main.jsp";
				}else if(data==0) {
				$("#jiazai_modal").modal("hide");
					$("#s1").hide();
					$("#s2").show();
					$("#s3").hide();
					$("#s2").html("两次输入密码不一样");
				}else if(data==2){
				$("#jiazai_modal").modal("hide");
					$("#s2").hide();
					$("#s3").hide();
					$("#s1").show();
					$("#s1").html("用户名已存在");
				}else if(data==3){
				$("#jiazai_modal").modal("hide");
					$("#s2").hide();
					$("#s3").show();
					$("#s1").hide();
					$("#s3").html("用户名已存在");
				}
			});
		}
	</script>
	<style>
	body {
		background-color: #00ABFF;
	}
	.load{
			width: 80px;
			height: 80px;
			border: 5px solid red;
			border-radius: 50%;
			margin: 0 auto;
			animation:a1 3s linear infinite; 
		}
		#jiazai{
			width: 250px;
			height: 250px;
			
			margin: 0 auto;
			margin-top: 200px;
			
		}
		@keyframes a1{ 
			0%{transform:rotate(0deg);border:5px solid red}
			8%{transform:rotate(30deg);border:5px solid blue}
			16%{transform:rotate(60deg);border:5px solid orange}
			25%{transform:rotate(90deg);border:5px solid green}
			33%{transform:rotate(120deg);border:5px solid purple}
			41%{transform:rotate(150deg);border:5px solid black}
			50%{transform:rotate(180deg);border:5px solid gray}
			58%{transform:rotate(210deg);border:5px solid pink}
			66%{transform:rotate(240deg);border:5px solid yellow}
			75%{transform:rotate(270deg);border:5px solid brown}
			83%{transform:rotate(300deg);border:5px solid Cyan}
			91%{transform:rotate(330deg);border:5px solid brown}
			100%{transform:rotate(360deg);border:5px solid red}
		}
		  .load span{
           width:30px;
           height:30px;
           border-radius:50%;
           position:absolute;
           background-color:red;
         }
	</style>
  </head>
  
  <body>
  		<div class="root" style=" width: 30%; height: 300px;position:absolute; top:300px;left: 360px;">
  		<div style=" float: right; font-size: 18px;line-height: 30px"><a style="color: orange;text-decoration:none;" href="login.jsp">登录</a></div>
  		<form id="f1" class="form-group" >
  			<div class="input-group">
  			<span class="input-group-addon" style="width: 80px;">用户名</span>
  			<input class="form-control" type="text" name="name" onblur="npd()" autofocus="autofocus" placeholder="请输入用户名">
  			
  			</div> 
  			<div class="input-group">
  			<span class="input-group-addon" style="width: 80px; "> 密码</span>
  			<input class="form-control" type="password" name="psd" placeholder="请输入密码"><br />
  			</div>
  			<div class="input-group">
  			<span class="input-group-addon" style="width: 80px; ">密码</span>
  			<input class="form-control" type="password" name="psd1" placeholder="请再次输入密码"><br />
  			
  			</div>
  			
  			<a class="btn btn-success btn-block" onclick="zc()">注册</a>
  			<span id="s1" class="ss1" style=" color: red;font-size: 18px;"></span><br/>
  			<span id="s2" class="ss2" style=" color: red; font-size: 18px;"></span><br/>
  			<span id="s2" class="ss2" style=" color: red; font-size: 18px;"></span>
  		</form>
  		</div>
  		<div class="modal" id="jiazai_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="jiazai" >
  						<div class="load">
	    					<span></span>
	    				</div>
	   					<div style="margin-left: 20px;"><h2>正在连接，请稍等...</h2></div>
    				</div>
				</div>
			</div>
		</div>
	 <br>
  </body>
</html>
