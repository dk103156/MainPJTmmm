package com.mmm.service.inventory;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;

public interface InventoryService {
	
	
	public void addInventory(Inventory inventory) throws Exception;
	
	public Inventory getInventory(int inventoryNo) throws Exception;
	
	public Map<String,Object> getInventoryList(Inventory inventory) throws Exception;
	
	public void updateInventory(Inventory inventor) throws Exception;
	
	public void deleteInventory(int inventoryNo) throws Exception;
		
		
	
	
	
	
	
	
	
	
	
}
