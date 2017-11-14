<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register_success.jsp' starting page</title>
    
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <p align="center"><img src = "images/9.png" height="80"><font size="5" color="green"><b>恭喜您！注册成功！</b></font></p>
     <p align="center"><a href ="main.jsp">返回首页</a></p>
  </body>
</html>
