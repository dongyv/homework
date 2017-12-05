package xch.dzy.model;

import java.util.List;

public class Shop {
	/**
	 * 店铺信息
	 */
	private int id;
	private int uid;//店长id
	private String name;//店铺名字
	private String strength;//0普通商家 1实力商家
	private String addtime;//创建时间
	
	private List<Merchandise> merchandise;
	public List<Merchandise> getMerchandise() {
		return merchandise;
	}
	public void setMerchandise(List<Merchandise> merchandise) {
		this.merchandise = merchandise;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStrength() {
		return strength;
	}
	public void setStrength(String strength) {
		this.strength = strength;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	
}
