package com.mmm.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Purchase;
import com.mmm.service.purchase.PurchaseDao;
import com.mmm.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}
	
	@Override
	public void addGiftPurchase(Purchase purchase) throws Exception {
		purchaseDao.addGiftPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		return purchaseDao.getPurchase(purchaseNo);
	}

	@Override
	public Map<String,Object> getPurchaseList(Purchase purchase) throws Exception {
		List<Purchase> list = purchaseDao.getPurchaseList(purchase);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		
		return map;
	}
	
	@Override
	public Map<String,Object> getCancelPurchaseList(Purchase purchase) throws Exception {
		List<Purchase> list = purchaseDao.getCancelPurchaseList(purchase);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		
		return map;
	}
	
	@Override
	public Map<String,Object> getSaleList(Search search) throws Exception {
		List<Purchase> list = purchaseDao.getSaleList(search);
		
		int totalCount = purchaseDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("totalCount" , new Integer(totalCount));
		
		return map;
	}
	

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}
	
	@Override
	public void updateGiftPurchase(Purchase purchase) throws Exception {
		purchaseDao.updateGiftPurchase(purchase);
	}
	
	
	@Override
	public void updatePurchaseStatus(Purchase purchase) throws Exception {
		purchaseDao.updatePurchaseStatus(purchase);
	}
}
