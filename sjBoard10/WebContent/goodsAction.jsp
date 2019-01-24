<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="goods.goodsDAO" %>	
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="goods" class="goods.goods" scope="page" />
<jsp:setProperty name="goods" property="goods_name" /> 
<jsp:setProperty name="goods" property="goods_type" />
<jsp:setProperty name="goods" property="goods_price" /> 

  
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
	
		if(goods.getGoods_name() == null || goods.getGoods_price()==0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{ //name, type, price, user_id
			goodsDAO goodsDAO = new goodsDAO(); 
	 	 	int result = goodsDAO.goods(goods.getGoods_name(), goods.getGoods_type(),
					goods.getGoods_price(), user_id, goods.getGoods_available()); 
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
				script.println("location.href='bbs_goods.jsp'");
				//script.println("history.back()");
				script.println("</script>");
			}
		
		
	}

	
		
	}
	
%>
</body>
</html>
 