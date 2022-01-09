<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<% 	
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		String password = null;
		
		if(request.getParameter("userID") != null) {
			userID = request.getParameter("userID");
		}
		if(request.getParameter("password") != null) {
			password = request.getParameter("password");
		}
		if (userID == null || password == null) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('입력되지 않은 항목이 있습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, password);
		if (result == 1) {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("location.href = 'index.jsp'");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else if (result == 0) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('비밀번호가 틀렸습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('존재하지 않는 아이디입니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else if (result == -2) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('데이터베이스 오류가 발생했습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;	
	 	
		}
	%>