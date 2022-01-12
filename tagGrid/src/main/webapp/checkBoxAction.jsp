<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="tag.TagDTO" %>
<%@ page import="tag.TagDAO" %>

<% 	
	
		
%>

<script>
	$('#allCheck').click(function() {
		if ($("input:checkbox[id='allCheck']").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
</script>