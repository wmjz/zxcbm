<%@ page language="java" import="java.util.*,com.DaoAndDbUtils.*,com.Entity.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML >
<html>
  <head>
    
    
    <title>My JSP 'book.jsp' starting page</title>
   <link rel="stylesheet" href="css/bootstrap.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	CKEDITOR.replace("content");	
		
	
	function show(){
		$("#book_id").val("add");	
		$("#book_alert").modal("show");
	}
	function face_pre(path){
	 var first=path.files[0];
	 var x=URL.createObjectURL(first);
	 var html="<img src='"+x+"' style='width:200px;height:100px'/>";
	 $("#book_face_pre").html(html);
	}
	
	function save(){
		$("#book_alert").modal("hide");
		$("#jiazai_modal").modal("show");
		
		var x=CKEDITOR.instances.content.getData();	
		
		var fd=new FormData($("form")[0]);
		
		fd.append("content1", x);
		$.ajax({
			url : "book.do",
			method : "post",
			data : fd,
			contentType: false,
			processData: false,
			success: function(d){
				if(d==1){
				
					alert("操作成功");
					$("#jiazai_modal").modal("hide");
					$.get("book.jsp",function(data) {
		 				$("#work").html(data);
		 			});
				}else{
					alert("shibai");
				}
			}
		}); 
	}	
	
	function remove(id2){
		$("#jiazai_modal").modal("show");
		$.get("book.do",{id:id2},function(data){
			if(data==1){
				$("#jiazai_modal").modal("hide");
				$.get("book.jsp",function(data) {
		 				$("#work").html(data);
		 			});
			}else{
				alert("删除失败");
				$("#jiazai_modal").modal("hide");
			}
		});
	}
	function update(id2,title,price,typename,src){
		$("#book_id").val(id2);
		$("#id_book_name").val(title);
		$("#id_book_price").val(price);
		//$("#id_book_type2").val(typename);
		//$("#id_content").val(content);
		//var html="<img src='"+src+"' style='width:200px;height:100px'/>";
	 	//$("#book_face_pre").html(html);
		$("#book_alert").modal("show");
	}
	
	</script>
	 <style>
		#book_f1 div{
			body-bottom:5px;
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
   		<div>
   			<button class="btn btn-success" onclick="show()">添加</button>
   		</div>
		<div>
		
			<ul class="list-group">
			<%
				List<BookTing> bts=BookTingDao.select();
				for(BookTing bt:bts){
			 %>
				<li class="list-group-item" style="justify-content:space-between">
			 	<img alt="" src="uplaod/<%=bt.getImgPath()%>" style="width:200px;height:180px">	
				<span >名字：<%=bt.getTitle() %></span>
				<span >价格：<%=bt.getPrice() %></span>  
				<span >类型：<%=bt.getTypeName() %></span>
				<span >简介：<%=bt.getContent() %></span>
				<span>	
				<img src="img/edit.png" onclick="update(<%=bt.getId() %>,'<%=bt.getTitle() %>',<%=bt.getPrice() %>,'<%=bt.getTypeName() %>','<%=bt.getImgPath()%>')"/>
  				<img src="img/remove.png" onclick="remove(<%=bt.getId() %>)" />
  				</span>
				</li>
				<% }%>
			</ul>
		</div>
		<div id="book_alert" class="modal">
  		<div class="modal-dialog modal-lg">
  			<div class="modal-content">
  				<div class="modal-header">
  					<h6>请认真填写内容</h6>
  				</div>
  				<div class="modal-body">
  					<form id="book_form" class="form-group">
  						 <input id="book_id" type="hidden" name="id"/>
  						<div class="input-group">
  							<span class="input-group-addon">书名</span>
  							<input type="text" class="form-control" id="id_book_name" name="book_name" />
  						</div>
  						<div class="input-group">
  							<span class="input-group-addon">价格</span>
  							<input type="number" class="form-control" id="id_book_price" name="book_price" />
  						</div>
  						<div class="input-group">
  							<span class="input-group-addon">类型</span>
  							<select class="form-control" id="id_book_type2" name="book_type2">
  							<%
  								List<Book> books=bookDao.select();
  								for(Book book:books){
  							 %>
  								<option value="<%=book.getId() %>"><%=book.getName() %></option>
  								<% }%>
  							</select>
  							
  						</div>
  						<div class="input-group">
  						<span class="input-group-addon">简介</span>
  						<textarea rows="2" cols="2" name="content" class="ckeditor" id="content"></textarea>
  						</div>
  						<div class="input-group">
  							<span class="input-group-addon">封面</span>
  							<input type="file" class="form-control" name="book_face"  onchange="face_pre(this)"/>
  						</div>
  						<span id="book_face_pre"></span>
  					</form>
  				</div>
  				<div class="modal-footer">
  					<button class="btn btn-danger" data-dismiss="modal">关闭</button>
  					<button class="btn btn-success" onclick="save()">提交</button>
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
