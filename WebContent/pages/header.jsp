<%@page import="wz.service.MainForumBiz"%>
<%@page import="wz.model.MainForum"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/titlebar.css" rel="stylesheet">
  <!-- 
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
     -->
      <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
  
  <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">文章管理器 v2.0</a>
            </div>
            
            <div>
      <ul class="nav navbar-nav">
         <li><a href="<%=path%>/index.jsp">首页</a></li>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               文章分类 <b class="caret"></b>
            </a>
           
            <ul class="dropdown-menu">
             <%
             ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                  	    MainForumBiz mainbiz = (MainForumBiz)context.getBean("mainForumBiz");
                  	   List<MainForum> mains = mainbiz.getAllMainForums();
                  	   int size = mains.size();
                  	    for (int i=0; i<size; i++){
                  	   MainForum main = mains.get(i);
                  	    %>
               
               <li class="divider"></li>
               <li><a href="<%=request.getContextPath() %>/more.action?type=<%=main.getId()%>&&page=1"><%=main.getTitle() %></a></li>
               <%} %>
              
            </ul>
            
         </li>
          <li><a href="<%=request.getContextPath() %>/more.action?type=-3&&page=1">网站热文</a></li>
          <li><a href="<%=request.getContextPath() %>/more.action?type=-1&&page=1">最新文章</a></li>
          <li><a href="<%=request.getContextPath() %>/more.action?type=-2&&page=1">精华文章</a></li>
      </ul>
   </div>
            
            
            
          
            <% String username  = (String)session.getAttribute("username");
            String adminname  = (String)session.getAttribute("adminname");
            if (username == null && adminname == null){
             %>                                 
            <ul class="nav navbar-nav navbar-right user">
                <li><a href="<%=request.getContextPath()%>/login.jsp">登陆</a></li>
                <li><a href="<%=request.getContextPath()%>/regist.jsp">注册</a></li>
            </ul>
            <p class="navbar-text navbar-right">尊敬的游客您好！</p>
            
	      
   
            <%}
            else if (username != null && adminname == null){
             %>
               <ul class="nav navbar-nav navbar-right user">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <%=username%> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=path+"/pages/change-info.jsp"%>">更改个人信息</a></li>
                            <li><a href="<%=path%>/pages/user_create_discuss.jsp">新建文章分类</a></li>
                            <li><a href="<%=path+"/pages/mypost.jsp?page=1"%>">我的公开文章</a></li>
                            <li><a href="<%=path+"/pages/myprivatepost.jsp?page=1"%>">我的私有文章</a></li>
                            <li><a href="<%=path+"/publish_post.jsp"%>">新建文章</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=path+"/logout.action"%>">退出登陆</a></li>
                        </ul>
                    </li>
                </ul>
                 <p class="navbar-text navbar-right">尊敬的用户您好！</p>
                 
                <%
                }else {
             %>
             
             <ul class="nav navbar-nav navbar-right user">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <%=adminname%> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li ><a href="<%=path%>/manage/notice.jsp">发布公告</a></li>
			                <li  ><a href="<%=path%>/manage/change-admin.jsp">修改资料</a></li>
			                <li ><a href="<%=path%>/manage/newpost.jsp">查看新文章</a></li>
			                <li><a href="<%=path%>/manage/bestpost.jsp">精品文章申请</a></li>
			                <li><a href="<%=path%>/manage/create_discuss.jsp">创建新文章分类</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=path+"/logout.action"%>">退出登陆</a></li>
                        </ul>
                    </li>
                </ul>
                 <p class="navbar-text navbar-right">尊敬的管理员您好！</p>
             
             <%} %>
                <form class="navbar-form navbar-right" role="search" action="<%=request.getContextPath()%>/search.action">
		       <div class="input-group">
	         <input type="text" class="form-control" name="keywords" placeholder="search">
	        <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
	     		 </div>
      		</form> 
            </nav>
  
  </body>
</html>
