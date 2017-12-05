package xch.dzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.UserAccountDao;
import xch.dzy.model.UserAccount;

@Service
public class UserAccountService {
	
	@Autowired
	private UserAccountDao userAccountDao;
	
	public int insert(UserAccount ua) {
		return userAccountDao.insert(ua);
	}
	
	public UserAccount selectById(int id) {
		return userAccountDao.selectById(id);
	}
	
	public int update(UserAccount ua) {
		return userAccountDao.update(ua);
	}
	
	public UserAccount selectByUid(int uid) {
		return userAccountDao.selectByUid(uid);
	}
}
