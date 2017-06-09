<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.bookDao,com.Entity.BookTing,
com.DaoAndDbUtils.BookTingDao,com.Entity.Book" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
   
    
    <title>My JSP 'index.jsp' starting page</title>
	 <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function init(){
			//$("#first_nav a:nth-of-type(1)").addClass("active");
		}
		$(function(){
			$("#first_nav a").click(function(){
				$("#first_nav").tab("show");
				$("#first_nav a").removeClass("active");
				$(this).addClass("active");
			});
		});
		$(init);
	</script>
  </head>
  
  <body>
    <ul id="first_nav" class="nav nav-tabs" style="margin: 5px auto;">
    	<%
    		List<Book> bks=bookDao.select();
    		session.setAttribute("bks", bks);
    	 %>
    	 <c:forEach items="${bks }" var="bk">
    	<li class="nav-item">
    		<a class="nav-link">
    			${bk.name }
    		</a>
    	</li>
    	 </c:forEach>
    </ul>
	<div id="ddd"></div>
	 <br>
  </body>
</html>
