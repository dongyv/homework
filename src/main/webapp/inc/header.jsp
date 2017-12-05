<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var="path" value="${ pageContext.request.contextPath}"></c:set><!-- 绝对路径 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	 
	String contextPath = request.getContextPath();
	if(contextPath.equals("")){
		contextPath = "loacalhost:8080/baby_word";
	}
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
 %>
 
<script>
/** 头文件的具体的地址 **/
/** 变量定义 **/
var contextPath = <%= contextPath %>;
</script>