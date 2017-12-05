package xch.dzy.dao;

import org.apache.ibatis.annotations.Param;

import xch.dzy.model.User;

public interface UserDao {
	 public User findEmailOrPhoneUnix(String emailoruser);
	 public int insert(User user);
	 public User findUserAndPwd(@Param("name")String name,@Param("password")String password);
	 public User findUserById(int id);
	 public int update(User user);
	 public int update_shopper(int id);
}
