package xch.dzy.model;

public class UserPhoneLog {
	/**
	 * �û������б�
	 */
	private int id;
	private String phone_log;
	private String time;
	private String action;//���ŵ�����
	private String phone_number;//�ֻ�����
	private int uid;//�û�id
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhone_log() {
		return phone_log;
	}
	public void setPhone_log(String phone_log) {
		this.phone_log = phone_log;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	
}
