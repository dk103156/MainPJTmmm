package com.mmm.service.cart.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.domain.Cart;

@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CartDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addCart(Cart cart) throws Exception {
		sqlSession.insert("CartMapper.addCart", cart);
	}
	
	
	@Override
	public List<Cart> getCartList(Cart cart) throws Exception {
		return sqlSession.selectList("CartMapper.getCartList", cart);
	}
	
	
	@Override
	public void updateCart(Cart cart) throws Exception {
		sqlSession.update("CartMapper.updateCart", cart);
	}
	
	@Override
	public void deleteCart(Cart cart) throws Exception {
		sqlSession.delete("CartMapper.deleteCart", cart);
	}
	
	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("CartMapper.getTotalCount", map);
	}
	
	
//	@Override
//	public int getProdNo(int prodNo) throws Exception {
//		return sqlSession.selectOne("CartMapper.getProdNo", cartNo);
//	}
	
}
