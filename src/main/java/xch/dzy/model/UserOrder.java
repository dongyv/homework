package xch.dzy.model;

import java.util.List;

public class UserOrder {
	/**
	 * 用户订单
	 */
	private int id;
	private int uid;
	private int sdid;
	private String addtime;
	private int type;//类型 购物车或者是订单
	private int num;//不存在数据库 库存数量
	private float price;
	private int orderid;//订单编号
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getId() {	
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getSdid() {
		return sdid;
	}
	public void setSdid(int sdid) {
		this.sdid = sdid;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
