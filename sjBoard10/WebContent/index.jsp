<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<jsp:useBean id="user" class="user.User"  />
<%@ page import="bbs.bbsDAO" %>	 
<!DOCTYPE HTML>

<html>
<head>
<title>수정같이_성신여대공동구매사이트</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="./css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>

	<%
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		}
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div>
				<img class="center" src="./images/main.png" alt=""
					style="width: 150px;" />
			</div>
			<div class="inner">


				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								수정같이; <br />
								<h2>굿즈 공동구매</h2>
							</h1>
							<p>성신여대 굿즈 공동구매 플랫폼</p>
						</header>
						<p>성신여대 에브리타임에서 이루어지던 굿즈 공동구매를 더 편리하게 이용하기 위해 고안된 공동구매 플랫폼입니다.<br />오직 당신만을 위한 성신여대생의, 성신여대생에 의한, 성신여대생을 위한 굿즈 공동구매 플랫폼!</p>
						<hr />
					</div>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">



				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.jsp">Homepage</a></li>	
						<li><a href="write.jsp">총대매기(수요조사 글올리기)</a></li>												
						<li><a href="bbs.jsp">구매참여하기</a></li>
						<li><a href="bbs_goods.jsp">상품 상세보기</a>	</li>
						<li><a href="priceCompare.jsp">가격비교</a></li>

					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<a href="http://new.sungshin.ac.kr" class="linee">성신여대 바로가기</a>
					</header>
				</section>


				<!-- Section -->
				<section>
					<header class="major">
						<h3 class="linee">데이터베이스프로그래밍 7조</h3>
						<%
				if (user_id == null) {
			%>
						<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="login.jsp">로그인</a> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="join.jsp">회원가입</a> <br>
						<br>
						<%
				} else {
			%>
						<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="mypage.jsp">마이페이지</a> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="logoutAction.jsp">로그아웃</a> <br>
						<br>
						<%
				}
			%>
					</header>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">******@gmail.com</a></li>
						<li class="fa-phone">(82+)010-****-****</li>
						<li class="fa-home">서울특별시 성북구<br /> 보문로 34다길 2, 성신여자대학교</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved.
						Developed by JooHye-Yoon, WonHee-Jeong, SuMin-Hwang</p>
				</footer>

			</div>
		</div>

	</div>



	<!-- Scripts -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/skel.min.js"></script>
	<script src="./js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="./js/main.js"></script>

</body>
</html>