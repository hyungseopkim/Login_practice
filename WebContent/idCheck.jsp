<%@page import="kh.web.utils.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<% 
	
	    request.setCharacterEncoding("utf-8");
	
		out.write(request.getParameter("id"));
	    String id = request.getParameter("id");
	    LoginDAO dao = new LoginDAO();
		
	    boolean result = dao.idCheck(id);
	    
	    if(result == false){%>
	    	<h4>사용 가능한 아이디입니다.</h4>
	    	<button id="useId">사용하기</button>
	    	<button id="cancel">취소</button>
	    	<script>
				window.onload = function(){
					document.getElementById("useId").onclick = function(){
						window.close();
					};
					
					document.getElementById("cancel").onclick = function(){
						opener.document.getElementById("id").value = "";
						window.close();
					};
				}
			</script>
	    <% } else {%>
	    	<h4>존재하는 아이디입니다.</h4>
	    	<button id="cancel">확인</button>
	    	<script>
				window.onload = function(){
					document.getElementById("cancel").onclick = function(){
						opener.document.getElementById("id").value = "";
						window.close();
					};
				}
			</script>
	    <%}%>
	
</body>
</html>