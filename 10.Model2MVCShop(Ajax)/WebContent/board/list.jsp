<%@ page contentType="text/html; charset=UTF-8" %>
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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
        $(document).ready(function(){
            $("#btnWrite").click(function(){
                location.href = "/board/write.jsp";
            });
        });
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">게시글 목록</h3>
	       <h5 class="text-muted"><strong class="text-danger">자유롭게 이용하세요</strong></h5>
	    </div>
        <div class="row">
            <button type="button" id="btnWrite">글쓰기</button>
        </div>
		
		<hr/>
		
		<table class="table">
        <thead>
          <tr>
            <th align="center"><strong>번호</strong></th>
            <th align="left" ><strong>제목</strong></th>
            <th align="left"><strong>작성자</strong></th>
            <th align="left"><strong>작성일</strong></th>
            <th align="left"><strong>조회수</strong></th>
          </tr>
        </thead>

        <hr/>
        
        <c:forEach var="board" items="${list}">
            
        <tbody>
          <tr>
            <td align="center">${board.bno}</td>
            <td align="left" ><a href="/board/view?bno=${board.bno}">${board.title}</a></td>
            <td align="left">${board.writer}</td>
            <td align="left">${board.regdate}</td>
            <td align="left">${board.viewcnt}</td>
          </tr>
        </tbody>
            
        </c:forEach>
	</table>
	
		<hr/>
		
		<br/> 
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	
</body>

</html>