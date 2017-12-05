<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>结算页面</title>

		<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="<%=contextPath %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=contextPath %>/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="<%=contextPath %>/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=contextPath %>/js/address.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/js/jquery.js"></script>
		<script src="<%=contextPath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script>
			function qx(){
				var show = document.getElementById("show");
				var ul = show.getElementsByTagName("ul");
				var index = "";
				for(var i=0;i<ul.length;i++){
					var li = ul[i].getElementsByTagName("li");
					var tm = li[3].childNodes[1].childNodes[1].childNodes[1].value;
					index = index+tm+",";
				}
				$.ajax({
					type : "POST",  //提交方式  
		            url : "${path}/user_shopcard/cancel.dongyv",//路径  
		            dataType:"text",
		            data : {"index" : index,} ,
		            success : function(data) {
		           		alert(data); 
		           		window.location.href="${path }/home/toShopCart1.dongyv";
		            }
		        });				
			}
			
			function tj(){
				var show = document.getElementById("show");
				var ul = show.getElementsByTagName("ul");
				var money = document.getElementById("J_ActualFee").innerHTML;
				var address_demo = $("#address_demo").html();
				var name_demo = $("#name_demo").html();
				var phone_demo = $("#phone_demo").html();
				var num = "";
				var index = "";
				for(var i=0;i<ul.length;i++){
					var li = ul[i].getElementsByTagName("li");
					var tm = li[3].childNodes[1].childNodes[1].childNodes[1].value;
					var tm1 = li[3].childNodes[1].childNodes[1].childNodes[5].innerHTML;
					index = index+tm+",";
					num = num+tm1+",";
				}
				$.ajax({
					type : "POST",  //提交方式  
		            url : "${path}/user_shopcard/submitOrder.dongyv",//路径  
		            dataType:"json",
		            data : {
		            	"num" : num,
		            	"index" : index,
		            	"money" : money,
		            	} ,
		            success : function(data) {
		            	alert(data)
		           		if(data.code==100){
		           			alert(data.message);
		           		}if(data.code==200){
		           			alert(data.message);
		           			window.location.href="${path}/home/toSuccess.dongyv?money="+money+"&address_demo="+address_demo+"&name_demo="+name_demo+"&phone_demo="+phone_demo;
		           		}
		           		
		            }
		        });				
			}
			
			//去掉空格
			function trimStr(str){
				return str.replace(/(^\s*)|(\s*$)/g,"");
			}
			
		</script>
</head>
<body>
		<!--顶部导航条 -->
			<jsp:include page="../topmenu.jsp" />
			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="<%=contextPath %>/images/logo.png" /></div>
				<div class="logoBig">
					<li><img src="<%=contextPath %>/images/logobig.png" /></li>
				</div>

				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					<form>
						<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
<!-- 						<div class="control"> -->
<!-- 							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div> -->
<!-- 						</div> -->
						<div class="clear"></div>
						<ul>
							<c:forEach var="userAddress" items="${userAddresslist }"> 
							<div class="per-border"></div>
							<li class="user-addresslist defaultAddr">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   
                  				 		<span class="buy-user" id="name">${userAddress.consignee } </span>
										<span class="buy-phone" id="phone">${userAddress.cphone }</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
										<span class="street" id="address">${userAddress.address }</span>
										</span>

										</span>
									</div>
									<c:choose>
										<c:when test="${userAddress.ismodel==1 }">
											<ins class="deftip">默认地址</ins>
										</c:when>
										<c:otherwise>
											<ins class="deftip hidden">默认地址</ins>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="address-right">
									<a href="<%=contextPath %>/person/address.jsp">
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${userAddress.ismodel==1 }"> --%>
<!-- 											<a href="#" class="hidden">设为默认</a> -->
<!-- 											<span class="new-addr-bar hidden">|</span> -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<a href="#">设为默认</a> -->
<!-- 											<span class="new-addr-bar">|</span> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
									<a href="#">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);">删除</a>
								</div>

							</li>
							</c:forEach>
						</ul>

						<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="<%=contextPath %>/images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="<%=contextPath %>/images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="<%=contextPath %>/images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
