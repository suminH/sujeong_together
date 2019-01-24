<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDAO" %>	
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.bbs" scope="page" />
<jsp:setProperty name="bbs" property="post_title" /> 
<jsp:setProperty name="bbs" property="post_content" />
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정같이</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String user_id = null;
	if(session.getAttribute("user_id") != null){//유저아이디이름으로 세션이 존재하는 회원들은 
		user_id = (String) session.getAttribute("user_id");//유저아이디에 해당 세션값을 넣어준다.
	}
		
	if(user_id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
	
		if(bbs.getPost_title() == null || bbs.getPost_content() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			bbsDAO bbsDAO = new bbsDAO();
			int result = bbsDAO.write(bbs.getPost_title(), user_id, bbs.getPost_content());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");	
				script.println("var b = confirm('상품을 바로 등록하시겠습니까?')");
				script.println("if(b == true){");
				script.println("location.href='goods.jsp'");
				script.println("}else {");
				script.println("location.href='bbs.jsp'");
				script.println("}");
				//script.println("history.back()");
				script.println("</script>");
			}
			
	}

	
		
	}
	
%>
</body>
</html>
 