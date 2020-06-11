<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript" src="../javascript/calendar.js"></script>
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateProduct();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
				history.go(-1);
			});
		});	
	
		//�� �ȵ�?
/* 		$(function() {
			$("input[name='manuDate']").on("click", function(){
				$(this).show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value);
			});
		});
		 */

		 		//==>"calendar" Event ó�� �� ����
/* 				 $(function() {
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 $("button.btn.btn-info").on("click" , function() {
						show_calendar("$('manuDate'), $('manuDate').val());
					});
				});	  */
	
		
        function fncUpdateProduct(){

            $("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/updateProduct").submit();
        }

				
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		
		
		<h1 class="bg-primary text-center">��ǰ��������</h1>
        <p></p>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <input type="hidden" name="prodNo" value="${product.prodNo}"/>
		    <div class="col-sm-4">		    </div>
		  </div>
		  
<%--  		<div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      <input type="hidden" class="form-control" id="prodNo" name="prodNo" placeholder="${product.prodNo}" >
		    </div>
		  </div>  --%>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="${product.prodName}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="${product.prodDetail}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="${product.manuDate}">
		    </div>
            <div class="col-sm-3">
		      <img src="../images/ct_icon_date.gif" width="20" height="20" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="${product.price}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="fileUpload" placeholder="��ǰ�̹���">
		    </div>
		  </div>

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>