package xch.dzy.model;

public class User {
	/**
	 * �û���Ϣ
	 */
	// ��Ա����
	private int id;
	private String name;//�û���
	private String nickname;//�ǳ�
	private String sex;//0�� 1Ů Ĭ����
	private String birth;//����
	private String phone;//�ֻ�����
	private String email;//����
	private String password;//��¼����
	private String paypassword;//֧������
	private int shopper;//�Ƿ�������
	
	public int getShopper() {
		return shopper;
	}

	public void setShopper(int shopper) {
		this.shopper = shopper;
	}

	private int demo;
	
	public int getDemo() {
		return demo;
	}

	public void setDemo(int demo) {
		this.demo = demo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPaypassword() {
		return paypassword;
	}

	public void setPaypassword(String paypassword) {
		this.paypassword = paypassword;
	}

	// ���캯��
    public User() {
        super();
    }

}
