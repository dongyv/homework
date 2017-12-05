package xch.dzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.UserAddressDao;
import xch.dzy.model.UserAddress;

@Service
public class UserAddressService {

	@Autowired
	private UserAddressDao userAddressDao;
	
	public List<UserAddress> findById(int id){
		return userAddressDao.findById(id);
	}
	
	public UserAddress findByIdDefault(int id) {
		return userAddressDao.findByIdDefault(id);
	}
	
	public int save(UserAddress ua) {
		return userAddressDao.save(ua);
	}
}
