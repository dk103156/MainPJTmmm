package com.mmm.service.inven;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Inven;

public interface InvenService {
	
	
	public void addInven(Inven inven) throws Exception;
	
	public Inven getInven(int prodPinNo) throws Exception;
	
	public Map<String,Object> getInvenList(Search search) throws Exception;
	
	public void updateInven(Inven inven) throws Exception;
	
	//public void deleteInven(Inven inven) throws Exception;
	
	
}
