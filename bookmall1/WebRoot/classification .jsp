<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'classification .jsp ' starting page</title>
	 <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function init(){
 			//$("#cc_first_div2").hide();
 			//$("#cc_second_div").hide();
		}
		var id3;
		function mouseover(id2){
			id3=id2;
		}
		
		$(function(){
			$("#first_nav a").click(function(){
				$("#first_nav").tab("show");
				$("#first_nav a").removeClass("active");
				$(this).addClass("active");
				
				
				$.get("findclassbook.do",{id:id3},function(data){
				if(data==1){
				//$("#cc_first_div2").hide();
				//$("#cc_second_div").show();
				location.reload(true);
				
				}
				
			});
				
 			});
		});
		
	</script>
	<style>
		 #cc_first_div{
    	width:800px;
    	height: 800px;
    	margin: 0 auto;
    	border: red 1px solid;
    }
    	
    ul li {
    	margin-right: 50px;
    	
    }
    .root{
   		width: 230px;
    	height: 310px;
    	margin: 10px;
    	
    	border: 1px solid red;
    } 
    .root p{
    	color: red;
    	font-weight: bold;
    
    }
	</style>
  </head>
  
  <body>
  	 <div id="cc_first_div">
			<div id="cc_first_div1">
				<ul id="first_nav" class="nav nav-tabs" style="margin: 5px auto;">
					<%
		    		List<Book> bks=bookDao.select();
		    		session.setAttribute("bks", bks);
		    	 %>
					<c:forEach items="${bks }" var="bk">
						<li class="nav-item">
							<a class="nav-link" onmouseover="mouseover(${bk.id })">
								${bk.name }
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<%List<BookTing> bkts=BookTingDao.select();
	    	session.setAttribute("bkts", bkts);
   	     %>
		<!--	<div id="cc_first_div2">

				<c:forEach items="${bkts}" var="bkt">
					<div class="root row" style="display:inline-block;">

						<div class="card text-center">
							<div class="card-block ">
								<span><img style="width: 200px; height: 200px;" alt="" src="uplaod/${bkt.imgPath}"></span><br/>
								<span>${bkt.title}</span>
								<p>&yen;${bkt.price}</p>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</div>
              
              	作者：offline
              	时间：2017-05-12
              	描述：
             
		
			<div class="root row" style="display:inline-block;">
				<c:forEach items="${classbts}" var="bkt1">
					<div class="card text-center row" onclick="details(${bkt1.id })">
						<div class="card-block">
							<span><img style="width: 200px; height: 200px;" alt="" src="uplaod/${bkt1.imgPath}"></span><br/>
							<span>${bkt1.title}</span>
							<p>&yen;${bkt1.price}</p>
						</div>
					</div>
				</c:forEach>
			</div> -->
		
	
	<div id="kinds">
   	     <c:forEach items="${classbts }" var="bkt1"> 
   	     <div class="root row" style="display:inline-block;" >
		    <div class="card text-center" >	
		    	 <div class="card-block ">
		    		<a href="details.do?id=${bkt1.id }"><span><img style="width: 200px; height: 200px;" alt="" src="uplaod/${bkt1.imgPath }"></span></a><br/>
		    		<span>${bkt1.title}</span>
		    		<p>&yen;${bkt1.price}</p>		    	
		    	</div> 
		    </div>
  		 </div> 
    	 </c:forEach>  
    </div>
	</div>
	 <br>
  </body>
</html>

