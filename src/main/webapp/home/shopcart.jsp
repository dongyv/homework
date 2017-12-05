<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车页面</title>
<link href="<%=contextPath%>/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=contextPath%>/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=contextPath%>/css/optstyle.css" rel="stylesheet"
	type="text/css" />
<script src="<%=contextPath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.js"></script>
<script>
	
	//选项框选择
	function check(nb){
		var index = nb.parentNode.parentNode.childNodes[3].value;	
		var sp = document.getElementById("sp");
		var jq = document.getElementById("jq");
		var shop_jq = nb.parentNode.parentNode.parentNode.childNodes[7].childNodes[1].childNodes[1].childNodes[3].childNodes[1];//单价
		var gs = nb.parentNode.parentNode.parentNode.childNodes[9].childNodes[1].childNodes[1].childNodes[1].childNodes[3].value;//个数
		var shows = document.getElementById("shows");
		var checked_all = document.getElementById("checked_all");
		if(nb.checked){
			sp.innerHTML = Number(trimStr(sp.innerHTML))+Number(1);
			jq.innerHTML = Number(trimStr(jq.innerHTML))+Number(trimStr(shop_jq.innerHTML))*Number(gs);
			var checklist =document.getElementsByName("checklist");
			var index = 0;
			for(var i=0;i<checklist.length;i++){
				if(checklist[i].checked==false){
					index = 1;
				}
			}
			if(index==0){
				checked_all.checked = true;
			}else{
				checked_all.checked = false;
			}
		}else{
			//件数 金额--
			sp.innerHTML = Number(trimStr(sp.innerHTML))-Number(1);
			jq.innerHTML = Number(trimStr(jq.innerHTML))-Number(trimStr(shop_jq.innerHTML))*Number(gs);
			checked_all.checked = false;
		}
	}
	
	function add(add){
		var danjia = add.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[7].childNodes[1].childNodes[1].childNodes[3].childNodes[1].innerHTML;
		var checked = add.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[1].childNodes[1].checked;
		if(checked){
			var jq = document.getElementById("jq");
			jq.innerHTML = Number(trimStr(jq.innerHTML))+Number(trimStr(danjia));
		}
	}
	
	function see(see){
		var danjia = see.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[7].childNodes[1].childNodes[1].childNodes[3].childNodes[1].innerHTML;
		var checked = see.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[1].childNodes[1].checked;
		if(checked){
			var jq = document.getElementById("jq");
			jq.innerHTML = Number(trimStr(jq.innerHTML))-Number(trimStr(danjia));
		}
	}
	
	function all_box(ab){
		var shows = document.getElementById("shows");
		var item_ul = shows.getElementsByTagName("ul");
		var jq = document.getElementById("jq");
		var sp = document.getElementById("sp");
		if(ab.checked){
			for(var i=0;i<item_ul.length;i++){
				var list_li = item_ul[i].getElementsByTagName("li");
	 			var check = list_li[0].childNodes[1].childNodes[1].checked;
	 			if(!check){
	 				list_li[0].childNodes[1].childNodes[1].checked = true;
	 				var danjia = list_li[0].parentNode.childNodes[7].childNodes[1].childNodes[1].childNodes[3].childNodes[1].innerHTML;
 	 				var geshu = list_li[0].parentNode.childNodes[9].childNodes[1].childNodes[1].childNodes[1].childNodes[3].value;
 	 				sp.innerHTML = Number(trimStr(sp.innerHTML))+Number(1);
 	 				jq.innerHTML = Number(trimStr(jq.innerHTML))+Number(trimStr(danjia))*Number(geshu);
	 			}
			}
		}else{
			for(var i=0;i<item_ul.length;i++){
				var list_li = item_ul[i].getElementsByTagName("li");
	 			var check = list_li[0].childNodes[1].childNodes[1].checked;
	 			if(check){
	 				list_li[0].childNodes[1].childNodes[1].checked = false;
	 				var danjia = list_li[0].parentNode.childNodes[7].childNodes[1].childNodes[1].childNodes[3].childNodes[1].innerHTML;
 	 				var geshu = list_li[0].parentNode.childNodes[9].childNodes[1].childNodes[1].childNodes[1].childNodes[3].value;
 	 				sp.innerHTML = Number(trimStr(sp.innerHTML))-Number(1);
 	 				jq.innerHTML = Number(trimStr(jq.innerHTML))-Number(trimStr(danjia))*Number(geshu);
	 			}
			}
		}
	}
	
	function qd(){
		var sl = document.getElementById("cz_sl").value;
		alert(sl)
	}
	
	//去掉空格
	function trimStr(str){
		return str.replace(/(^\s*)|(\s*$)/g,"");
	}
	
	function del(dle){
		var index = dle.parentNode.parentNode.parentNode.childNodes[1].childNodes[3].value;
		alert(index);
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user_shopcard/delete.dongyv",//路径  
            dataType:"text",
            data : {"index" : index,} ,
            success : function(data) {
           		alert(data); 
           		window.location.href="${path }/home/toShopCart1.dongyv";
            }
        });
	}
	
	function remove(move){
		var index = move.parentNode.parentNode.parentNode.childNodes[1].childNodes[3].value;
		alert(index);
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user_shopcard/remove.dongyv",//路径  
            dataType:"text",
            data : {"index" : index,} ,
            success : function(data) {
           		alert(data); 
           		window.location.href="${path }/home/toShopCart1.dongyv";
            }
        });
	}
	
	function del_all(){
		var shows = document.getElementById("shows");
		var item_ul = shows.getElementsByTagName("ul");
		var array = new Array();
		for(var i=0;i<item_ul.length;i++){
			var list_li = item_ul[i].getElementsByTagName("li");
 			var check = list_li[0].childNodes[1].childNodes[1].checked;
 			var index = list_li[0].childNodes[3].value;
 			if(check){
 				array[array.length] = index;
 			}
		}
		var temp="";
		for(var j=0;j<array.length;j++){
			temp = temp+array[j]+","
		}
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user_shopcard/delete_all.dongyv",//路径  
            dataType:"text",
            data : {"index" : temp,} ,
            success : function(data) {
           		alert(data); 
           		window.location.href="${path }/home/toShopCart1.dongyv";
            }
        });
	}
	
	function remove_all(){
		var shows = document.getElementById("shows");
		var item_ul = shows.getElementsByTagName("ul");
		var array = new Array();
		for(var i=0;i<item_ul.length;i++){
			var list_li = item_ul[i].getElementsByTagName("li");
 			var check = list_li[0].childNodes[1].childNodes[1].checked;
 			var index = list_li[0].childNodes[3].value;
 			if(check){
 				array[array.length] = index;
 			}
		}
		var temp="";
		for(var j=0;j<array.length;j++){
			temp = temp+array[j]+","
		}
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user_shopcard/remove_all.dongyv",//路径  
            dataType:"text",
            data : {"index" : temp,} ,
            success : function(data) {
           		alert(data); 
           		window.location.href="${path }/home/toShopCart1.dongyv";
            }
        });
	}
	
	function pay(){
		var shows = document.getElementById("shows");
		var item_ul = shows.getElementsByTagName("ul");
		var array = new Array();
		var array1 = new Array();
		for(var i=0;i<item_ul.length;i++){
			var list_li = item_ul[i].getElementsByTagName("li");
 			var check = list_li[0].childNodes[1].childNodes[1].checked;
 			var index = list_li[0].childNodes[3].value;
 			var num = list_li[4].childNodes[1].childNodes[1].childNodes[1].childNodes[3].value;
 			if(check){
 				array[array.length] = index;
 				array1[array1.length] = num;
 			}
		}
		var temp="";
		var temp1="";
		for(var j=0;j<array.length;j++){
			temp = temp+array[j]+",";
			temp1 = temp1+array1[j]+",";
		}
		if(temp==""){
			alert("请先勾选商品");
		}else{
			$.ajax({
				type : "POST",  //提交方式  
	            url : "${path }/user_shopcard/pay.dongyv",//路径  
	            dataType:"text",
	            data : {
	            	"index" : temp,
	            	"num" : temp1,
	            } ,
	            success : function(data) {
	            	var money = $("#jq").html();
	           		window.location.href="${path }/home/toPay.dongyv?temp1="+temp1+"&money="+money+"&orderid="+data;
	            }
	        });
		}
	}
	
