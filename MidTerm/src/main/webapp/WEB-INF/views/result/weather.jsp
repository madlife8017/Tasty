<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("weather"); 
%>

날씨 : <%=map.get("weather")%> <br>
온도 : <%=map.get("temp")%> <br>
</body>
</html>