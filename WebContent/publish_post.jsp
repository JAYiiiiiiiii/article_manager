<%@page import="wz.model.Post"%>
<%@page import="org.apache.struts2.components.Else"%>
<%@page import="wz.model.SubForum"%>
<%@page import="wz.model.SubSubForum"%>
<%@page import="wz.model.MainForum"%>
<%@page import="wz.service.MainForumBiz"%>
<%@page import="wz.service.SubForumBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建文章</title>
    <script type="text/javascript" src="component/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="js/publish-post.js"></script>

    <script type="text/javascript">
        function onselected1(obj){
    
            var mainForum = document.getElementById("mainforum");
            var index = mainForum.selectedIndex;
            var mainSelect = mainForum.options[index].value;
            for (var i =0; i<mainForum.length; i++){
            console.log("main:"+mainForum[i].value);
            var value = mainForum[i].value;
            var subForum = document.getElementById("subForum"+value);
                for (var j =0; j<subForum.length; j++){
                    
                    var subValue = subForum[j].value;
                    console.log("subValue:"+subValue);
                    var subSubForum = document.getElementById("subSubForum"+subValue);
                    subSubForum.style.display = "none";
                    subSubForum.name="subSub"
                    //console.log("subSubForum:"+subSub.value);
                }
            }

            var subForumSelect = document.getElementById("subForum"+mainSelect);
            var subIndex = subForumSelect.selectedIndex;
            var subSelect = subForumSelect.options[subIndex].value;

            var subSubForumSelect = document.getElementById("subSubForum"+subSelect);
            subSubForumSelect.style.display = "";
            subSubForumSelect.name = "subSubForum"
    

            //console.log("size:"+subForum.length);
        }
    </script>

    <style type="text/css">
        .tb {
            margin: 0 auto;
        }



            .tb tr th, .tb tr td {
                BORDER-left: #c2daf2 1px solid;
                BORDER-top: #c2daf2 1px solid;
                font-weight: normal;
                color: #000;
                background-repeat: repeat-x;
                FONT-SIZE: 9pt;
                FONT-FAMILY: Arial, "宋体";
                padding: 10px;
            }

            .tb tr th {
                width: 180px;
                background-color: #eff5fb;
            }

            .tb tr td {
                width: 800px;
                background-color: #f5f5f5;
            }

            .tb tr input {
                width: 500px;
            }

            .tb tr span {
                color: red;
            }

        .tab {
            width: 80px;
            border: 1px solid #ddddde;
            height: 27px;
            background: -webkit-linear-gradient(#e3e3e3, #fff); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(#e3e3e3, #fff); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(#e3e3e3, #fff); /* Firefox 3.6 - 15 */
            background: linear-gradient(#e3e3e3, #fff); /* 标准的语法 */
            text-align: center;
            line-height: 27px;
           
        }
           .tab:hover,.omg {
               background:#f5f5f5;
               border-bottom:1px solid #fff;
            }
        #small_btn_select {
            width: 120px;
          
        }
        #big_btn_select {
            width: 270px;
        }
        .btn-select {
            position: relative;
            display: inline-block;
           
            height: 35px;
          
            font: 14px/20px "Microsoft YaHei";
            color: #fff;
        }

            .btn-select .cur-select {
                position: absolute;
                display: block;
                width: 100%;
                height: 30px;
                
               text-align:center;
               
            }

           

            .btn-select select {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 30px;
                opacity: 0;
                filter: alpha(opacity: 0;);
                font: 14px/20px "Microsoft YaHei";
                color: #000;
            }

                .btn-select select option {
                    text-indent: 10px;
                }

                    .btn-select select option:hover {
                        background-color: #f80;
                        color: #fff;
                    }
    </style>

