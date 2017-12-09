<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <div  style="margin-top: 80px;background-color: rgba(0,0,0,0.8);height: 100px;color: darkgray">
    <div style="width: 400px;padding-top: 35px;padding-left:40px;padding-right: 40px;margin:auto;">
        <div>
            友情链接：
            <a href="https://github.com" style="color: darkgray">&nbsp;github&nbsp;|&nbsp;</a>
            <a href="http://www.hit.edu.cn" style="color: darkgray">HIT&nbsp;|&nbsp;</a>
            <a href="http://www.cs.hit.edu.cn" style="color: darkgray">HITcs&nbsp;|&nbsp;</a>
            <a href="http://stackoverflow.com/" style="color: darkgray">stackflow</a><br>
            小组成员：王智，贺敏义，武诗杰
        </div>



    </div>
</div>

  
   
  </body>
</html>
