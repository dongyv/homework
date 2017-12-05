<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="/inc/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="<%=contextPath %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script>
	function cwsj(){
		if(confirm("是否加盟为商家?")){
			var userId = '${user.id}';
			$.ajax({
				type : "POST",  //提交方式  
	            url : "${path}/user/join.dongyv",//路径  
	            dataType:"json",
	            data : {  
	                "userId" : userId,
	            },//数据，这里使用的是Json格式进行传输  
	            success : function(data) {//返回数据根据结果进行相应的处理 
	            	alert(data.message);
	            	window.location.href="${path}/home/toShopper.dongyv"
	            },erro :function(data){
	            	
	            	alert("未知错误");	
	            }
			});
		}
	}
</script>
</head>
<body>
	<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.jsp">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="${path}/home/toInformation.dongyv">个人信息</a></li>
							<li> <a href="${path}/home/toSafety.dongyv">安全设置</a></li>
							<li class="active"> <a href="${path}/home/toAddress.dongyv">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="${path}/person/order.jsp">订单管理</a></li>
							<li> <a href="${path}/person/change.jsp">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<c:choose>
								<c:when test="${user.shopper == 0 }">
									<li><a href="javascript:cwsj();">成为商家</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${path}/home/toShopper.dongyv">我的店铺</a></li>
								</c:otherwise> 
							</c:choose>
							<li> <a href="${path}/person/coupon.jsp">优惠券 </a></li>
							<li> <a href="${path}/person/bonus.jsp">红包</a></li>
							<li> <a href="${path}/person/bill.jsp">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="${path}/person/collection.jsp">收藏</a></li>
							<li> <a href="${path}/person/foot.jsp">足迹</a></li>
							<li> <a href="${path}/person/comment.jsp">评价</a></li>
							<li> <a href="${path}/person/news.jsp">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
</body>
</html>