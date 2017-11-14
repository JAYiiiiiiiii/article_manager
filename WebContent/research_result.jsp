<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*,model.Article" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'research_result.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
     <p align="center">
                <font size="6"><b>article list</b></font>          
            </p>
            <hr  style="border: 1px dashed black; width: 80%; height: 1px;" /><br/>
  <table align="center" border="1" width="80%">
  		<tr align="center">
  			<td>article category</td>
  			<td>title</td>
  			<td>author</td>
  			<td>article address</td>
  			<td>publish time</td>
  		</tr>
  		<%
  		List articleList = (List) request.getAttribute("rearticleList");
  		for(int i = 0;i<articleList.size();i++){
  			Article article = (Article)articleList.get(i);
  		 %>
  		<tr>
  			<td><%=article.getCategory() %></td>
  			<td><a href="<%=article.getFilepath()%>" target="_blank"><%=article.getTitle() %></a></td>
  			<td><%=article.getAuthor() %></td>
  			<td><%=article.getFilepath() %></td>
  			<td><%=article.getUploadtime() %></td>
  		</tr>
  		<%} %>
  	</table>
  <body bgcolor="#68EE68">
     	
  </body>
</html>
