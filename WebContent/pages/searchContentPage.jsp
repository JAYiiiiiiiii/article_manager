<%@page import="wz.service.BestPostBiz"%>
<%@page import="wz.model.BestPost"%>
<%@page import="wz.model.Post"%>
<%@page import="wz.service.PostBiz"%>
<%@page import="wz.model.PrivatePost"%>
<%@page import="wz.service.PrivatePostBiz"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("username") == null){
	response.sendRedirect("/edit-project/login.jsp");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章搜索页面</title>
    
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
    <jsp:include page="/pages/header.jsp"/>
   
   <div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=path%>/pages/searchPage.jsp">按题目搜索</a></li>
                <li role="presentation"><a href="<%=path%>/pages/searchTimePage.jsp">按时间搜索</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/pages/searchContentPage.jsp">按文章内容搜索</a></li>
            </ul>
            <br/>

            <form role="search" action="<%=request.getContextPath()%>/searchContent.action">
		       <div class="input-group">
	         <input type="text" class="form-control" name="keywords" placeholder="search">
	        <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
	     		 </div>
      		</form> 
        </div>

        <div class="col-md-9">
             

            <div class="list-group search-list">
                <p class="list-group-item active">
                
                <%
                    List<Post> posts = (List)request.getAttribute("posts");
                    if (posts != null && posts.size()>0){
                %>
                    公开文章搜索结果如下：
            
                <%}
                    else {
                %>
                未找到符合条件的公开文章或未输入搜索条件
                <%} %>
                </p>


                <%
                if (posts != null){
                        for (Post post:posts){
                         
                %>
                <a href="<%=path%>/pages/post.jsp?postId=<%=post.getId()%>&&page=1" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            [<%=post.getTitle()%>]
                        </h4>
                        <%=post.getSubSubForum().getSubForum().getMainForum().getTitle() %>：&nbsp<%=post.getSubSubForum().getSubForum().getTitle() %>：&nbsp<%=post.getSubSubForum().getTitle() %>
                        <p class="text-right post-date">浏览量:<%=post.getViewNum()%>&nbsp;评论量:<%=post.getReplyNum()%>&nbsp;发表日期:<%=post.getTime()%></p>
                </a>
                <%} }%>
            </div>

            <br/>
            <div class="list-group search-list">
                <p class="list-group-item active">
                
                <%
                    List<PrivatePost> privatePosts = (List)request.getAttribute("privatePosts");
                    if (privatePosts != null && privatePosts.size()>0){
                %>
                    我的私有文章搜索结果如下：
            
                <%}
                    else {
                %>
                未找到符合条件的私有文章或未输入搜索条件
                <%} %>
                </p>
                <%
                    if (privatePosts != null){
                        for (PrivatePost privatePost:privatePosts){
                               if (privatePost.getUser().getUsername().equals((String)session.getAttribute("username"))){
                %>
                <a href="<%=path%>/pages/privatePost.jsp?privatePostId=<%=privatePost.getId()%>&&page=1" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            [<%=privatePost.getTitle()%>]
                        </h4>
                        <%=privatePost.getSubSubForum().getSubForum().getMainForum().getTitle() %>：&nbsp<%=privatePost.getSubSubForum().getSubForum().getTitle() %>：&nbsp<%=privatePost.getSubSubForum().getTitle() %>
                        <p class="text-right post-date">发表日期:<%=privatePost.getTime()%></p>
                </a>
                <%}} }%>
            </div>
        </div>
    </div>
  </body>
</html>
