package xch.dzy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import xch.dzy.model.Merchandise;
import xch.dzy.model.Shop;
import xch.dzy.model.ShopGoods;
import xch.dzy.model.User;
import xch.dzy.service.MerchandiseService;
import xch.dzy.service.ShopService;
import xch.dzy.util.JsonPublic;
import xch.dzy.util.YXDate;

@Controller
@RequestMapping(value="/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MerchandiseService merchandiseService;
	
	@RequestMapping(value="/single_shop")
	public String Single_Shop(HttpServletRequest request) {
		String sid = request.getParameter("sid");
		request.setAttribute("sid", sid);
		Shop sp = shopService.findBySid1(Integer.parseInt(sid));
		List<ShopGoods> shopgoods_list = shopService.findShopGoods(sp.getId());
		
		request.setAttribute("shopgoodslist", shopgoods_list);
		return "/person/editgoods";
	}
	
	@RequestMapping(value="/save_shop")
	@ResponseBody
	public JsonPublic Save_shop(HttpServletRequest request,@RequestParam("user_name")String user_name,HttpSession session) {
		User user = (User)session.getAttribute("user");
		Shop shop = new Shop();
		shop.setUid(user.getId());
		shop.setName(user_name);
		shop.setAddtime(YXDate.getTime());
		shopService.save(shop);//保存商品
		JsonPublic jsonPublic = new JsonPublic();
//		jsonPublic.setObject(sp);
		jsonPublic.setMessage("保存成功");
		jsonPublic.setCode(100);
		return jsonPublic;
	}
	
	@RequestMapping(value="/save_shopgoods")
	@ResponseBody
	public JsonPublic save_shopgoods(HttpServletRequest request,@RequestParam("sid")String sid,@RequestParam("price")String price,@RequestParam("user_name")String user_name) {
		Merchandise mr = new Merchandise();
		mr.setName(user_name);
		mr.setCid(1);
		merchandiseService.insert(mr);
		ShopGoods sg = new ShopGoods();
		sg.setMid(mr.getId());
		sg.setPrice(Float.parseFloat(price));
		sg.setSid(Integer.parseInt(sid));
		shopService.insertGoods(sg);
		JsonPublic jsonPublic = new JsonPublic();
		jsonPublic.setCode(100);
		jsonPublic.setMessage("保存成功");
		
		return jsonPublic;
	}
}
