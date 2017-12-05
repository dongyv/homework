package xch.dzy.dao;

import java.util.List;

import xch.dzy.model.UserAddress;

public interface UserAddressDao {
	public List<UserAddress> findById(int id);
	public UserAddress findByIdDefault(int id);
	public int save(UserAddress ua);
}
