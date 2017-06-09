<%@ page language="java" import="java.util.*,com.Entity.Book,com.DaoAndDbUtils.bookDao" pageEncoding="utf-8"%>

<!DOCTYPE HTML >
<html>
  <head>
  
    <title>My JSP 'type.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		 <script type="text/javascript">
		 	var id3;
		 	 function init(){
    			$("#type_add").click(function(){
    				$("#book_type_id").val("add");
    				$("#toast").modal("show");
    			});
    		}
    		function tj(){
    			$("#toast").modal("hide");
    			$("#jiazai_modal").modal("show");
    			var value=$("#f1").serialize();
    			$.post("add.do",value,function(data){
    			if(data==1){
    				$("#jiazai_modal").modal("hide");
    				
    				alert("添加成功")
    				$.get("type.jsp",function(data){
		 				$("#work").html(data);
		 			});
    				}else{
    					alert("添加失败")
    					$("#jiazai_modal").modal("hide");
    				}
    			});
    		}
    		function remove(id2){
    		$("#jiazai_modal").modal("show");
    			$.get("add.do",{id:id2,flag:'remove'},function(data) {
    				if(data==1){
    				$("#jiazai_modal").modal("hide");
    					$.get("type.jsp",function(data){
		 					$("#work").html(data);
		 				});
    				}else{
    					alert("删除失败");
    					$("#jiazai_modal").modal("hide");
    				}
    			});
    		}
    		
    		
	
	//编辑前填充数据
	function update(id,content){
	
	 // 把数据填充到input
	  $("#book_type").val(content);
	  $("#book_type_id").val(id);
	  //弹出窗口
	  $("#toast").modal("show");
	  
	}
    		$(init);
		 </script>
	 <style type="text/css">
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
  <div style="margin-bottom: 10px; "><button id="type_add" class="btn btn-success">添加</button></div>
	
	<div>
		<ul class="list-group">
		<%
			bookDao bookDao=new bookDao();
			List<Book> books=bookDao.select();
			for(Book book:books){
			%>
			<li class="list-group-item" style="justify-content:space-between"><span><%=book.getName()%></span> 
				<span>
				<img src="img/edit.png" onclick="update(<%=book.getId() %>,'<%=book.getName() %>')"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
  				<img src="img/remove.png" onclick="remove(<%=book.getId() %>)" />
  				</span>
			</li>
			<%
			}
		 %>
		</ul>
	</div>
	<div id="toast" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h6>请输入您要添加的类型</h6>
				</div>
				<div class="modal-body">
					<form id="f1">
						 <input id="book_type_id" type="hidden" name="id"/>
						<input type="text" id="book_type" name="name" class="form-control" />
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button class="btn btn-success" onclick="tj()">提交</button>
				</div>
			</div>
		</div>
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
