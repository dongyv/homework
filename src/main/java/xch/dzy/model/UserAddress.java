package xch.dzy.model;

public class UserAddress {
	/**
	 * �û���ַ��Ϣ
	 */
	private int id;
	private int uid;//�û�id
	private String address;//��ַ
	private String consignee;//�ջ���
	private String cphone;//�ջ����ֻ�����
	private int ismodel;//�Ƿ�ΪĬ�ϵ�ַ
	
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
