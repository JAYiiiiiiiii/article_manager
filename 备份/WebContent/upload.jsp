<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upload.jsp' starting page</title>
<script type="text/javascript" language="javascript">
    	function uploadSubmit(){
    		if(frm.category.value==""){
    			alert("文章类别不能为空，请重新输入！");
    			return false;
    		}
    		if(frm.title.value==""){
    			alert("文章标题不能为空，请重新输入！");
    			return false;
    		}
    		 if(frm.author.value==""){
	            alert("文章作者不能为空，请重新输入！");
	        return false;
	    }
    		if(frm.filepath.value=="") {
    		    alert("文章路径不能为空，请重新输入！");
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
       <form name="frm" action="upload.do" method="post">
            <p align="center">
                <font size="6"><b>上传文章</b></font>          
            </p>
            <hr  style="border: 1px dashed black; width: 80%; height: 1px;" /><br/>
            <table align="center" cellspacing="10">
                <tr>
                   <td>请选择文章类别：</td>
                   <td><select name="category">
                   <option value="文学作品">文学作品</option>
                   <option value="科普读物">科普读物</option>
                   <option value="历史纪实">历史纪实</option>
                   <option value="天文地理">天文地理</option>
                   <option value="原创精品">原创精品</option>
                   </select>
                   </td>
                </tr>
                <tr>
                   <td>请输入文章标题:</td>
                   <td><input type="text" name="title"></td>
                </tr>
                <tr>
                   <td>请输入文章作者:</td>
                   <td><input type="text" name="author"></td>
                </tr>
                <tr>
                   <td>请输入文章路径:</td>
                   <td><input type="file" name="filepath"></td>
                </tr>
                <tr>
                   <td align="center"><input type="submit" value="提交" onclick="return uploadSubmit();"></td>
                   <td align="center"><input type="reset" value="重置"></td>
                </tr>
            </table>
       </form>
  </body>
</html>
