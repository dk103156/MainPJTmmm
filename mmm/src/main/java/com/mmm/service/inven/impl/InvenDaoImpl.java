package com.mmm.service.inven.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Inven;
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
	public void addInven(Inven inven) throws Exception {
		sqlSession.insert("InvenMapper.addInven",inven);
	}
	
	
	@Override
	public Inven getInven(int prodPinNo) throws Exception {
		return sqlSession.selectOne("InvenMapper.getInven", prodPinNo);
	}
	
	
	@Override
	public List<Inven> getInvenList(Search search) throws Exception {
		return sqlSession.selectList("InvenMapper.getInvenList",search);
	}
	
	
	@Override
	public void updateInven(Inven inven) throws Exception {
		sqlSession.update("InvenMapper.updateInven", inven);
	}
	
	
//	@Override
//	public void deleteInven(Inven inven) throws Exception {
//		sqlSession.delete("InvenMapper.deleteInven", inven);
//	}
	
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
	
	
	
}	
