package com.mmm.service.inven;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Inven;

public interface InvenService {
	
	
	//보관함에 추가하기 - 구매
	public void addInven(Inven inven) throws Exception;
		
	//보관함에 추가하기 - 선물
	public void addGiftInven(Inven inven) throws Exception;
	
	//보관함 상세
	public Inven getInven(int invenNo) throws Exception;
	
	//보관함 리스트
	public Map<String,Object> getInvenList(Search search) throws Exception;
	
	//쓰면 없데이트 해줘서 못쓰게 하기
	public void updateInven(Inven inven) throws Exception;
	
	//public void deleteInven(Inven inven) throws Exception;
	
	
}
