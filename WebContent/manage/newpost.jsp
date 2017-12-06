<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="wz.model.Post"%>
<%@page import="wz.service.PostBiz"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("adminname") == null){
response.sendRedirect(path+"/manage/admin.jsp");
return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看新文章</title>
    
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
   
   <div class="container" style="margin-top: 80px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=path%>/manage/notice.jsp">发布公告</a></li>
                <li role="presentation" ><a href="<%=path%>/manage/change-admin.jsp">修改资料</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/manage/newpost.jsp">查看新文章</a></li>
                <li role="presentation"><a href="<%=path%>/manage/bestpost.jsp">精华文章申请</a></li>
                <li role="presentation"><a href="<%=path%>/manage/create_discuss.jsp">创建新文章分区</a></li>
            </ul>
        </div>

        <div class="col-md-9">

             <ul class="list-group">
                <a class="list-group-item active">
                    最新文章
                </a>

               <% ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                  	   PostBiz postBiz = (PostBiz)context.getBean("postBiz");
                  	   String pageNumStr = request.getParameter("page");
                  	   int pageNum = 1;
                  	   if (pageNumStr != null)
                  	   pageNum = Integer.parseInt(pageNumStr);
                  	   List<Post> posts=  postBiz.getLatestPosts(pageNum, 10);
                  	   for (Post post:posts){
                  	   
                %>
               
                <div class="list-group-item">
                    <a href="<%=path%>/pages/post.jsp?postId=<%=post.getId()%>&&page=1" style="color:grey">
                        <h4 class="list-group-item-heading" style="color:black">[<%=post.getTitle() %>]</h4>
                        <%=post.getSubForum().getMainForum().getTitle()%>
                    </a>
                    <a href="<%=path%>/postdelete.action?postId=<%=post.getId() %>" style="float: right">删除</a>
                    <p style="float: right;margin-right: 50px">评论量:<%=post.getReplyNum()%>&nbsp;发表日期:<%=post.getTime()%></p>
                </div>
 				<%} %>
 				
 				 <ul class="pagination pagination-lg" style="float:right">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/manage/newpost.jsp?page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/manage/newpost.jsp?page="+i%>"><%=i%></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/manage/newpost.jsp?page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/manage/newpost.jsp?page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
     <li class="active"><a href="<%=path+"/manage/newpost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
   
    <%}else {%>
     <li class=""><a href="<%=path+"/manage/newpost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/manage/newpost.jsp?page="+maxPage%>">&raquo;</a></li>
    <%}%>
    
   
</ul><br>
 				

        </div>
    </div>
</div>
  
  </body>
</html>
