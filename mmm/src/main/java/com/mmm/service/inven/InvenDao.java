package com.mmm.service.inven;

import java.util.List;

import com.mmm.common.Search;
import com.mmm.service.domain.Inven;

public interface InvenDao {
	
	
	public void addInven(Inven inven) throws Exception;
	
	public Inven getInven(int prodPinNo) throws Exception;
	
	public List<Inven> getInvenList(Search search) throws Exception;
	
	public void updateInven(Inven inven) throws Exception;
	
	//public void deleteInven(Inven inven) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
