package com.mmm.service.purchase;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Purchase;

public interface PurchaseService {
	
	
	//구매하기
	public void addPurchase(Purchase purchase) throws Exception;
	
	//선물하기
	public void addGiftPurchase(Purchase purchase) throws Exception;
	
	//구매 상세정보
	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	//구매내역 목록
	public Map<String,Object> getPurchaseList(Purchase purchase) throws Exception;
	
	//구매취소내역 목록
	public Map<String,Object> getCancelPurchaseList(Purchase purchase) throws Exception;
	
	//(Admin)구매내역 목록
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	//구매 취소
	public void updatePurchase(Purchase purchase) throws Exception;
	
	//선물 취소
	public void updateGiftPurchase(Purchase purchase) throws Exception;
	
	//구매상태코드 업데이트
	public void updatePurchaseStatus(Purchase purchase)throws Exception;
	
}
