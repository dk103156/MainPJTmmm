package com.mmm.service.inven.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Inventory;
import com.mmm.service.inven.InvenDao;

@Repository("invenDaoImpl")
public class InvenDaoImpl implements InvenDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void addInven(Inventory inven) throws Exception {
		sqlSession.insert("InvenMapper.addInven",inven);
	}
	
	
	@Override
	public void addGiftInven(Inventory inven) throws Exception {
		sqlSession.insert("InvenMapper.addGiftInven",inven);
	}
	
	
	@Override
	public Inventory getInven(int invenNo) throws Exception {
		return sqlSession.selectOne("InvenMapper.getInven", invenNo);
	}
	
	
	@Override
	public List<Inventory> getInvenList(Search search) throws Exception {
		return sqlSession.selectList("InvenMapper.getInvenList",search);
	}
	
	
	@Override
	public void updateInven(Inventory inven) throws Exception {
		sqlSession.update("InvenMapper.updateInven", inven);
	}
	
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
	
}	
