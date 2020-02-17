package com.mmm.service.inven;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Inventory;

public interface InvenService {
	
	
	//보관함에 추가하기 - 구매
	public void addInven(Inventory inven) throws Exception;
		
	//보관함에 추가하기 - 선물
	public void addGiftInven(Inventory inven) throws Exception;
	
	//보관함 상세
	public Inventory getInven(int invenNo) throws Exception;
	
	//보관함 리스트
	public Map<String,Object> getInvenList(Search search) throws Exception;
	
	//쓰면 없데이트 해줘서 못쓰게 하기
	public void updateInven(Inventory inven) throws Exception;
	
	//public void deleteInven(Inven inven) throws Exception;
	
	
}
