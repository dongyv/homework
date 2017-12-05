package xch.dzy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xch.dzy.model.Merchandise;
import xch.dzy.model.Shop;
import xch.dzy.model.ShopGoods;
import xch.dzy.model.User;
import xch.dzy.model.UserAddress;
import xch.dzy.model.UserOrder;
import xch.dzy.service.MerchandiseService;
import xch.dzy.service.ShopCardService;
import xch.dzy.service.ShopService;
import xch.dzy.service.UserAddressService;
import xch.dzy.service.UserService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	@Autowired
	private UserService	userService;
	
	@Autowired
	private ShopCardService shopCardService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MerchandiseService merchandiseService;
	
	@Autowired
	private UserAddressService userAddressService;
	
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			request.setAttribute("user", user);
		}
		List<Shop> shop = shopService.findAll();
		for(int i=0;i<shop.size();i++) {
			List<Merchandise> mer_list = new ArrayList<>();
			List<Merchandise> mr = merchandiseService.selectByMid(shop.get(i).getId());
			mer_list.addAll(mr);
			shop.get(i).setMerchandise(mer_list);
		}
		request.setAttribute("shop_list", shop);
		return "home/home";
	}
	/**
	 * 前往个人中心
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/toPersonCenter")
	public String toPersonCenter(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		request.setAttribute("user", user);
		
		
		return "person/index";
	}
	
	/**
	 * //购物车 ！！ 有问题 显示店铺和商品
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="toShopCart")
	public String toShopCart(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<ShopGoods> list_shop = new ArrayList<>();//查出的店铺商品记录表
		List<UserOrder> userOrederlist = shopCardService.shopCart(user.getId(),0);
		if(userOrederlist.size()>0) {
			List<Shop> shop_list = new ArrayList<>();//店铺
			List<Merchandise> merchandise_list = new ArrayList<>();
			Map<String,Object> map = new HashMap<>();
			for(UserOrder uo:userOrederlist) {
				ShopGoods sp = shopService.findBySid(uo.getSdid());//每条记录的 店铺
				list_shop.add(sp);
			}
			int first = list_shop.get(0).getSid();//店铺id
			for(int i=0;i<list_shop.size();i++) {
				if(first != list_shop.get(i).getSid()) {//当前店铺上一个店铺不一致
					Shop sp = shopService.findBySid1(first);//!因为list数据会共享 clear之后 之前保存的数据都不存在了
					map.put("merchandiseService"+list_shop.get(i-1), merchandise_list);
					sp.setMerchandise((List<Merchandise>)map.get("merchandiseService"+list_shop.get(i-1)));
					shop_list.add(sp);
					merchandise_list.clear();
					first = list_shop.get(i).getSid();
					merchandise_list.add(merchandiseService.findById(list_shop.get(i).getMid()));
				}else {
					merchandise_list.add(merchandiseService.findById(list_shop.get(i).getMid()));
				}
				if(i==(list_shop.size()-1)) {//判断最后一个
					Shop sp = shopService.findBySid1(first);
					map.put("merchandiseService"+list_shop.get(i), merchandise_list);
					sp.setMerchandise((List<Merchandise>)map.get("merchandiseService"+list_shop.get(i)));
					sp.setMerchandise(merchandise_list);
					shop_list.add(sp);
				}
				
			}
			
			request.setAttribute("shops", shop_list);
		}
		return "home/shopcart";
	}
	//俩者不分开(所有店铺的商品都一样)
	@RequestMapping(value="toShopCart1")
	public String toShopCart1(HttpSession session,HttpServletRequest request) {
		User user = (User)session.getAttribute("user");
		List<UserOrder> userOrederlist = shopCardService.shopCart(user.getId(),0);
		List<Merchandise> list = new ArrayList<>();
		for(UserOrder uo:userOrederlist) {
			ShopGoods sp = shopService.findBySid(uo.getSdid());
			Merchandise me = merchandiseService.findById(sp.getMid());
			me.setPrice(sp.getPrice());
			me.setIndex(uo.getId());
			list.add(me);
		}
		request.setAttribute("merchandise_list", list);
		return "home/shopcart";
	}
	
	//个人订单
	@RequestMapping(value="/toOrder")
	public String toOrder(HttpServletRequest request) {
		String uid = request.getParameter("id");
		User user = userService.findUserById(Integer.parseInt(uid));
		request.setAttribute("user", user);
		return "person/index";
	}
	
	@RequestMapping(value="/toInformation")
	public String toInformation(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		if("男".equals(user.getSex())) {
			user.setDemo(0);
		}else {
			user.setDemo(1);
		}
		
		request.setAttribute("user", user);
		
		return "person/information";
	}
	
	@RequestMapping(value="/toSafety")
	public String toSafety(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String demo = user.getPhone();
		if(!"".equals(demo)) {
			String phone = demo.substring(0,3)+"****"+demo.substring(7,11);
			user.setPhone(phone);
		}
		request.setAttribute("user", user);
		return "/person/safety";
	}
	
	@RequestMapping(value="/toAddress")
	public String toAddress(HttpServletRequest request,HttpSession session) {
		User user =(User)session.getAttribute("user");
		String demo = user.getPhone();
		if(!"".equals(demo)) {
			String phone = demo.substring(0,3)+"****"+demo.substring(7,11);
			user.setPhone(phone);
		}
		List<UserAddress> list = userAddressService.findById(user.getId());
		request.setAttribute("user", user);
		request.setAttribute("useraddress_list", list);
		
		return "/person/address";
	}
	//商品订单 订单本系统中只能一次，如果生成订单后操作别的功能那么次订单失效
	@RequestMapping(value="/toPay")
	public String toPay(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String money = request.getParameter("money");
		request.setAttribute("money", money);
		List<UserOrder> userOrederlist = shopCardService.shopCartGoodPrie(user.getId());
		List<UserAddress> userAddresslist = userAddressService.findById(user.getId());
		UserAddress userAddress =userAddressService.findByIdDefault(user.getId());
		request.setAttribute("userAddress", userAddress);
		request.setAttribute("userAddresslist", userAddresslist);
		request.setAttribute("userOrderlist", userOrederlist);
		return "/home/pay";
	}
	//跳转到商家的页面
	@RequestMapping(value="/toShopper")
	public String toShopper(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Shop> shop_list = shopService.findByUid(user.getId());
		request.setAttribute("shoplist", shop_list);
		return "/person/join";
	}
	
	@RequestMapping(value="/toSuccess")
	public String toSuccess(HttpServletRequest request) {
		String phone_demo = request.getParameter("phone_demo");
		String address_demo = request.getParameter("address_demo");
		String name_demo = request.getParameter("name_demo");
		String money = request.getParameter("money");
		request.setAttribute("phone_demo", phone_demo);
		request.setAttribute("address_demo", address_demo);
		request.setAttribute("name_demo", name_demo);
		request.setAttribute("money", money);
		return "/home/success";
	}
}
