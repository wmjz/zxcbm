<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML >
<html>
  <head>
    
    
    <title>My JSP 'order.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	 <style>
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
  	<div>
		
			<ul class="list-group">
			<%
				List<Order> orders=OrdersDao.select();
				for(Order order:orders){
			 %>
				<li class="list-group-item" style="justify-content:space-between">
				<span >用户名：<%=order.getUserName() %></span>
				<span>订单号：<%=order.getId() %></span>
				<span >消费额：<%=order.getTotal() %></span>  
				<span>	
  				<img src="img/remove.png" onclick="remove(<%=order.getId() %>)" />
  				</span>
				</li>
				<% }%>
			</ul>
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
