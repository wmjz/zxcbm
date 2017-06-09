<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE >
<html>
  <head>
  
    
    <title>My JSP 'main.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		 <script type="text/javascript">
		 	function init(){
		 		$("#a1").click(function(){
		 			var x=$(this).text();
		 			$.get("type.jsp",function(data){
		 				$("#work").html(data);
		 			});
		 		});
		 		$("#a2").click(function(){
		 			$.get("book.jsp",function(data) {
		 				$("#work").html(data);
		 			});
		 		});
		 		$("#a3").click(function(){
		 			$.get("order.jsp",function(data) {
		 				$("#work").html(data);
		 			});
		 		});
		 	$("#a4").click(function(){
		 			location.href="classification .jsp";
		 		});
		 	}
		 	$(init);
		 </script>
  </head>
  
  <body>
    <div style="width: 100%;height: 100%">
    	<div style="width: 100%; height: 100px;background-color: red;"></div>
    	<div  class="container-fluid row" >
	    	<div class="col-md-2" style="padding:0px 0px">
	    		<ul class="list-group">
	    			<li class="list-group-item"><a id="a1" class="nav-link" href="#">分类管理</a></li>
	    			<li class="list-group-item"><a id="a2" class="nav-link" href="#">图书管理</a></li>
					<li class="list-group-item"><a id="a3" class="nav-link" href="#">订单管理</a></li>
					<li class="list-group-item"><a id="a4" class="nav-link" href="#">购物端</a></li>
	    		</ul>
	    	</div>
	    	<div id="work" style="background-color: #666;height: 500px;" class="col-md-10"></div>	
    	</div>
    </div>

 <br>
  </body>
</html>
