package xch.dzy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xch.dzy.model.Shop;
import xch.dzy.model.ShopGoods;

public interface ShopDao {
	public List<Shop> findAll();
	public ShopGoods findBySid(int sid);
	public Shop findBySid1(int sid);
	public List<Shop> findByUid(int uid);
	public List<ShopGoods> findShopGoods(int sid);
	public int save(Shop shop);
	public ShopGoods selectById(int id);
	public int update_shopgoods(ShopGoods sp);
	public int insertGoods(ShopGoods sp);
	public int findBysdId(@Param("mid")int mid,@Param("sid")int sid);
}
