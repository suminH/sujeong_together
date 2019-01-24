<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>수정같이_성신여대공동구매사이트</title>
</head>
<body>
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
							<div class="col-lg-4"></div>
							<div class="col-lg-4">
								<div class="jumbotron" style="padding-top: 20px;">
									<form method="post" action="joinAction.jsp">
										<h3 style="text-align: center;">회원가입 화면</h3>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="학번"
												name="user_id" maxlength="20">
										</div>

										<div class="form-group">
											<input type="password" class="form-control"
												placeholder="비밀번호" name="user_pw" maxlength="20">
										</div>

										<div class="form-group">
											<input type="text" class="form-control" placeholder="이름"
												name="user_name" maxlength="20">
										</div>

										<div class="form-group">
											<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span> 구매자<input
												type="radio" name="user_div" value="buyer"> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
											총대<input type="radio" name="user_div" value="seller">
										</div>

										<input type="submit" class="btn btn-primary form-control"
											value="회원가입">
									</form>
								</div>
							</div>
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
						<li><a href="write.jsp">총대매기(총대용_게시글쓰기)</a></li>
						<li><a href="bbs.jsp">구매하기(구매자용_게시글보기)</a></li>
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
						<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="login.jsp">로그인</a> <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<a href="join.jsp">회원가입</a> <br> <br>
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