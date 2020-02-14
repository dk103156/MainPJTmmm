package com.mmm.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.User;
import com.mmm.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase",purchase);
	}
		
	
	@Override
	public void addGiftPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addGiftPurchase",purchase);
	}
	
	
	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchse", purchaseNo);
	}
	
	@Override
	public List<Purchase> getPurchaseList(Purchase purchase) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", purchase);
	}
	
	@Override
	public List<Purchase> getCancelPurchaseList(Purchase purchase) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getCancelPurchaseList", purchase);
	}
	
	@Override
	public List<Purchase> getSaleList(Search search) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getSaleList", search);
	}
	
	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	@Override
	public void updateGiftPurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateGiftPurchase", purchase);
	}
	
	@Override
	public void updatePurchaseStatus(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchaseStatus", purchase);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
}
