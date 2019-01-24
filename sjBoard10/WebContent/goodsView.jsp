<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="goods.goods"%>
<%@ page import="goods.goodsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custorm.css">
<title>수정같이_구매하기</title>
</head>
<body>
	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->
	<%
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		}
		int goods_id = 0;
		if (request.getParameter("goods_id") != null) {
			goods_id = Integer.parseInt(request.getParameter("goods_id"));
		}
		if (goods_id == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다..')");
			script.println("location.href = bbs_goods.jsp'");
			script.println("</script>");
		}
		goods goods = new goodsDAO().getGoods(goods_id);
	%>
	<nav class="navbar navbar-default">
		<div class="naver-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="index.jsp">수정같이</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">HomePage</a>
				<li><a href="write.jsp">총대매기</a>
				<li><a href="bbs.jsp">구매참여하기</a>
				<li><a href="bbs_goods.jsp">상품상세보기</a>
				<li><a href="bbs.jsp">가격비교</a>
			</ul>
			<!-- 접속하기는 로그인안한 사람만 보여주게하기 -->
			<%
				if (user_id == null) {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>

			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #3182B5; text-align: center;">상품 상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">상품 이름</td>
						<td colspan="2"><%=goods.getGoods_name().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("/n", "<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=goods.getUser_id()%></td>
					</tr>
					<tr>
						<td>상품 분류</td>
						<td colspan="2" style="text-align: center;"><%=goods.getGoods_type().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("/n", "<br>")%></td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td colspan="2" style="text-align: center;"><%=goods.getGoods_price()%></td>
					</tr>
				</tbody>
			</table>


			<div align="right">
				<a href="bbs_goods.jsp" class="btn btn-primary">목록</a>
				<a href="buy.jsp" class="btn btn-primary">구매하기</a>
			</div> 
		
		</div>
	</div>

 
	<%
		if ((user_id) != null) {
	%>
	<div class="comment">
		<form method="post" action="commentAction.jsp">
			<input type="hidden" name="comment_id" value="comment_id"> <input
				type="hidden" name="user_id">
			<div class="comment">

				<table align="center">
					<br />
					<tr>
						<td width="150"><%=user_id%></td>
						<td width="550"><textarea name="comment_content" rows="3"
								cols="90"></textarea></td>
						<td width="100"><input type="submit" value="댓글등록" class="btn btn-primary">
					</tr>
				</table>
			</div>
		</form>
	</div>
	<%
		}
	%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>