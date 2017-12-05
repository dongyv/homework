package xch.dzy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xch.dzy.model.UserOrder;
import xch.dzy.model.UserOrderLog;

public interface ShopCardDao {
	public List<UserOrder> shopCart(@Param("id")int id,@Param("type")int type);
	public int update_UserOrder_type(@Param("id")int id,@Param("type")int type);
	public List<UserOrder> shopCartGoodPrie(int id);
	public UserOrder selectById(int id);
	public int delete(int id);
	public int remove(int id);
	public int remove_order(@Param("id")int id,@Param("orderid")int orderid,@Param("num")int num);
	public int insert_orderLog(UserOrderLog userOrderLog);
	public int update_orderLog_type(@Param("type")int type,@Param("orderid")int orderid);
	public int insertShopgoods(@Param("uid")int uid,@Param("sdid")int sdid);
}
