<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>login</title>
	<script type="text/javascript" language="javascript">
    	function loginSubmit(){
    		if(frm.username.value==""){
    			alert("用户名不能为空!");
    			return false;
    		}
    		if(frm.password.value==""){
    			alert("密码不能为空!");
    			return false;
    		}
    		return true;
    	}   	
    </script>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <form name="frm" method="post" action="login.do" >
     <table  border="0" align="center" cellspacing="10">
      <tr>
        <td>用户名</td>
        <td><input type="text" name="username" size="15" ></td>
      </tr>
      <tr>
        <td>密  码</td>
        <td><input type="password" name="password" size="15" ></td>
      </tr>
      <tr>
        <td><input type="submit" value="登录" name="submit" onclick="return loginSubmit();" /></td>
        <td><input type="reset" value="重置" name="reset" /></td>
        <td><a href="register.jsp" target="_blank">注册</a></td> 
      </tr>
    </table>
  </form>
  </body>
</html>
