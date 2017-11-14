<%@ page language="java"  import="java.util.*,model.Article" pageEncoding="UTF-8"%>
<jsp:useBean id="ssi" class="serviceImpl.ManagerServiceImpl"></jsp:useBean>
<%List articleList = (List) request.getAttribute("articleList"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#68EE68">
    <p align="center">
                <font size="6"><b>article list</b></font>          
            </p>
            <hr  style="border: 1px dashed black; width: 80%; height: 1px;" /><br/>
  <table align="center" border="1" width="80%">
  		<tr align="center">
  			<td>article category</td>
            <td>title</td>
            <td>author</td>
            <td>publish time</td>
            <td>operate</td>
  		</tr>
  		<%
  		for(int i = 0;i<articleList.size();i++){
  			Article article = (Article)articleList.get(i);
  		 %>
  		<tr align="center">
  			<td><%=article.getCategory() %></td>
  			<td><a href="<%=article.getFilepath()%>" target="_blank"><%=article.getTitle() %></a></td>
  			<td><%=article.getAuthor() %></td>
  			<td><%=article.getUploadtime() %></td>
            <td><a href = onbuild.jsp >delete</a></td>
  		</tr>
  		<%} %>
  	</table>
  </body>
</html>
