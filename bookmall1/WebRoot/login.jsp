<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'login.jsp' starting page</title>
     <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function dl(){
			$("#jiazai_modal").modal("show");
			var f1=$("#f1").serialize();
			$.post("login.do",f1,function(data){
				if(data==1){
				$("#jiazai_modal").modal("hide");
				location.href="main.jsp";
				}else{
					$("#s2").html("密码不正确");
					$("#jiazai_modal").modal("hide");
				}
			});
		}
	</script>
	 <style type="text/css">
	 body{
	 	background-color: #3EBCF6;
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
    <div id="root" style=" width: 30%; height: 300px; position: absolute;top: 200px;left: 350px;">
    <a href="register.jsp" style="text-decoration: none; position: absolute; right: 50px; line-height: 30px;font-size: 18px; color: orange;">注册</a>
  		<form class="form-group" id="f1" style="position: absolute;top: 30px;">
  			<div class="input-group">
  			<span class="input-group-addon">账号</span>
  			<input class="form-control" type="text" name="name"  autofocus="autofocus" placeholder="请输入用户名"><br />
  			</div>
  			<div class="input-group">
  			<span class="input-group-addon">密码</span>
  			<input class="form-control" type="password" name="psd" placeholder="请输入密码"><br />
  			</div>
  			<a class="btn btn-success btn-block" onclick="dl()">登录</a>
  			<span id="s2" style="color:red; position: absolute;left: 30px;border-bottom: 100px"></span>
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
