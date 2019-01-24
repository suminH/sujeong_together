<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>	
<%@ page import="bbs.bbs" %>	
<%@ page import="bbs.bbsDAO" %>	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>수정같이</title>
</head>
<body>
	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String) session.getAttribute("user_id");
		}
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = login.jsp'");
			script.println("</script>");	
		}

		int post_id = 0 ;
		if(request.getParameter("post_id") != null){
			post_id = Integer.parseInt(request.getParameter("post_id"));
		}
		if(post_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다..')");
			script.println("location.href = bbs.jsp'");
			script.println("</script>");
		}

		bbs bbs = new bbsDAO().getBbs(post_id);
		if(!user_id.equals(bbs.getUser_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = bbs.jsp'");
			script.println("</script>");
		}
	%>

	<nav class="navbar navbar-default">
		<div class="naver-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
					</button>

			<a class="navbar-brand" href="main.jsp">수정같이</a>

		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">HOME</a>
				<li class="active"><a href="bbs.jsp">게시판</a>
			</ul><ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					data-toggle="dropdown" role="button" aria-haspopup="true" 
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>		
				</ul> 	
				</div>
	</nav>
	<div class="container">
		 <div class="row">
		 	<form method="post" action="updateAction.jsp?post_id=<%= post_id %>">

			 	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd;">
			 		<thead>
						<tr>
							<th colspan="1" style="background-color:#eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>		 		
			 		</thead>
			 		<tbody>
			 			<tr>
			 				<td><input type="text" class="form-control" placeholder="글제목" name="post_title" maxlength="50" value="<%= bbs.getPost_title() %>"></td>
			 			</tr>

			 			<tr>	
			 				<td><textarea class="form-control" placeholder="글 내용" name="post_content" maxlength="2048" style="height:350px"><%= bbs.getPost_content() %></textarea> </td>
			 			</tr>	
			 		</tbody>
		 	</table>
				 	<input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
		 </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>

 