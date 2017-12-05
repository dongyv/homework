package xch.dzy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import xch.dzy.model.Shop;
import xch.dzy.model.ShopGoods;
import xch.dzy.model.User;
import xch.dzy.model.UserAccount;
import xch.dzy.model.UserOrder;
import xch.dzy.model.UserOrderLog;
import xch.dzy.service.ShopCardService;
import xch.dzy.service.ShopService;
import xch.dzy.service.UserAccountService;
import xch.dzy.util.JsonPublic;
import xch.dzy.util.YXDate;

@Controller
@RequestMapping(value="/user_shopcard")
public class ShopCardController {
	private List<String> list = new ArrayList<>();
	@Autowired
	private ShopCardService shopCardService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private UserAccountService userAccountService;
	
	@RequestMapping(value="/delete",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String delete(HttpServletRequest request) {
		String index = request.getParameter("index");
		shopCardService.delete(Integer.parseInt(index));
		return "ɾ���ɹ�";
	}
	
	@RequestMapping(value="/remove",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String remove(HttpServletRequest request) {
		String index = request.getParameter("index");
		shopCardService.remove(Integer.parseInt(index));
		return "�����ղؼгɹ�";
	}
	
	@RequestMapping(value="/delete_all",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String delete_all(HttpServletRequest request) {
		String index = request.getParameter("index");
		String[] split = index.trim().split(",");
		for(int i=0;i<split.length;i++) {
			shopCardService.delete(Integer.parseInt(split[i]));
		}
		return "ɾ���ɹ�";
	}
	
	@RequestMapping(value="/remove_all",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String remove_all(HttpServletRequest request) {
		String index = request.getParameter("index");
		String[] split = index.trim().split(",");
		for(int i=0;i<split.length;i++) {
			shopCardService.remove(Integer.parseInt(split[i]));
		}
		return "�����ղؼгɹ�";
	}
	
	@RequestMapping(value="/pay",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String pay(HttpServletRequest request) {
		String index = request.getParameter("index");
		String num = request.getParameter("num");
		String[] num_split = num.trim().split(",");
		String[] split = index.trim().split(",");
		String orderid = YXDate.getTime();
		System.out.println(orderid);
		for(int i=0;i<split.length;i++) {
			shopCardService.remove_order(Integer.parseInt(split[i]),Integer.parseInt(orderid),Integer.parseInt(num_split[i]));
			
		}
		UserOrderLog uol = new UserOrderLog();
		uol.setOrderid(Integer.parseInt(orderid));
		String time = YXDate.getYear()+"-"+YXDate.getMonth()+"-"+YXDate.getDay();
		uol.setAddtime(time);
		shopCardService.insert_orderLog(uol);
		
		return orderid;
	}
	
	/**
	 * ȡ������
	 * 
	 * �Ѷ���״̬�޸�Ϊ ���ﳵ״̬�� ��ӵ�������־��
	 * @param request
	 * @param session
	 * @return
	 * 
	 */
	@RequestMapping(value="/cancel",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String cancel(HttpServletRequest request,HttpSession session) {
		String index = request.getParameter("index");
		String[] split = index.trim().split(",");
		for(int i=0;i<split.length;i++) {
			shopCardService.update_UserOrder_type(Integer.parseInt(split[i]), 0);
		}
		UserOrder uo = shopCardService.selectById(Integer.parseInt(split[0]));
		shopCardService.update_orderLog_type(-1, uo.getOrderid());
		return "ȡ���ɹ�";
	}
	
	/**
	 * 
	 * �ύ����
	 * 
	 * �û��˻���� �����٣���Ӧ���̵���Ϣ�޸� ��ҵĽ���������������Ʒ��ɽ��׵�ʱ�� 
	 * 
	 */
	@RequestMapping(value="/submitOrder")
	@ResponseBody
	public JsonPublic submitOrder(HttpServletRequest request,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String money = request.getParameter("money");
		String index = request.getParameter("index");
		String num = request.getParameter("num");
		String[] index_split = index.trim().split(",");//����id
		String[] num_split = num.trim().split(",");//����
		int orderid = 0;
		for(int i=0;i<index_split.length;i++) {//���Ҷ�������Ϣ �������٣���Ӧ�̼ҵ���Ʒ������ ����������
			//�����ύֵΪ��
			UserOrder uo = shopCardService.selectById(Integer.parseInt(index_split[i]));
			ShopGoods sg = shopService.selectById(uo.getSdid());
			int new_kc = sg.getKucun()-Integer.parseInt(num_split[i]);
			int new_xl = sg.getXiaol()+Integer.parseInt(num_split[i]);
			sg.setKucun(new_kc);
			sg.setXiaol(new_xl);
			orderid = uo.getOrderid();
			shopService.update_shopgoods(sg);
			shopCardService.update_UserOrder_type(uo.getId(), 3);
		}
		JsonPublic jsonPublic = new JsonPublic();
		//�û��Ľ����� �����ý������
		UserAccount userAccount = userAccountService.selectByUid(user.getId());
		if(userAccount.getUse_money()<Float.parseFloat(money)) {
			jsonPublic.setCode(100);//������ڽ����
			jsonPublic.setMessage("��������");
		}else {
			float money1 = userAccount.getUse_money()-Float.parseFloat(money);
			float money2 = userAccount.getNo_use_money()+Float.parseFloat(money);
			userAccount.setUse_money(money1);
			userAccount.setNo_use_money(money2);
			userAccountService.update(userAccount);
			shopCardService.update_orderLog_type(2, orderid);
			jsonPublic.setCode(200);
			jsonPublic.setMessage("�ύ�����ɹ�");
		}
		return jsonPublic;
	}
	
	@RequestMapping(value="/gwc")
	@ResponseBody
	public JsonPublic gwc(HttpServletRequest request,HttpSession session,@RequestParam("sid")String sid,@RequestParam("mid")String mid) {
		User user = (User)session.getAttribute("user");
		JsonPublic json = new JsonPublic();
		if(user==null) {
			json.setCode(101);
			json.setMessage("���ȵ�¼");
		}
		Shop shop = shopService.findBySid1(Integer.parseInt(sid));
		if(shop.getUid()==user.getId()) {
			json.setCode(100);
			json.setMessage("���ܹ����Լ��ĵ�");
		}else {
			int sdid = shopService.findBysdId(Integer.parseInt(mid), Integer.parseInt(sid));
			shopCardService.insertShopgoods(user.getId(),sdid);
			json.setCode(200);
			json.setMessage("���빺�ﳵ�ɹ�");
		}
		
		return json;
	}
}
