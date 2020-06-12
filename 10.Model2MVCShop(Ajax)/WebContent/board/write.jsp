<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
       textarea{
       		width:500px;
       		height:500px;
       		resize:none;/* 크기고정 */  /*   resize: horizontal; // 가로크기만 조절가능  resize: vertical;  세로크기만 조절가능  */ 
       	}

    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript" src="../javascript/calendar.js"></script>
	<script type="text/javascript">
		
        $(document).ready(function(){
            $("#btnSave").click(function(){
                
            
            var title = $("title").val();
            var content = $("content").val();
            var writer = $("writer").val();
           
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("작성자명을 등록하세요");
                document.form1.writer.focus();
                return;
            }


            $("#form1").attr("method", "POST").attr("action", "/board/insert").submit();
            });
        });
				
	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">게시글 작성</h1>
        <p></p>
		
		<!-- form Start /////////////////////////////////////-->
		<form id=form1 name=form1 class="form-horizontal">
		<div class="form-group">
		    <label for="board" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">		    </div>
		  </div>
		  
            
		  <div class="form-group">
		    <label for="title" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
		    <div class="col-sm-4">
		      <input id="title" name="title" placeholder="제목을 입력하세요">
		    </div>
		  </div>
            
		  <div class="form-group">
		    <label for="content" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
		    <div class="col-sm-4">
		      <textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="writer" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input id="writer" name="writer" placeholder="작성자명을 등록하세요">
		    </div>
		  </div>

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btnSave"  >등 &nbsp;록</button>
                <button type="reset">취&nbsp;소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>