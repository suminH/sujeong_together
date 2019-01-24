<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <%-- 자바스크립트 작성 위해 --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_id" /> <%-- 로그인페이지에서 받아서 넘겨주는거 --%>
<jsp:setProperty name="user" property="user_pw" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정같이_성신여대공동구매사이트</title>
</head>
<body>
	<%
	String user_id=null;
	if(session.getAttribute("user_id")!=null){
		user_id = (String)session.getAttribute("user_id");
	}
	if(user_id!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUser_id(), user.getUser_pw());
	if (result==1){
		session.setAttribute("user_id", user.getUser_id());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		}else if(result==0){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		}else if(result==-1){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		}else if(result==-2){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
	%>
	
</body>
</html>