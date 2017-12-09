<%@page import="wz.service.BestPostBiz"%>
<%@page import="wz.model.BestPost"%>
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
    
    <title>浏览我的私有文章</title>
    
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
                <li role="presentation" ><a href="<%=path%>/pages/change-info.jsp">更改个人信息</a></li>
                <li role="presentation" ><a href="<%=path%>/pages/user_create_discuss.jsp">新建文章分类</a></li>
                <li role="presentation" ><a href="<%=path%>/pages/mypost.jsp">我的公开文章</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/pages/myprivatepost.jsp">我的私有文章</a></li>
                <li role="presentation"><a href="<%=path+"/publish_post.jsp"%>">新建文章</a></li>
                <li role="presentation"><a href="<%=path+"/publish_private_post.jsp"%>">新建私有文章</a></li>
                <li role="presentation"><a href="<%=path%>/pages/records.jsp">精华文章申请记录</a></li>

            </ul>
        </div>

        <div class="col-md-9">

            <ul class="list-group">
                <a class="list-group-item active">
                    我的文章
                </a>

               <% ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                  	   PrivatePostBiz privatePostBiz = (PrivatePostBiz)context.getBean("privatePostBiz");
                  	   String pageNumStr = request.getParameter("page");
                  	   int pageNum = 1;
                  	   if (pageNumStr != null)
                  	   pageNum = Integer.parseInt(pageNumStr);
                  	   List<PrivatePost> privatePosts = privatePostBiz.getPrivatePostByUserId((Integer)session.getAttribute("userId"),pageNum,10);
                  	   for (PrivatePost privatePost:privatePosts){
                  	  
                  	  
                %>
               
                <div class="list-group-item">
                    <a href="<%=path%>/pages/privatePost.jsp?privatePostId=<%=privatePost.getId()%>&&page=1" style="color:grey">
                        <h4 class="list-group-item-heading" style="color:black">[<%=privatePost.getTitle() %>]</h4>
                        <%=privatePost.getSubSubForum().getTitle()%>
                    </a>
                    
                    <a href="<%=path%>/userPrivatePostdelete.action?privatePostId=<%=privatePost.getId() %>" style="float: right">删除&nbsp;</a>
                    <a href="<%=path%>/editprivatePost.action?privatePostId=<%=privatePost.getId()%>" style="float: right">编辑&nbsp;</a>
                    <a href="<%=path%>/priToPub.action?privatePostId=<%=privatePost.getId()%>" style="float: right">设置公开&nbsp;</a>
                    <p style="float: right;margin-right: 50px">发表日期:<%=privatePost.getTime()%></p>
                </div>
 				<%} %>
            </ul>
            
   <ul class="pagination pagination-lg" style="float:right">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/pages/myprivatepost.jsp?page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/myprivatepost.jsp?page="+i%>"><%=i%></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/pages/myprivatepost.jsp?page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/pages/myprivatepost.jsp?page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
     <li class="active"><a href="<%=path+"/pages/myprivatepost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
   
    <%}else {%>
     <li class=""><a href="<%=path+"/pages/myprivatepost.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/pages/myprivatepost.jsp?page="+maxPage%>">&raquo;</a></li>
    <%}%>
    
   
</ul><br>

        </div>
    </div>
</div>



  </body>
</html>
