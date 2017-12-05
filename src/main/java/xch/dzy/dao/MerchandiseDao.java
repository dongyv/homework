package xch.dzy.dao;

import java.util.List;

import xch.dzy.model.Merchandise;

public interface MerchandiseDao {
	public Merchandise findById(int uid);
	public List<Merchandise> selectByMid(int sid);
	public int insert(Merchandise mr);
}
