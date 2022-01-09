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
	
	
	<!-- 상단 네비게이션 바 세팅 이름 / 회원정보 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Tag 등록 시스템</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span> <!-- 작대기가 3개 그어진 아이콘 -->
		</button>
		<!-- #navbar에 실제로 들어가야하는 내용 세팅 -->
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto"> <!-- UL 특정 목록을 정의하는 태그 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>		
						<a class="dropdown-item" href="userInfo.jsp">회원정보</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	
	<section class="container">
		<!-- 검색창 form 만들기 -->
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<p>			
			공장명 <select name="plant" class="form-control mx-1 mt-2">
					<option value="(주)에스피텍">(주)에스피텍</option>
					<option value="아이트리온">아이트리온</option>
				</select>
			공정ID <input type="text" name="process" class="form-control mx-1 mt-2" >
			설비ID <input type="text" name="equip" class="form-control mx-1 mt-2" >
			</p>
			<p>
			Tag ID <input type="text" name="tagID" class="form-control mx-1 mt-2" >
			Tag 한글명 <input type="text" name="tagKR" class="form-control mx-1 mt-2" >
			사용여부 <select name="tagUse" class="form-control mx-1 mt-2">
					<option value="전체" selected>전체</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			</p>
		</form>
		
		<!-- grid 테이블 관련 기능 정의 -->
		<div style="font-size:12px; float:right;">
			<button type="submit" class="btn btn-secondary" style="font-size:12px">Tag 삭제</button>
		</div>
		
		
		<div class="container-fluid mt-5" style="font-size:14px" >
			<form method="get" action="">
				<div class="hscroll">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<td>no</td>
							<td><input type="checkbox" name="checkbox"></td>
							<td>Tag ID</td>
							<td>Tag 한글명</td>
							<td>Tag 영문명</td>
							<td>UOM</td>
							<td>공장</td>
							<td>공정</td>
							<td>설비</td>
							<td>사용여부</td>
						</tr>
						<tr>
							<td>1</td>
							<td><input type="checkbox" name="checkbox"></td>
							<td>UEA0001_TAG001</td>
							<td>흡입 압력</td>
							<td></td>
							<td>
								<select name="tagUse" class="form-control" style="font-size:12px">
									<option value="" selected></option>
									<option value="mmAq">mmAq</option>
									<option value="℃">℃</option>
									<option value="%">%</option>
									<option value="m/s">m/s</option>					
								</select>
							</td>
							<td>
								<select name="plant" class="form-control" style="font-size:12px">
									<option value="(주)에스피텍" selected>(주)에스피텍</option>
									<option value="아이트리온">아이트리온</option>
								</select>
							</td>
							<td>유틸리티 설비-공기압축기</td>
							<td>공기압축기#1</td>
							<td>
								<select name="tagUse" class="form-control" style="font-size:12px">
									<option value="Y" selected>Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
					</thead>
				</table>
				</div>
			</form>
		</div>		
	</section>
	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"> <!-- modal의 제목 부분 -->
					<h5 class="modal-title" id="modal">Tag 등록</h5>
					<!-- 닫기 버튼(아이콘) 세팅 -->
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> 
					</button>
				</div>
				
				<div class="modal-body"> <!-- modal의 내용 부분 -->
					<form action="./tagRegisterAction.jsp" method="post">
						<!-- 하나의 form-row는 일반적으로 12열인데 6개씩 나눠서 쓰겠다고 정의 -->
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>TagID</label>
								<input type="text" name="process" class="form-control" maxlength="20" placeholder="UEAXXXX_TAGXXX형태로 입력">
							</div>
							
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>Tag 한글명</label>
								<input type="text" name="process" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>UOM</label>
								<select name="UOM" class="form-control">
									<option value="" selected>없음</option>
									<option value="mmAq">mmAq</option>
									<option value="℃">℃</option>
									<option value="m/s">m/s</option>
									<option value="%">%</option>
								</select>
							</div>
							<div class="form-group col-sm-8">
								<label>공장명</label>
								<select name="plant" class="form-control">
									<option value="(주)에스피텍">(주)에스피텍</option>
									<option value="아이트리온">아이트리온</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>공정명</label>
								<input type="text" name="process" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-8">
								<label>설비명</label>
								<input type="text" name="process" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-4">
								<label>사용여부</label>
								<select name="tagUse" class="form-control">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>