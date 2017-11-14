<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'research.jsp' starting page</title>
    <script type="text/javascript" language="javascript">
    	function researchSubmit(){
    		if(frm.key.value==""){
    			alert("关键字不能为空，请重新输入！");
    			return false;
    		}	       
    		return true;
    	}   	
    </script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#68EE68">
  <form name="frm" method="post" action="research.do">
<p align="center">
                <font size="6"><b>文章搜索</b></font>          
            </p>
            <hr  style="border: 1px dashed black; width: 80%; height: 1px;" /><br/>
  <br>
    <p align="center"><font color="blue"><b>请选择输入的关键字类型：</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="option">
    <option value="title">文章标题</option>
    <option value="class">文章类别</option>
    <option value="author">文章作者</option>
    </select>
     <br>
    </p>
    <p align="center">
     <br> 
    <font color="blue"><b>请输入搜索关键字：</b></font>
    <input type="text" name="key">
      </p>   
      <p align="center">
      <input type="submit" value="提交搜索" onclick="return researchSubmit();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" value="重新输入">
      </p>
      </form>
  </body>
</html>
