package com.mmm.service.inventory.impl;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;
import com.mmm.service.inventory.InventoryDao;
import com.mmm.service.inventory.InventoryService;

@Service("inventoryServiceImpl")
public class InventoryServiceImpl implements InventoryService {
	
	@Autowired
	private InventoryDao inventoryDao;
	
	public void setInventoryDao(InventoryDao inventoryDao) {
		this.inventoryDao = inventoryDao;
	}
	
	
	public InventoryServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addInventory(Inventory inventory) throws Exception {
		
		inventoryDao.addInventory(inventory);
		
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
	public void updateInventory(Inventory inventor) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteInventory(int inventoryNo) throws Exception {
		// TODO Auto-generated method stub
		
	}



	
}
