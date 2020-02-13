package com.mmm.service.inven.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Inven;
import com.mmm.service.inven.InvenDao;
import com.mmm.service.inven.InvenService;

@Service
public class InvenServiceImpl implements InvenService{
	
	
	@Autowired
	@Qualifier("invenDaoImpl")
	private InvenDao invenDao;
	public void setInvenDao(InvenDao invenDao) {
		this.invenDao = invenDao;
	}
	
	public InvenServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addInven(Inven inven) throws Exception {
		invenDao.addInven(inven);
	}

	@Override
	public Inven getInven(int prodPinNo) throws Exception {
		return invenDao.getInven(prodPinNo);
	}

	@Override
	public Map<String, Object> getInvenList(Search search) throws Exception {
		List<Inven> list = invenDao.getInvenList(search);
		int totalCount = invenDao.getTotalCount(search);
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("list" , list);
		map.put("totalCount" , new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateInven(Inven inven) throws Exception {
		invenDao.updateInven(inven);
	}

//	@Override
//	public void deleteInven(Inven inven) throws Exception {
//		invenDao.deleteInven(inven);
//	}
//	
	
	
}
