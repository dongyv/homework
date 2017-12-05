package xch.dzy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import xch.dzy.model.User;
import xch.dzy.model.UserAddress;
import xch.dzy.service.UserAddressService;

@Controller
@RequestMapping(value="/user_address")
public class UserAddressController {
	@Autowired
	private UserAddressService useraddress;
	
	@RequestMapping(value="/save",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String save(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String phone= request.getParameter("user_phone");
		String intro= request.getParameter("user_intro");
		String name= request.getParameter("user_name");
		int index = 0;//默认不是
		UserAddress uaddress = new UserAddress();
		List<UserAddress> lsit_id = useraddress.findById(user.getId());
		if(lsit_id.size()==0) {
			index = 1; // 如果是第一个那么就是默认的地址
		}
		uaddress.setAddress(intro);
		uaddress.setConsignee(name);
		uaddress.setCphone(phone);
		uaddress.setIsmodel(index);
		uaddress.setUid(user.getId());
		useraddress.save(uaddress);
		return "保存成功";
	}
	
}
