package xch.dzy.model;

public class UserAddress {
	/**
	 * 用户地址信息
	 */
	private int id;
	private int uid;//用户id
	private String address;//地址
	private String consignee;//收货人
	private String cphone;//收获人手机号码
	private int ismodel;//是否为默认地址
	
	public int getIsmodel() {
		return ismodel;
	}
	public void setIsmodel(int ismodel) {
		this.ismodel = ismodel;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	
}
