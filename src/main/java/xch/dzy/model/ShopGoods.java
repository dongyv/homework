package xch.dzy.model;

public class ShopGoods {
	/**
	 * ��������Ʒ
	 */
	private int id;
	private int sid;//����id
	private int mid;//��Ʒid
	private float price;//��Ʒ��Ǯ
	private String name;//��Ʒ
	private int xiaol;//����
	private int kucun;//���
	private String shop_name;//��������
	
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public int getXiaol() {
		return xiaol;
	}
	public void setXiaol(int xiaol) {
		this.xiaol = xiaol;
	}
	public int getKucun() {
		return kucun;
	}
	public void setKucun(int kucun) {
		this.kucun = kucun;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	
}
