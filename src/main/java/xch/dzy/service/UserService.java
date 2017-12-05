package xch.dzy.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.UserDao;
import xch.dzy.model.User;

@Service
public class UserService {
	 @Autowired
	 private UserDao userDao;
	 
	 public User findUserById(int id) {
		 return userDao.findUserById(id);
	 }
	 
	 public boolean findUserAndPwd(String name,String password){
		 User user = userDao.findUserAndPwd(name,password);
		 if(user!=null){
			 return true;
		 }else{
			 return false;
		 }
	 }
	 
	 public User findEmailOrPhoneUnix1(String emailoruser) {
		 
		 return userDao.findEmailOrPhoneUnix(emailoruser);
	 }
	 
	 //查询 email 是不是 存在数据库
	 public boolean findEmailOrPhoneUnix(String emailoruser) {
		  User user = userDao.findEmailOrPhoneUnix(emailoruser);
		  if(user!=null){
			  return true;
		  }else{
			  return false;
		  }
	 }
	 
	 public int insert(User user) {
		 return userDao.insert(user);
	 }
	 
	 public int update(User user) {
		 return userDao.update(user);
	 }
	 
	 public int update_shopper(int id) {
		 return userDao.update_shopper(id);
	 }
}
