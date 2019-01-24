<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.bbs" %>	
<%@ page import="bbs.bbsDAO" %>	
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정하기</title>
</head>
<body>
<%

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
	}else{
		if(request.getParameter("post_title") == null || request.getParameter("post_content") == null || request.getParameter("post_title").equals("") || request.getParameter("post_content").equals("")){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{

			bbsDAO bbsDAO = new bbsDAO();
			int result = bbsDAO.update(post_id, request.getParameter("post_title"), request.getParameter("post_content"));

			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}

			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs.jsp'");
				//script.println("history.back()");
				script.println("</script>");
			}

	}

	}

	

%>

</body>
</html>