<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript" src="<%=contextPath%>/js/ajax.js"></script>
	<script language="javascript" type="text/javascript" src="<%=contextPath %>/login/js/register.js" charset="utf-8"></script>
	<script>
	function xz(){
		//为空的 在这里还是要判断的.就是为空的 直接把class改啦就行
		if(document.getElementById("user").value==""){
			alert("为空啦，之后就要把这个空的改成 后面的图片为叉叉的那副");
			return;
		}
		request = createRequest();
		var url = "ajax_json/ajax_json!ajaxPd.action";//这个是后台的url
		var str = "userName="+escape(document.getElementById("user").value);//传到后台的数据
		if(str ==""){
			str = null;
		}
		getDetail("post",url,rfunc,str);
		
	}
	
	function rfunc(){
		if(request.readyState==4){
			if(request.status==200){
			alert(request.responseText);
// 				alert(typeof(request.responseText));//String?类型,感觉是个伪json
				var date = eval(request.responseText);
				if(date=="true"){
					alert("数据库没有数据。可以插入");
					
				}else{
					alert("数据库有值不可以插入，最后要借助css来");
					document.getElementById("user").focus();			
				}
			}
		}
	}
	</script>
  </head>
  
  <body>
  <h1>用户注册</h1>
	  <form action="login!register.action" method="post" id="form1">
	  	<!-- 会加上ajax的离开区域访问，是否存在  -->
	  	<span>账号:</span><input type="text" placeholder="请输入账号..." name="user" id="user" onblur="xz()"><br>
	  	<span>密码:</span><input type="password" name="pwd" id="pwd1"><br>
	  	<span>重复密码:</span><input type="password" id="pwd2"><br>
	  	<span>邮箱:</span><input type="text" /><br><!-- 第二步，就是发送验证码,以后再补上吧 -->
	  	<input type="button" value="提交" onclick="dj()"/><input type="button" value="返回" onclick="window.history.back();">
  	</form>
  </body>
</html>