<!-- 									<div class="th th-sum"> -->
<!-- 										<div class="td-inner">金额</div> -->
<!-- 									</div> -->
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
							<div id="show">
							<c:forEach var="userOrder" items="${userOrderlist }">
								<tr class="item-list">
									<div class="bundle  bundle-last">
	
										<div class="bundle-main">
											<ul class="item-content clearfix" id="item_ul">
												<div class="pay-phone">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint">
																<img src="<%=contextPath %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
															</div>
														</div>
													</li>
													<li class="td td-info">
														<div class="item-props">
															<span class="sku-line">颜色：12#川南玛瑙</span>
															<span class="sku-line">包装：裸装</span>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price price-promo-promo">
															<div class="price-content">
																<em class="J_Price price-now">${userOrder.price }</em>
															</div>
														</div>
													</li>
												</div>
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<input type="hidden" value="${userOrder.id }">
															<span class="phone-title">购买数量</span>
															<div class="sl">${userOrder.num }</div>
														</div>
													</div>
												</li>
<!-- 												<li class="td td-sum"> -->
<!-- 													<div class="td-inner"> -->
<!-- 														<em tabindex="0" class="J_ItemSum number">117.00</em> -->
<!-- 													</div> -->
<!-- 												</li> -->
												<li class="td td-oplist">
													<div class="td-inner">
														<span class="phone-title">配送方式</span>
														<div class="pay-logis">
															包邮
														</div>
<!-- 														<div class="pay-logis"> -->
<!-- 															快递<b class="sys_item_freprice">10</b>元 -->
<!-- 														</div> -->
													</div>
												</li>
	
											</ul>
											<div class="clear"></div>
	
										</div>
										</div>
								</tr>
								<div class="clear"></div>
								
							</c:forEach>
							</div>
						</div>
						<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>
<!-- 							优惠券 -->
<!-- 							<div class="buy-agio"> -->
<!-- 								<li class="td td-coupon"> -->

<!-- 									<span class="coupon-title">优惠券</span> -->
<!-- 									<select data-am-selected> -->
<!-- 										<option value="a"> -->
<!-- 											<div class="c-price"> -->
<!-- 												<strong>￥8</strong> -->
<!-- 											</div> -->
<!-- 											<div class="c-limit"> -->
<!-- 												【消费满95元可用】 -->
<!-- 											</div> -->
<!-- 										</option> -->
<!-- 										<option value="b" selected> -->
<!-- 											<div class="c-price"> -->
<!-- 												<strong>￥3</strong> -->
<!-- 											</div> -->
<!-- 											<div class="c-limit"> -->
<!-- 												【无使用门槛】 -->
<!-- 											</div> -->
<!-- 										</option> -->
<!-- 									</select> -->
<!-- 								</li> -->

<!-- 								<li class="td td-bonus"> -->

<!-- 									<span class="bonus-title">红包</span> -->
<!-- 									<select data-am-selected> -->
<!-- 										<option value="a"> -->
<!-- 											<div class="item-info"> -->
<!-- 												¥50.00<span>元</span> -->
<!-- 											</div> -->
<!-- 											<div class="item-remainderprice"> -->
<!-- 												<span>还剩</span>10.40<span>元</span> -->
<!-- 											</div> -->
<!-- 										</option> -->
<!-- 										<option value="b" selected> -->
<!-- 											<div class="item-info"> -->
<!-- 												¥50.00<span>元</span> -->
<!-- 											</div> -->
<!-- 											<div class="item-remainderprice"> -->
<!-- 												<span>还剩</span>50.00<span>元</span> -->
<!-- 											</div> -->
<!-- 										</option> -->
<!-- 									</select> -->

<!-- 								</li> -->

							</div>
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum">${money }</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${money }</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
<!-- 								   				<span class="province">湖北</span>省 -->
<!-- 												<span class="city">武汉</span>市 -->
<!-- 												<span class="dist">洪山</span>区 -->
												<span class="street" id="address_demo">${userAddress.address }</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                                <span class="buy-user" id="name_demo">${userAddress.consignee }</span>
												<span class="buy-phone" id="phone_demo">${userAddress.cphone }</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="javascript:qx();" class="btn-go" tabindex="0" title="点取消订单">取消</a>
											<a id="J_Go" href="javascript:tj()" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">浙江省</option>
									<option value="b">湖北省</option>
								</select>
								<select data-am-selected>
									<option value="a">温州市</option>
									<option value="b">武汉市</option>
								</select>
								<select data-am-selected>
									<option value="a">瑞安区</option>
									<option value="b">洪山区</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
</body>
</html>