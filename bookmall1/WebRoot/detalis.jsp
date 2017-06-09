<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>My JSP 'DetailBook.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function subtractionNum(){
		 var num1=$("#num").val();
			$.post("details.do",{num:num1,method:'subtractionNum' },function(){
				location.reload(true);
			});
		}
		function addNum(){
			 var num1=$("#num").val();
			$.post("details.do",{num:num1,method:'addNum' },function(){
				location.reload(true);
			});
		}
		function update(){
			 var num1=$("#num").val();
			$.post("details.do",{num:num1,method:'updateNum' },function(){
				location.reload(true);
			});
		}
		function addcard(num1,id2){
			$.get("card.do",{num:num1,id:id2,method:'add'},function(){
				location.href="Card.jsp";
			});
		}
		function buy(id2,num1,price1){
			$.get("buy.do",{id:id2,num:num1,price:price1},function(data){
			if(data!=0){
				location.href="orderdetail.jsp";
			}else{
				alert("购买失败");
			}
				
			});
		} 
	</script>
	<style type="text/css">
	.con{
		width: 1000px;
		height: 600px;
		border: 1px solid orange;
		margin: 0 auto;
		display: flex;
		position: relative;
	}
	.left{
		width: 250px;
		height: 300px;
		border: 1px solid orange;
		
	}
	.right{
		width: 700px;
		height: 600px;
		border: 1px solid blue;
		position: absolute;
		right: 0px;
	}
	#right_title{
		width: 100%;
		height: 50px;
		border: 1px solid blue;
		margin-bottom: 30px;
		text-align: center;
	}
	#right_title #span1{
		font-size: 18px;
		line-height: 50px;
		font-family: "微软雅黑";
		
	}
	#right_content{
		width: 100%;
		height: 200px;
		border: 1px solid blue;
		margin-bottom: 30px;
	}
	#right_price{
		width: 100%;
		height: 100px;
		background-color:#EBEBEB;
		margin-bottom: 30px;
	}
	#right_price #p1{
		font-size: 18px;
		color: #666;
		line-height: 30px;
		margin: 10px;
	}
	#right_price #span1{
		font-size: 40px;
		color: orange;
		font-style:italic;
		line-height: 45px;
		margin: 10px;
	}
	#buy{
		width: 180px;
		height: 50px;
		background-color: #FF2832;
		text-align: center;
		line-height: 50px;
		color: white;
		margin-left: 180px;
		display: inline-block;
	}
	#buy1{
		position:absolute;
		left:450px;
		top:440px;
		width: 180px;
		height: 50px;
		background-color: #FF2832;
		text-align: center;
		line-height: 50px;
		color: white;
		
	}
	#form{
		position: absolute;
		left: 20px;
		top: 440px;
		width: 160px;
	}
	#buy_money{
		position: absolute;
		left: 150px;
		width: 200px;
		height: 50px;
		top: 525px;
		text-align: center;
		border: 1px solid black;
	}
	</style>
  </head>
  
  <body>
    <div class="con">
    
    	<div class="left">
    		
    			<span><img src="uplaod/${btdetalis.imgPath }" alt="" style="width: 250px;height: 300px;"></span>
    		
    	
    	</div>
    	
    	<div class="right">
    		<div id="right_title">
    		
    		<span id="span1">${btdetalis.title } </span>
    		</div>
    		<div id="right_content">${btdetalis.content }</div>
    		<div id="right_price">
    		<p id="p1">吐血价 </p>
    		<p><span id="span1">&yen;${btdetalis.price }</span></p>
    		</div>
    		<div id="form" class="input-group">
	    			
	    			<a href="#" style="text-decoration:none;"><span style="width: 50px; height: 50px; font-size:18px; border-radius: 0px;" id="add"  class="input-group-addon" onclick="subtractionNum()">-</span></a>
	    				<input id="num" style="width: 50px;text-decoration:none; height: 50px;text-align: center; " type="text" value="${numdetalis }" onblur="update()" class="form-control">
	    			<a style="text-decoration:none;" href="#"><span style="width: 50px;height: 50px; border-radius: 0px;" id="del" class="input-group-addon" onclick="addNum()">+</span></a>
	    	</div>

    		<a href="#" onclick="addcard(${numdetalis },${btdetalis.id })">
	    		<div id="buy">
	    			加入购物车
	    		</div>
    		</a>
    		<a href="#"><div id="buy1" onclick="buy(${btdetalis.id },${numdetalis }, ${btdetalis.price })">立即购买</div></a>
    		
    		<div id="buy_money" >
				<span style="font-weight: 800;font-size: 18px;font-family: '微软雅黑';line-height: 50px;color: red;">您应付&yen;${btdetalis.price*numdetalis }元</span>
			</div>
    	</div>
    
    </div>
  </body>
</html>
