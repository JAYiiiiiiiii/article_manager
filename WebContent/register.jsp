<!DOCTYPE HTML">
<html>
  <head>
    <title>register.html</title>
	<script type="text/javascript" language="javascript">
    	function loginSubmit(){
    		if(frm.username.value==""){
    			alert("a!");
    			return false;
    		}
    		if(frm.password.value==""){
    			alert("b!");
    			return false;
    		}
    		 if(frm.password.value != frm.repassword.value){
	            alert("c!");
	        return false;
	    }
    		if(frm.email.value != "" && (frm.email.value.indexOf("@")==-1 || frm.email.value.indexOf("@")==0)) {
    		    alert("d!");
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
  
  <body bgcolor="#68EE68">
   <br/>
    <form name="frm" action="register.do" method="post">
    <p align="center"><font size="6"><b>register</b></font></p><br/>
    <hr  style="border: 1px dashed black; width: 80%; height: 1px;" /><br/>
    <table align="center" > 	
  	<tr>
  	  		<td align="center">  	  		
  			* username :
  			</td>
  	  		<td> 
           <INPUT type="text"  name=username> 
           <SPAN style="FONT-SIZE: 15px; COLOR: #ee0000">&nbsp;</SPAN>
            <SPAN>&nbsp;&nbsp;</SPAN>          
  			</td>
  			</tr>
  <tr>
  			<td align="center"> 			
  			* password :
  			</td>
  			<td>
           <INPUT type="password"  name=password> 
           <SPAN style="FONT-SIZE: 13px; COLOR: #ee0000">&nbsp;&nbsp;</SPAN>
            </td>
            </tr>
  			<tr>
  			   <td align="center">
  			  confirm :
  			  	</td>
  			<td>
  			  <input type="password"  name="repassword">
  		  </td>
  			</tr>

  		<tr>
  			<td align="center">
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email :
  					</td>
  			<td>
  				<input type="text" name="email">
  			</td>	
  			</tr>
  	
  			  <tr>
  			  <td align="center">
  				sex :
  					</td>
  			<td>
  					<input type="radio" name="sex" value="male">male
  					<input type="radio" name="sex" value="female">female
  				 </td>
  			</tr>
  		
  			  <tr>
  			 <td align="center">
  				birthday :
  					</td>
  			<td>
  				<input type="text" name="birthday">
  				</td>
  			</tr>
  			<tr >
  			<td>
  				<input type="submit" value="commit" onclick="return loginSubmit();" />
  				</td>
  				<td>
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"  value="reset"/>
  				</td>			
  			</tr>
  		</table>
  	</form>
  </body>
</html>
