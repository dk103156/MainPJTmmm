package com.mmm.service.payment.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.payment.PaymentDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	
	///Setter
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(">>> "+getClass()+".setSqlSession() Call.....");
		
		this.sqlSession = sqlSession;		
	}
	
	///Constructor
	public PaymentDaoImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}

	///Method
	@Override
	public void addPayment(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.addPayment", payment);
		
	}

	@Override
	public HashMap<String, Object> getPaymentList(Search search) throws Exception {
		
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		outputMap.put("list", sqlSession.selectList("PaymentMapper.getPaymentList", search));
		outputMap.put("totalCnt", sqlSession.selectOne("PaymentMapper.getTotalCntPaymentList", search));
		
//		System.out.println("------------------------- "+ sqlSession.selectList("PaymentMapper.getPaymentList", search));
		return outputMap;
	}

	@Override
	public Payment getPayment(int paymentNo) throws Exception {
		return sqlSession.selectOne("PaymentMapper.getPayment", paymentNo);
	}
	
	@Override
	public void cancelPayment(Payment payment) throws Exception {
		
		// Payment table 플래그 바꾸기
		sqlSession.update("PaymentMapper.cancelPayment" ,payment);
		
		////// 포인트 되돌리기....( 적립, 사용 )
		////// 사용한 voucher 되돌리기 (inven table 활성화... )
		////// 실제 아이엠포트 환불
		
	}

	@Override
	public HashMap<String, Object> getPaymentListAd(Search search) throws Exception {

		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		outputMap.put("list", sqlSession.selectList("PaymentMapper.getPaymentListAd", search));
		outputMap.put("totalCnt", sqlSession.selectOne("PaymentMapper.getTotalCntPaymentListAd", search));
		
//		System.out.println("------------------------- "+ sqlSession.selectList("PaymentMapper.getPaymentList", search));
		return outputMap;
		
	}

	@Override
	public void addPoint(Point point) throws Exception {
		sqlSession.insert("PointMapper.addPoint", point);
		
	}

	@Override
	public HashMap<String, Object> getPointList(Search search) throws Exception {
		
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		outputMap.put("list", sqlSession.selectList("PointMapper.getPointList", search));
		outputMap.put("totalCnt", sqlSession.selectOne("PointMapper.getTotalCntPointList", search));
		
		return outputMap;
	}

	@Override
	public int checkAttedance(int userNo) throws Exception {
		return sqlSession.selectOne("PointMapper.checkAttendance", userNo);
	}

	@Override
	public int getTotalPoint(int userNo) throws Exception {
		if (sqlSession.selectOne("PointMapper.getTotalPoint", userNo) == null) {
			return 0;
		}
		return sqlSession.selectOne("PointMapper.getTotalPoint", userNo);
	}

	
	
}
