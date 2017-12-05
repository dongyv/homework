package xch.dzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.ShopCardDao;
import xch.dzy.model.UserOrder;
import xch.dzy.model.UserOrderLog;

@Service
public class ShopCardService {
	
	@Autowired
	private ShopCardDao shopCardDao;
	
	public List<UserOrder> shopCart(int id,int type){
		return shopCardDao.shopCart(id,type);
	}
	
	public int update_UserOrder_type(int id,int type) {
		return shopCardDao.update_UserOrder_type(id,type);
	}
	
	public List<UserOrder> shopCartGoodPrie(int id){
		return shopCardDao.shopCartGoodPrie(id);
	}
	public UserOrder selectById(int id) {
		return shopCardDao.selectById(id);
	}
	
	public int delete(int id) {
		return shopCardDao.delete(id);
	}
	
	public int remove(int id) {
		return shopCardDao.remove(id);
	}
	
	public int remove_order(int id,int orderid,int num) {
		return shopCardDao.remove_order(id,orderid,num);
	}
	
	public int insert_orderLog(UserOrderLog userOredrLog) {
		return shopCardDao.insert_orderLog(userOredrLog);
	}
	
	public int update_orderLog_type(int type,int orderid) {
		return shopCardDao.update_orderLog_type(type,orderid);
	}
	
	public int insertShopgoods(int uid,int sdid) {
		return shopCardDao.insertShopgoods(uid,sdid);
	}
}
