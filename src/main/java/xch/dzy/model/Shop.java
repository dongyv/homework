package xch.dzy.model;

import java.util.List;

public class Shop {
	/**
	 * ������Ϣ
	 */
	private int id;
	private int uid;//�곤id
	private String name;//��������
	private String strength;//0��ͨ�̼� 1ʵ���̼�
	private String addtime;//����ʱ��
	
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
