<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="tag.TagDTO" %>
<%@ page import="tag.TagDAO" %>
<%@ page import="java.util.Arrays" %>

<% 	
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 해주세요.');");
				script.println("location.href = 'userLogin.jsp';");
				script.println("</script>");
				script.close();
				return;
		}

		String [] no = null;
		String [] deleteList = null;
		String deleteItem = null;
		
		if (request.getParameterValues("deleteList") != null) {
			deleteList = request.getParameterValues("deleteList");
			deleteItem = deleteList[0];
			no = deleteItem.split(",");
			
			// System.out.println ("체크: " + no[0]);
		}
		
		if (no == null || no.length == 0) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('선택된 항목이 없습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		TagDAO tagDAO = new TagDAO();
		int result = 0;
		
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('Tag 삭제 실패');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('삭제가 완료되었습니다.');");
	 		script.println("location.href = 'index.jsp';");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		
		
			
	%>