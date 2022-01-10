<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<% 	
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인이 된 상태입니다.');");
				script.println("location.href = 'index.jsp';");
				script.println("</script>");
				script.close();
				return;
		}
		String password = null;
		String userName = null;
		String userPlant = null;
		String userEmail = null;
		
		if(request.getParameter("userID") != null) {
			userID = request.getParameter("userID");
		}
		if(request.getParameter("password") != null) {
			password = request.getParameter("password");
		}
		if(request.getParameter("userName") != null) {
			userName = request.getParameter("userName");
		}
		if(request.getParameter("userPlant") != null) {
			userPlant = request.getParameter("userPlant");
		}
		if(request.getParameter("userEmail") != null) {
			userEmail = request.getParameter("userEmail");
		}
	
		if (userID == null || password == null || userName == null || userPlant == null || userEmail == null) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('입력되지 않은 항목이 있습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, password, userName, userPlant, userEmail, SHA256.getSHA256(userEmail), "false"));
		if (result == -1) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('이미 존재하는 계정입니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('회원가입에 성공했습니다.');");
	 		script.println("location.href = 'emailSendAction.jsp'");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
	%>