</script>
</head>
<body>
	<!--顶部导航条 -->
	<jsp:include page="../topmenu.jsp" />
	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="<%=contextPath%>/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="<%=contextPath%>/images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>

	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
<!-- 					<div class="th th-sum"> -->
<!-- 						<div class="td-inner">金额</div> -->
<!-- 					</div> -->
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

<%-- 			<c:forEach var="shop" items="${shops }"> --%>
				<tr class="item-list">

					<div class="bundle  bundle-last ">
						<!-- 商铺 -->
						<div class="bundle-hd">
							<div class="bd-promos">
								<div class="bd-has-promo">
									已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;
								</div>
								<div class="act-promo">
									<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span></a>
								</div>
								<span class="list-change theme-login">编辑</span>
							</div>
						</div>
						<!-- 商品 -->
						<div class="clear"></div>
						<div class="bundle-main" id = "shows">
							<c:forEach var="merchandise" items="${merchandise_list}">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="check" name="checklist" value="170037950254" type="checkbox" onclick="check(this)"> 
											<label for="J_CheckBox_170037950254"></label>
										</div>
										<input type="hidden" value="${merchandise.index }"/>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<input type="text" value="${merchandise.name }"> 
											<a href="#" target="_blank"
												data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆"
												class="J_MakePoint" data-point="tbcart.8.12"> <img
												src="<%=contextPath%>/images/kouhong.jpg_80x80.jpg"
												class="itempic J_ItemImg"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
													class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏
													持久保湿滋润防水不掉色</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line">颜色：12#川南玛瑙</span> <span
												class="sku-line">包装：裸装</span> <span tabindex="0"
												class="btn-edit-sku theme-login">	</span> <i
												class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">999.00</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${merchandise.price }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-" onclick="see(this)"/>
													<input class="text_box" name="" type="text" value="1" style="width: 30px;" /> 
													<input class="add am-btn" name="" type="button" value="+" onclick="add(this)"/>
												</div>
											</div>
										</div>
									</li>
