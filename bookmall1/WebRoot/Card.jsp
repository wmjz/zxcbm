<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML >
<html>
  <head>
    
    
    <title>My JSP 'Card.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
// 		function init(){
// 			if($("checkbox_input").is(':checked')){
// 				location.reload(true);
// 				$("#checkbox_input").css({"background-color": "blue" });
				
// 			}else{
// 				location.reload(true);
// 				$("#checkbox_input").css({"background-color": "blue" });

// 			}
// 		}
		function subtractionNum(id2){
			var num1=$("#num").val();
			$.post("card.do",{num:num1,method:'subtractionNum',id:id2 },function(){
				location.reload(true);
			});
		}
		function addNum(id2){
			var num1=$("#num").val();
			$.post("card.do",{num:num1,method:'addNum',id:id2 },function(){
				location.reload(true);
			});
		}
		
		function del(id2){
			$.get("card.do",{id:id2,method:'del'},function(){
				location.reload(true);
			});
		}
		function update(id2){
			var num1=$("#num").val();
			$.post("card.do",{num:num1,method:'updateNum',id:id2 },function(){
				location.reload(true);
			});
		}
		function jx(){
		location.href="classification .jsp";
		}
		function cardjs(){
			$.post("buy.do",function(){
			location.href="orderdetail.jsp";
			});
		}
// 		$(init);
	</script>
   <style type="text/css">
   body{
   	background-color: #F5F5DC;
   }
   .con{
	   	width: 1000px;
	   	height: 500px;
	   	
   		margin: 0 auto;
   		position: relative;
   		
   }
  .left{
		width: 250px;
		height: 300px;	
		border: 1px solid red;
		float: left;
	}
   .right{
		width: 700px;
		height: 300px;
		position: absolute;
		right: 0px;
		border: 1px solid red;
	}
	.split{
		clear: both;
		width: 1000px;
		height: 5px;
		margin-top: 40px;
	}
   .bottom{
   		width: 700px;
   		height: 100px;
   		position: absolute;
		right: 0px;
   		border: 1px solid red;
   		margin-top: 30px;
   }
   #right_topic{
	   	width: 700px;
	   	height: 50px;
	   	border: 1px solid orange;
   		line-height: 50px;
   		color:  red;
   }
   #info{
   		width: 700px;
	   	height: 100px;
	   	border: 1px solid orange;
   		margin-top: 50px;
   		position: relative;
   		text-align: center;
   }
   #title{
	   	width: 200px;
	   	height: 50px;
	   border: 1px solid orange;
		margin-top: 25px;
   }
     #price{
	   	width: 100px;
	   	height: 50px;
	    border: 1px solid orange;
	    position: absolute;
	    left: 250px; 
	    top: 25px;
	    
	    
   } 
   #info_form{
		position: absolute;
		left: 400px;
		top: 25px;
		width: 160px;
	} 
	#info #span1{
		text-align: center;
		font-weight: 800;
		font-size: 18px;
		font-family: "微软雅黑";
		line-height: 50px;
	}
	#info #span2{
		
		font-weight: 800;
		font-size: 18px;
		font-family: "微软雅黑";
		line-height: 50px;
		color: red;
	}
	#buy1{
		position:absolute;
		left:60px;
		top:25px;
		width: 180px;
		height: 50px;
		background-color: #FF2832;
		text-align: center;
		line-height: 50px;
		color: white;
		
	}
	#zong{
		position: absolute;
		left: 300px;
		width: 200px;
		height: 50px;
		top: 25px;
		text-align: center;
		border: 1px solid black;
	}
	#checkbox{
		position: absolute;
		left: -100px;
		top: 150px;
	}
	#checkbox_input{
		width: 50px;
		height: 50px;
	}
   </style>

  </head>
  <body>
  	<div class="con">		
  		<% Map<Integer,BookTing> cardbkt=(Map)session.getAttribute("cardbkt");
  				for(Integer id:cardbkt.keySet()){
  					BookTing bkt=cardbkt.get(id);	
  			 %>
		<div class="left">
			<img alt="" style="width: 250px; height: 300px;" src="uplaod/<%=bkt.getImgPath() %>">
		</div>
		<div class="right">
			<div id="right_topic">享阅?临夏之章，满150减50元；满300减100元；满450减150元；满600减200元</div>
			<div id="info">
				<div id="title"><span id="span1"><%=bkt.getTitle() %></span></div>
				<div id="price"><span id="span2">&yen;<%=bkt.getPrice() %></span></div>
				<div id="info_form" class="input-group">
					<a href="#" style="text-decoration:none;"><span style="width: 50px; height: 50px; font-size:18px; border-radius: 0px;" id="add" class="input-group-addon" onclick="subtractionNum(<%=bkt.getId()%>)">-</span></a>
					<input id="num" style="width: 50px;text-decoration:none; height: 50px;text-align: center; " type="text" value="<%=bkt.getNum()%>" onblur="update(<%=bkt.getId() %>)" class="form-control">
					<a style="text-decoration:none;" href="#"><span style="width: 50px;height: 50px; border-radius: 0px;" id="del" class="input-group-addon" onclick="addNum(<%=bkt.getId()%>)">+</span></a>
				</div>
				<a href="#" style="text-decoration:none;"><button class="btn btn-danger" style="position: absolute;left: 600px;top: 130px;" onclick="del(<%=bkt.getId()%>)" >删除</button></a>
				<a href="#" style="text-decoration:none;"><button class="btn btn-success" style="position: absolute;left: 400px;top: 130px;" onclick="jx()" >继续购买</button></a>
			</div>
		</div>
		<div id="checkbox">
		<input id="checkbox_input" type="checkbox"  value="<%=bkt.getId() %>" > 
		
		</div>
		<div class="split">
			<hr style="height: 2px;" />
		</div>
		<%} %>
		<div class="bottom">
			<a href="#">
				<div id="buy1" onclick="cardjs()">立即结算</div>
			</a>
			<div id="zong" >
				<span style="font-weight: 800;font-size: 18px;font-family: '微软雅黑';line-height: 50px;color: red;">您应付&yen;<%=Card.settleAccounts() %>元</span>
			</div>
		</div>
   	</div>	
  </body>
</html>
 
	    	
  			
    
