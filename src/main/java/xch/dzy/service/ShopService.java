package xch.dzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.ShopDao;
import xch.dzy.model.Shop;
import xch.dzy.model.ShopGoods;

@Service
public class ShopService {
	
	@Autowired
	private ShopDao shopDao;
	
	public List<Shop> findAll(){
		return shopDao.findAll();
	}
	
	public ShopGoods findBySid(int sid) {
		return shopDao.findBySid(sid);
	}
	public Shop findBySid1(int sid) {
		return shopDao.findBySid1(sid);
	}

	public List<Shop> findByUid(int uid){
		return shopDao.findByUid(uid);
	}
	
	public List<ShopGoods> findShopGoods(int sid){
		return shopDao.findShopGoods(sid);
	}
	
	public int save(Shop shop) {
		return shopDao.save(shop);
	}
	
	public ShopGoods selectById(int id){
		return shopDao.selectById(id);
	}
	
	public int update_shopgoods(ShopGoods sp) {
		return shopDao.update_shopgoods(sp);
	}
	
	public int insertGoods(ShopGoods sg) {
		return shopDao.insertGoods(sg);
	}
	
	public int findBysdId(int mid,int sid) {
		return shopDao.findBysdId(mid,sid);
	}
}
