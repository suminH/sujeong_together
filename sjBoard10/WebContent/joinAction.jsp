<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_pw" />
<jsp:setProperty name="user" property="user_name" />
<jsp:setProperty name="user" property="user_div" />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정같이_성신여대공동구매사이트</title>
</head>
<body>
<%
	String user_id=null;
	if(session.getAttribute("user_id")!=null){
		user_id=(String)session.getAttribute("user_id");
	}
	if(user_id!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
	if(user.getUser_id() == null || user.getUser_pw() == null || user.getUser_name() == null){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
	
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("user_id", user.getUser_id());
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");	
		}
	}
	%>
</body>
</html>