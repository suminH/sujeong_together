<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">

<title>수정같이_성신여대공동구매사이트</title>
</head>
<body>

	<%
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		}
	%>
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
					<div class="center">
						<div class="container">
							<!-- Section -->
							<section>
								<div class="posts">
									<article>
										<a href="https://www.momotee.co.kr" class="image"><img
											src="./images/momotee.png" alt="모모티 바로가기" /></a>
										<p>
											후드 평균가 : 20,232 원<br /> 야구 잠바 평균가 : 31,043 원 <br /> 패딩 평균가
											: 49,856 원
										</p>

									</article>
									<article>
										<a href="https://www.townus.co.kr" class="image"><img
											src="./images/town.png" alt="타운어스 바로가기" /></a>
										<p>
											후드 평균가 : 25,209 원<br /> 야구 잠바 평균가 : 41,147 원 <br /> 패딩 평균가
											: 52,806 원
										</p>

									</article>
									<article>
										<a href="http://moggogio.cafe24.com" class="image"><img
											src="./images/mocco.png" alt="모꼬지오 바로가기" /></a>
										<p>
											후드 평균가 : 13,200 원<br /> 야구 잠바 평균가 : 43,152 원 <br /> 패딩 평균가
											: 51,786 원
										</p>

									</article>
									<article>
										<a href="http://buzzfactory.co.kr/" class="image"><img
											src="./images/buz.png" alt="버즈팩토리 바로가기" /></a>
										<p>
											후드 평균가 : 12,900 원<br /> 야구 잠바 평균가 : 34,900 원 <br /> 패딩 평균가
											: 49,900 원
										</p>

									</article>

								</div>
							</section>

						</div>
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
						<li><a href="bbs_goods.jsp">상품 상세보기</a></li>
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
						<a href="join.jsp">회원가입</a> <br> <br>
						<%
							} else {
						%><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="mypage.jsp">마이페이지</a> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="logoutAction.jsp">로그아웃</a> <br> <br>
						<%
							}
						%>
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
						Developed by JooHye-Yoon, WonHee-Jeong, SuMin-Hwang</p>
				</footer>

			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/skel.min.js"></script>
	<script src="./js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="./js/main.js"></script>

</body>
</html>