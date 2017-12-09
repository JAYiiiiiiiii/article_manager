<%@page import="wz.service.UserBiz"%>
<%@page import="wz.model.User"%>
<%@page import="wz.model.Followcard"%>
<%@page import="wz.model.PrivatePost"%>
<%@page import="wz.service.PrivatePostBiz"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" autoFlush="false" buffer="1000kb"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>私有文章浏览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
     <link href="css/post-detail.css" rel="stylesheet">
     <script type="text/javascript" src="ckeditor/ckeditor.js"></script>

  </head>
  
  <body>
<div style="height:100%">
  
   <jsp:include page="/pages/header.jsp"/>
  	 <div class="container" style="margin-top: 50px">
  	<%
  		
  		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
  		 PrivatePostBiz privatePostBiz = (PrivatePostBiz)context.getBean("privatePostBiz");
  		 int privatePostId  = 1;
  		 String pid = request.getParameter("privatePostId");
  		 if (pid == null)
  		 privatePostId = (Integer)request.getAttribute("privatePostId");
  		 else 
  		 privatePostId = Integer.parseInt(pid);
  		 PrivatePost privatePost = privatePostBiz.getPrivatePostById(privatePostId);
  		 int pageNum  = 1;//评论所在的页数
  		 String num = request.getParameter("page");
  		 if (num != null)
  		    pageNum = Integer.parseInt(num);
  		 else 
  		 	pageNum = (Integer)request.getAttribute("page");
  		 System.out.println("privatePostId"+privatePostId+"pageNum:"+pageNum);
  		 privatePostBiz.autoIncreaseViewNum(privatePostId);
  	 %>
  	 
  
    <div class="row">
       <div class="col-md-1 post-border">
       </div>
        <div class="col-md-2 post-head">
                <!--<img src="img/tm-bg-slide-1.jpg" width="80px" height="80px" class="img-responsive img-circle">-->
            <img  alt="头像未加载" class="img-responsive img-circle" src="<%=path+"/"+privatePost.getUser().getPhotoUrl() %>"
                  style="margin:1px 1px;width: 120px;height: 120px;margin: 30px auto;"/>

                <span class="user-info">
                            <span class="badge" style="background: #f1c40f;margin-top: 5px">文章作者</span>
                            :<span class="badge" style="background: #f1c40f;margin-top: 5px"><%=privatePost.getUser().getUsername()%></span>
                        </span><br/>
                        <span class="user-info">
                            <span class="badge" style="background: #2ecc71;margin-top: 5px">作者性别</span>
                            :<span class="badge" style="background: #2ecc71;margin-top: 5px"><%=privatePost.getUser().getSex()%></span>
                        </span><br/>
            <br>
        </div>
        <div class="col-md-8 post-content">

            <div class="post-title">
                <h2 style="margin-left:20px;color:black">[<%=privatePost.getTitle()%>]--所属分类：<%=privatePost.getSubSubForum().getTitle()%></h2>
                <div style="margin-left:20px" >

                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;<%=privatePost.getReplyNum() %> &nbsp;|&nbsp;<span>发表于:<%=privatePost.getTime() %></span>
                    <%String username = (String)session.getAttribute("username");
                    if ((username != null && privatePost.getUser().getUsername().equals(username))||(String)session.getAttribute("adminname")!=null){%>
					<a style="float:right;margin-right: 20px;" href="<%=path%>/editpost.action?postId=<%=privatePost.getId()%>">编辑</a>
					<%}%>
                </div>
                <strong style=" float:right;margin-right:10px;margin-top: 10px">
                    <span class="badge" style="background: #ff6927;width: 50px;">作者</span></strong>

            </div>
            <div style="margin: 20px">
               <%=privatePost.getCardContent()%>
            </div>

        </div>
         <div class="col-md-1 post-border">
       </div>

        


    </div>
    </div>
  	 
  	 <ul class="pagination pagination-lg" style="float: right;margin-right: 20px;">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+i%>"><%=i%></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
     <li class="active"><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+pageIndex%>"><%=pageIndex%></a></li>
   
    <%}else {%>
     <li class=""><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/pages/privatePost.jsp?privatePostId="+privatePostId+"&&page="+maxPage%>">&raquo;</a></li>
    <%}%>
    
   
</ul><br>
  	
</form>
</div>



  	
</div>
    
  </body>
</html>
