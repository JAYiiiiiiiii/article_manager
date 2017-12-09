<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("username") == null){
response.sendRedirect(path+"/login.jsp");
return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创建新文章分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <script type="text/javascript" src="ckeditor/ckeditor.js"></script>

  </head>
  
  <body>
    <jsp:include page="/pages/header.jsp"/>
  <div class="container" style="margin-top: 80px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=path%>/pages/change-info.jsp">修改资料</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/pages/user_create_discuss.jsp">创建新文章分类</a></li>
                <li role="presentation" ><a href="<%=path%>/pages/mypost.jsp">我的公开文章</a></li>
                <li role="presentation"><a href="<%=path%>/pages/mypost.jsp">我的私有文章</a></li>
                <li role="presentation"><a href="<%=path%>/pages/records.jsp">申请记录</a></li>
            </ul>
        </div>

  <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        创建新文章分类
                    </h3>
                </div>
                <div class="panel-body">


                    <div class="column">

						<form action="<%=path%>/userCreatediscuss.action" method="post">
                        <div class="form-group">
                            <label for="name">第一层目录名称</label>
                            <input type="text" class="form-control" id="name" name="mainForum" width="200px" height="80px"
                                   placeholder="请输入第一层目录名称">
                        </div>

                        <div class="form-group">
                            <label for="name">第二层目录名称</label>
                            <input type="text" class="form-control" id="name" name="subForum" width="200px" height="80px"
                                   placeholder="请输入第二层目录名称">
                        </div>

                        <div class="form-group">
                            <label for="name">第三层目录名称</label>
                            <input type="text" class="form-control" id="name" name="subSubForum" width="200px" height="80px"
                                   placeholder="请输入第三层目录名称">(第二层子目录用分号割开，第三层子目录之间用逗号隔开)
                        </div>

                        <p><button type="submit" class="btn btn-primary">创建新目录</button></p>
                    </div>
                        <s:fielderror fieldName="create_result"></s:fielderror>
                    
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
   
  </body>
  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  	 	$("#signupForm").validate();
  	});
  </script>
</html>