</head>
<body>

 <jsp:include page="/pages/header.jsp"/>
 <table class="tb" cellspacing="0" cellpadding="3">
  <%Post post = 	(Post)request.getAttribute("post"); %>
  <%if (post== null) {%>
  <form method="post" action="<%=path%>/publish.action">
  <%}else{ %>
   <form method="post" action="<%=path%>/updatepost.action?postId=<%=post.getId()%>">
  <%} %>
              <tr>
            <th>文章标题</th>
            <td>
           
            <%   if (post!=null){ %>
                <input required type="text" id="textfile" name="title" value="<%=post.getTitle()%>" />
                <%}else{ %>
                 <input required type="text" id="textfile" name="title" />
                <%} %>
                <s:fielderror fieldName="limit"></s:fielderror>
                <span>标题最多为25个字符</span>
            </td>
        </tr>
        <tr>
            <th>文章内容</th>
            <td>
               <%   if (post!=null){ %>
                <textarea type="text" class="" name="content" id="ckeditor" ><%=post.getCardContent()%></textarea>
                 <%}else{ %>
                  <textarea type="text" class="" name="content" id="ckeditor"></textarea>
                   <%} %>
                <span style="float: right;">最多输入7500个字符</span>
            </td>
        </tr>
        <tr>
            <th>选择文章分类</th>
            <td>
                <div id="change" style="float:left">
                    <!-- <a class="btn-select" id="big_btn_select"> -->
                        <select id="mainforum" name="mainForum" onchange="onselected(this)">
                       
                         
                        <%
                         ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                  	   MainForumBiz mainForumBiz = (MainForumBiz)context.getBean("mainForumBiz");
                  	   List<MainForum> mainForums = mainForumBiz.getAllMainForums();
                  	   for (MainForum mainForum:mainForums){
                      %>
                            <option value=<%=mainForum.getId()%>><%=mainForum.getTitle() %></option>
                           <%} %>
                        </select>
                   
                   
                     
                        <% int i=0;
                         for (MainForum mainForum:mainForums){
                            if ( i==0){
                            %>
                            <select name="subForum" id="subForum<%=mainForum.getId()%>" style="" onmouseover="onselected1(this)">
                            <%}else{ %>
                            <select name="sub" id="subForum<%=mainForum.getId()%>" style="display: none;" onmouseover="onselected1(this)">
                            <%} %>
                            
                                <%
                                Set<SubForum> subforms = mainForum.getSubForums();
                                for (SubForum subForum:subforms){
                                %>
                                <option value="<%=subForum.getId()%>"><%=subForum.getTitle()%></option>
                                <%}%>
                            </select>
                            <% i++;}%>
                          
                       
                          <% int j = 0;
                          
                              SubForumBiz subForumBiz = (SubForumBiz)context.getBean("subForumBiz");
                  	          List<SubForum> subForums = subForumBiz.getAllSubForums();
                              for (SubForum subForum:subForums){
                                  
                                      if ( j==0){
                            %>
                            <select name="subSubForum" id="subSubForum<%=subForum.getId()%>" style="">
                            <%}else{ %>
                            <select name="subSub" id="subSubForum<%=subForum.getId()%>" style="display: none;">
                            <%} %>
                            
                            <% //以下为option
                            Set<SubSubForum> subSubForums = subForum.getSubSubForums();
                                      for(SubSubForum subSubForum : subSubForums){
                                          %>
                                <option value="<%=subSubForum.getId()%>"><%=subSubForum.getTitle()%></option>
                                <%
                                      }%>
                            </select>
                            <%
                                      j++;
                                    
                                }
                            
                              %>
                                     
                          

                    <!--    
                    
                    -->
                     
               
               <span style="float:right;line-height:35px;">请选择文章所属类别</span>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
               	<input type="submit" value="提交"/>
            </td>
        </tr>
        </form>
    </table>
    </table>
     
        <script type="text/javascript">
        CKEDITOR.replace('ckeditor', { allowedContent: true });
     
    </script>
     


</body>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript">
	  	$(function(){
	  	 	$("#signupForm").validate();
	  	});
  </script>
</html>