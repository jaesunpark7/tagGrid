<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 반응형 웹 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>tag 등록 사이트</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>


	<!-- 상단 네비게이션 바 세팅 검색필드 6개 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Tag 등록 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 네비게이션바에 실제로 들어가야하는 내용 세팅 -->
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">		

						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userInfo.jsp">회원정보</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>

					</div>
				</li>
			</ul>
			
		</div>
		
		<div id = "navbar" class="collapse navbar-collapse">
			<!-- 검색창 구현 -->
			<form method="get" action="./index.jsp" class="form-inline mt-3">
				공장ID <select name="plant" class="form-control mx-1 mt-2">
					<option value="(주)에스피텍">(주)에스피텍</option>
					<option value="아이트리온">아이트리온</option>
				</select>
				<input type="text" name="process" class="form-control mx-1 mt-2" >
				<input type="text" name="equip" class="form-control mx-1 mt-2" >
				<input type="text" name="tagID" class="form-control mx-1 mt-2" >
				<input type="text" name="tagKR" class="form-control mx-1 mt-2" >
				<select name="tagUse" class="form-control mx-1 mt-2">
					<option value="전체" selected>전체</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
				<button type="submit" class="btn btn-primary mx-1 mt-2 float-right">검색</button>
			</form>
		</div>
	</nav>
	
	
</body>
</html>