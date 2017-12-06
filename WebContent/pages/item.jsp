<%@page import="wz.model.Post"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html lang="zh">
<head>
    <title>搜索结果</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/search-result.css" rel="stylesheet"/>
   
    
</head>

  
  <body>
  <jsp:include page="/pages/header.jsp"/>
  
   <div class="list-group search-list">
    <p class="list-group-item active">
    
    <%
    	List<Post> posts = (List)request.getAttribute("posts");
    	if (posts.size()>0){
    %>
        搜索结果如下：
   
    <%}
    	else {
    %>
    抱歉！未找到符合条件的文章
    <%} %>
     </p>
    <%
        	for (Post post:posts){
     %>
    <a href="<%=path%>/pages/post.jsp?postId=<%=post.getId()%>&&page=1" class="list-group-item">
            <h4 class="list-group-item-heading">
                [<%=post.getTitle()%>]
            </h4>
            <%=post.getSubForum().getMainForum().getTitle() %>：&nbsp<%=post.getSubForum().getTitle() %>
            <p class="text-right post-date">浏览量:<%=post.getViewNum()%>&nbsp;评论量:<%=post.getReplyNum()%>&nbsp;发表日期:<%=post.getTime()%></p>
    </a>
    <%} %>
</div>


  </body>
</html>
