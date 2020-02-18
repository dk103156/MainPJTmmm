package com.mmm.service.inventory.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;
import com.mmm.service.inventory.InventoryDao;

@Repository("inventoryDaoImpl")
public class InventoryDaoImpl implements InventoryDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public InventoryDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addInventory(Inventory inventory) throws Exception {
		
		sqlSession.insert("InventoryMapper.addInventory",inventory);
		
	}

	@Override
	public Inventory getInventory(int inventoryNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getInventoryList(Inventory inventory) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateInventory(Inventory inventory) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInventory(int inventoryNo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	
	

	
}
