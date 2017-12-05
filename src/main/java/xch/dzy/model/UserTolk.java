package xch.dzy.model;

public class UserTolk {
	/**
	 * 用户评价信息
	 */
	private int id;
	private int uid;
	private int sid;
	private int mid;
	private String talk;
	private String addtime;
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
	public String getTalk() {
		return talk;
	}
	public void setTalk(String talk) {
		this.talk = talk;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	
}
