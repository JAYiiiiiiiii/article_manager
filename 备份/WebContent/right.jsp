<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
       <table width="100%">
          <tr bgcolor="yellow" height="30">
          <td><marquee scrolldelay="100" direction="left"><font size="4" color="red"><b>欢迎使用文章管理器！</b></font></marquee></td>
          </tr>
       </table>
      <p> 
</p>
<p align="center">
       <font color="red" size="6"><b></b></font><br/>    
</p>
   &nbsp;&nbsp;&nbsp; 学习和开发中，经常会在网络上查询到有用的文章，或开发中的心得体
会等，都需要随时记录下来，供以后查阅或同他人分享
</p>
  </body>
</html>
