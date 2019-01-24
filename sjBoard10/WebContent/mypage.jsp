<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_div" />
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
		
		String user_div = null;
		if(session.getAttribute("user_div") != null){
			user_div=(String) session.getAttribute("user_div");
		}
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div>
				<img class="center" src="./images/pic01.png" alt=""
					style="width: 150px;" />

			</div>
			<div>
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header class="user_id">
							<%=user_id%>님 반갑습니다!
						</header>
						<p class="user_id">오늘의 성신에 그대를 더해 내일의 수정이 더 찬란하기를!</p>
						<hr />
					</div>
			</div>
			<div class="inner">
			<div class="col-4 col-6-medium col-12-small">

					<!-- Feature -->
					<section id="section1">
						<header>
							<a href="https://everytime.kr/"><img class="center" src="./images/et.PNG" alt=""
								style="width: 150px;" /></a>
						</header>
						<p class="user_id">▷ 에브리타임으로 이동하기</p>
					</section>
				</div>
				<div class="col-4 col-6-medium col-12-small">

					<!-- Feature -->
					<section id="section2">
						<header>
							<a href="http://lms.sungshin.ac.kr/ilos/main/main_form.acl"><img class="center" src="./images/edu.PNG" alt=""
								style="width: 150px;" /></a>
						</header>
						<p class="user_id">▷ 교육 시스템으로 이동하기</a></p>
					</section>

				</div>
				<div class="col-4 col-6-medium col-12-small">

					<!-- Feature -->
					<section id="section3">
						<header>
							<a href="https://portal.sungshin.ac.kr:446/web/10145/1"><img class="center" src="./images/portal.PNG" alt=""
								style="width: 150px;" /></a>
						</header>
						<p class="user_id">▷ 포탈로 이동하기</p>
					</section>

				</div>
				<div class="col-4 col-6-medium col-12-small">

					<!-- Feature -->
					<section id="section1">
						<header>
							<a href="http://sugang.sungshin.ac.kr/main.html"><img class="center" src="./images/sugang.PNG" alt=""
								style="width: 150px;" /></a>
						</header>
						<p class="user_id">▷ 수강신청 페이지로 이동하기</p>
					</section>
				</div>
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
						<h3 class="linee">데이터베이스프로그래밍 3조</h3>
						<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="mypage.jsp">마이페이지</a> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="logoutAction.jsp">로그아웃</a> <br> <br>
					</header>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">******@gmail.com</a></li>
						<li class="fa-phone">(82+)010-****-****</li>
						<li class="fa-home">서울특별시 성북구<br /> 보문로 34다길 2, 성신여자대학교
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved.
						Design: wonhee Jeong.</p>
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