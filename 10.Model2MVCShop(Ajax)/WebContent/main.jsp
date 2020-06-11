<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	a4e75e3b93f46e39e7fe85ca1aa9a785"></script> <!-- java script key ���� -->
	
	<script type="text/javascript">
	
		var map = null;
	
		$(function() {
			
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		   
			mapOption = { 
		        center: new daum.maps.LatLng(37.499488, 127.029289), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };
	
			map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	
		});
		
		function setCenter() {            
		    // �̵��� ���� �浵 ��ġ�� �����մϴ� 
		    var moveLatLon = new daum.maps.LatLng(37.499488, 127.029289);
		    
		    // ���� �߽��� �̵� ��ŵ�ϴ�
		    map.setCenter(moveLatLon);
		}
	
/* 		function panTo() {
		    // �̵��� ���� �浵 ��ġ�� �����մϴ� 
		    var moveLatLon = new daum.maps.LatLng(37.499488, 127.029289);
		    
		    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
		    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
		    map.panTo(moveLatLon);            
		}         */
	
	</script>		 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        	<div id="map" style="width:100%;height:350px;"></div>
	<p>
	<p>
	    <button onclick="setCenter()">��Ʈķ��/ ����Ư���� ���ʱ� ����4�� ������� 459</button> 
	    <!-- <button onclick="panTo()">���� �߽���ǥ �ε巴�� �̵���Ű��</button>  -->
	</p></p>
  	 </div>

</body>

</html>