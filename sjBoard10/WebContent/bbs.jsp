<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="bbs.bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="comment.commentDAO"%>
<%@ page import="comment.comment"%>
<jsp:useBean id="user" class="user.User" scope="page" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">


<title>수정같이</title>
<style>
#bbs, #bbs:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>

<body>
	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->

	<%
		String user_id = null;

		String user_div = (String) session.getAttribute("user_div");

		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		}

		int com_id = 0;
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
							<div class="row">
								<table class="table table-striped"
									style="text-align: center; border: 1px;">
									<thead>
										<tr>
											<th style="background-color: #3182B5; text-align: center;">번호</th>
											<th style="background-color: #3182B5; text-align: center;">제목</th>
											<th style="background-color: #3182B5; text-align: center;">작성자</th>
											<th style="background-color: #3182B5; text-align: center;">작성일</th>
										</tr>
									</thead>
									<tbody>

										<%
											bbsDAO bbsDAO = new bbsDAO();
											ArrayList<bbs> list = bbsDAO.getList(pageNumber);
											for (int i = 0; i < list.size(); i++) {
										%>

										<tr>
											<td><%=list.get(i).getPost_id()%></td>
											<td><a id="bbs"
												href="View.jsp?post_id=<%=list.get(i).getPost_id()%>"><%=list.get(i).getPost_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("/n", "<br>")%></a></td>
											<td><%=list.get(i).getUser_id()%></td>
											<td><%=list.get(i).getPost_date().substring(0, 11) + list.get(i).getPost_date().substring(11, 13)
						+ "시" + list.get(i).getPost_date().substring(14, 16) + "분"%></td>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
								
									<%
										if (pageNumber != 1) {
									%>
									<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
										class="btn btn-success btn-arraw-left">이전</a>
									<%
										}
										if (bbsDAO.nextPage(pageNumber + 1)) {
									%>
									<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
										class="btn btn-success btn-arraw-left">다음</a>
									<%
										}
									%>

									<a href="write.jsp" class="btn btn-primary pull-right"
										style="background-color: #3182B5;">글쓰기</a>
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
						<li><a href="write.jsp">총대매기(수요조사 글올리기)</a></li>
						<li><a href="bbs.jsp">구매참여하기</a></li>
						<li><a href="bbs_goods.jsp">상품 상세보기</a></li>
						<li><a href="priceCompare.jsp">가격비교</a></li>


					</ul>
				</nav>

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
						%>
						<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
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

