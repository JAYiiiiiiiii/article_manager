<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>This is Error Page!</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style>
    body {
        <!--background-color : #7cfaa2;-->
	background-image: url("./images/pic1.jpg");
    background-size: cover;
    }
    </style>
  </head>
  <body>
    <div class="title">
      <h2>This is Error Page!</h2>
    </div>
    <h2 class="headline">
		<a href="welcome.jsp">返回欢迎页</a>
	</h2>
    <div class="content">
    <h2>您执行的操作引起了一些问题（或者触发了本系统的一些BUG），比如：</h2>
    <h2>重复添加同样标题的文章，等等</h2>
    <h2>请在检查后重新操作，谢谢</h2>
    </div>
  </body>
</html>