<!-- 									<li class="td td-sum"> -->
<!-- 										<div class="td-inner"> -->
<!-- 											<em tabindex="0" class="J_ItemSum number">117.00</em> -->
<!-- 										</div> -->
<!-- 									</li> -->
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" onclick="javascript:remove(this)" class="btn-fav" href="#"> 移入收藏夹</a>
											<a onclick="javascript:del(this)" href="#"  data-point-url="#" class="delete">删除</a>
										</div>
									</li>
								</ul>
							
							</c:forEach>
						</div>
					</div>
				</tr>
<%-- 			</c:forEach> --%>
			<div class="clear"></div>


		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox" id="checkedbox_all">
					<input class="check-all check" id="checked_all" name="select-all" value="true" type="checkbox" onclick="all_box(this)"> 
					<label for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" onclick="javascript:del_all();" hidefocus="true" class="deleteAll">删除</a>
				<a href="#" onclick="javascript:remove_all();" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="sp">0</em><span class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> 
					<strong class="price">¥<em id="jq">0.00</em></strong>
				</div>
				<div class="btn-area">
<%-- 				${path }/user_shopcard/pay.dongyv --%>
					<a href="#" onclick="javascript:pay();" id="J_Go" class="submit-btn submit-btn-disabled"
						aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
				</div>
			</div>

		</div>

		<div class="footer">
			<div class="footer-hd">
				<p>
					<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
						href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
				</p>
			</div>
			<div class="footer-bd">
				<p>
					<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
						href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
						href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
						- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
						target="_blank">网页模板</a></em>
				</p>
			</div>
		</div>

	</div>

	<!--操作页面-->

	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-span"></div>
		<div class="theme-poptit h-title">
			<a href="javascript:;" title="关闭" class="close">×</a>
		</div>
		<div class="theme-popbod dform">
			<form class="theme-signin" name="loginform" action="" method="post">

				<div class="theme-signin-left">

					<li class="theme-options">
						<div class="cart-title">颜色：</div>
						<ul>
							<li class="sku-line selected">12#川南玛瑙<i></i></li>
							<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
						</ul>
					</li>
					<li class="theme-options">
						<div class="cart-title">包装：</div>
						<ul>
							<li class="sku-line selected">包装：裸装<i></i></li>
							<li class="sku-line">两支手袋装（送彩带）<i></i></li>
						</ul>
					</li>
					<div class="theme-options">
						<div class="cart-title number">数量</div>
						<dd>
							<input class="min am-btn am-btn-default" name="" type="button"value="-" />
							<input class="text_box" id="cz_sl" name="cz_sl" type="text" value="1" style="width: 30px;" />
							<input class="add am-btn am-btn-default" name="" type="button" value="+" />
							<span class="tb-hidden">库存<span class="stock">1000</span>件</span>
						</dd>

					</div>
					<div class="clear"></div>
					<div class="btn-op">
						<div class="btn close am-btn am-btn-warning" onclick="qd()">确认</div>
						<div class="btn close am-btn am-btn-warning">取消</div>
					</div>

				</div>

			</form>
		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="home.jsp"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.jsp"><i class="am-icon-list"></i>分类</a></li>
		<li class="active"><a href="shopcart.jsp"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="<%=contextPath%>/person/index.jsp"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
</body>
</html>