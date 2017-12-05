package xch.dzy.model;

public class User {
	/**
	 * 用户信息
	 */
	// 成员变量
	private int id;
	private String name;//用户名
	private String nickname;//昵称
	private String sex;//0男 1女 默认男
	private String birth;//生日
	private String phone;//手机号码
	private String email;//邮箱
	private String password;//登录密码
	private String paypassword;//支付密码
	private int shopper;//是否是卖家
	
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

	// 构造函数
    public User() {
        super();
    }

}
