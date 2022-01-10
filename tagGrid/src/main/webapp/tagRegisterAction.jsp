<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="tag.TagDTO" %>
<%@ page import="tag.TagDAO" %>

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

		String tagID = null;
		String tagKR = null;
		String tagEN = null;
		String UOM = null;
		String plant = null;
		String process = null;
		String equip = null;
		String tagUse = null;
		
		if(request.getParameter("tagID") != null) {
			tagID = request.getParameter("tagID");
		}
		if(request.getParameter("tagKR") != null) {
			tagKR = request.getParameter("tagKR");
		}
		if(request.getParameter("tagEN") != null) {
			tagEN = request.getParameter("tagEN");
		}
		if(request.getParameter("UOM") != null) {
			UOM = request.getParameter("UOM");
		}
		if(request.getParameter("plant") != null) {
			plant = request.getParameter("plant");
		}
		if(request.getParameter("process") != null) {
			process = request.getParameter("process");
		}
		if(request.getParameter("equip") != null) {
			equip = request.getParameter("equip");
		}
		if(request.getParameter("tagUse") != null) {
			tagUse = request.getParameter("tagUse");
		}
	
		if (tagID == null || plant == null || process == null || equip == null || tagUse == null || tagID == "" ) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('입력되지 않은 항목이 있습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		if (tagKR == null && tagEN == null) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('태그명 한글/영문 중 한 가지는 입력되어야 합니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		TagDAO tagDAO = new TagDAO();
		
		int result = tagDAO.write(new TagDTO(0, 0, tagID, tagKR, tagEN, UOM, plant, process, equip, tagUse, null)) ;
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('강의 평가 등록 실패');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
		} else {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("location.href = 'index.jsp';");
	 		script.println("</script>");
	 		script.close();
	 		return;
		}
		
		
		
			
	%>