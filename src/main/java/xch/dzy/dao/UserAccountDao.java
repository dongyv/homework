package xch.dzy.dao;

import xch.dzy.model.UserAccount;

public interface UserAccountDao {
	public int insert(UserAccount ua);
	public UserAccount selectById(int id);
	public int update(UserAccount ua);
	public UserAccount selectByUid(int uid);
}
