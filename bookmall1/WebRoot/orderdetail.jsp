<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'orderdetail.jsp' starting page</title>
     <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
  </head>
  
  <body>
    	<div>
			 <ul class="list-group">
			<!--<c:forEach items="${orderDetails }" var="orderDetail">-->
				<li class=" list-group-item" style=" justify-content:space-between">
				<!--<span>订单号：${orderDetail.orderId }</span>-->
				<span >消费额：<%=Card.settleAccounts() %></span>  
				</li>
				<!--</c:forEach>-->
			</ul> 
			
		</div>
   	
     <br>
  </body>
</html>
