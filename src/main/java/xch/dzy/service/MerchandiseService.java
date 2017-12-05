package xch.dzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.MerchandiseDao;
import xch.dzy.model.Merchandise;

@Service
public class MerchandiseService {
	@Autowired
	private MerchandiseDao merchandiseDao;
	
	public Merchandise findById(int uid) {
		return merchandiseDao.findById(uid);
	}
	
	public List<Merchandise> selectByMid(int sid){
		return merchandiseDao.selectByMid(sid);
	}
	
	public int insert(Merchandise mr) {
		return merchandiseDao.insert(mr);
	}
}
