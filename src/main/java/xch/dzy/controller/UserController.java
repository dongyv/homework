package xch.dzy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import xch.dzy.model.User;
import xch.dzy.model.UserAccount;
import xch.dzy.service.SystemService;
import xch.dzy.service.UserAccountService;
import xch.dzy.service.UserService;
import xch.dzy.util.GetCode;
import xch.dzy.util.JsonPublic;

/**
 * 用户控制器
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private UserAccountService accountAccountService;

	@RequestMapping(value = "/login", method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,Object> login(HttpServletRequest request,HttpSession session) {
		//String sa = "小明";
//		User user = userService.findByUsername(sa);
//		System.out.println("user:" + user);
		Map<String,Object> map = new HashMap<>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String msg ="登录成功";
		map.put("msg",msg);
		map.put("code",0);
		if(!userService.findUserAndPwd(username, password)) {
			msg  = "输入的账号密码有误!";
			map.put("msg",msg);
			map.put("code",1);
		}else {
			User user = userService.findEmailOrPhoneUnix1(username);
			session.setAttribute("user", user);
		}
		
		return map;
	}

	// 保存邮箱 昵称为空
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String register(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("charset=utf-8");
		String msg = "注册成功";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User();
		if (!userService.findEmailOrPhoneUnix(email)) {
			System.out.println("数据库没有值！");
			user.setEmail(email);
			user.setPassword(password);
			userService.insert(user);
			//开户
			UserAccount ua = new UserAccount();
			ua.setUid(user.getId());
			accountAccountService.insert(ua);
		} else {
			msg = "邮箱已经注册";
			System.out.println("不能存数据库!");
		}

		return msg;
	}

	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	@ResponseBody
	public JsonPublic register1(HttpServletRequest request,HttpSession session) {
		JsonPublic json = new JsonPublic();
		json.setCode(200);//成功
		json.setMessage("注册成功");
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String codetemp = (String)session.getAttribute("mobileCode");
		if(userService.findEmailOrPhoneUnix(phone)) {
			json.setCode(100);//成功
			json.setMessage("号码已经被注册!");
		}else {
			if(!code.equals(codetemp)&&codetemp==null) {
				json.setCode(101);//成功
				json.setMessage("验证码输入不正确！");
			}else {
				User user = new User();
				user.setPhone(phone);
				user.setPassword(password);
				userService.insert(user);
				//开户
				UserAccount ua = new UserAccount();
				ua.setUid(user.getId());
				accountAccountService.insert(ua);
			}
		}
		return json;
	}
	/**
	 * 注册短信
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="getCode",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getCode(HttpServletRequest request,HttpSession session) {
    	String msg = "发送短信成功!";
    	String phone = request.getParameter("phone");
    	if(phone==""||phone==null) {
    		msg = "手机号码不能为空！";
    	}else {
			Map<String, String> webHeader = new HashMap<String, String>();
			
			// 接口参数和要传的值 start
			//webHeader.put("apikey", sysService.findValueByNid("con_SMS_userid"));
			//webHeader.put("account", sysService.findValueByNid("con_SMS_account"));
			//webHeader.put("password", sysService.findValueByNid("con_SMS_password"));
			String content = systemService.findValueByNid("con_SMS_regTemplate");
			webHeader.put("mobile", phone);
			String mobileCode = GetCode.getFixLenthString(6);
			// System.out.println("mobileCode:" + mobileCode);
			webHeader.put("text", content.replaceAll("\\$\\{123456\\}", mobileCode));
			webHeader.put("sendTime", "");
			webHeader.put("action", "send");
			webHeader.put("url", "http://www.ztsms.cn/sendSms.do");
			webHeader.put("username", "daiqile");
			webHeader.put("password", "Dql12345");
			webHeader.put("content", content.replaceAll("\\$\\{123456\\}", mobileCode));
			webHeader.put("productid", "872872");
			webHeader.put("xh", "");
			//webHeader.put("sendTime", "");
			//webHeader.put("action", "send");
			// 接口参数和要传的值 end
			
			// 接口提交地址
			String smsUrl = systemService.findValueByNid("con_SMS_url");
			
			// 发送短信
			Map<String, String> resultMap = systemService.sendSMS(webHeader, smsUrl,request.getParameter("type"),0);
			if ("Success".equals(resultMap.get("status"))) {
				session.setAttribute("mobileCode", mobileCode);
				//session.setAttribute("userName", userName);
				//returnMap.put("mobileCode", mobileCode);
				msg = "短信发送成功";
			}else {
				msg = resultMap.get("msg");
			}
    	}
		return msg;
	}
	
	@RequestMapping(value="/update",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String update(HttpServletRequest request,HttpSession session) {
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String sex1 = "男";
		if(Integer.parseInt(sex)==0) {
			sex1 = "男";
		}else {
			sex1 = "女";
		}
		User user = (User)session.getAttribute("user");
		user.setName(name);
		user.setNickname(nickname);
		user.setEmail(email);
		user.setPhone(phone);
		user.setSex(sex1);
		userService.update(user);
		return "修改成功!";
	}
	//状态改成1
	@RequestMapping(value="/join")
	@ResponseBody
	public JsonPublic join(HttpServletRequest request,HttpSession session) {
		String userId = request.getParameter("userId");
		userService.update_shopper(Integer.parseInt(userId));
		JsonPublic json = new JsonPublic();
		json.setMessage("加盟成功");
		User user = (User)session.getAttribute("user");
		user.setShopper(1);
		request.setAttribute("user", user);
		return json;
	}
}
