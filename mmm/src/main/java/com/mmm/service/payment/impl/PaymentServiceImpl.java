package com.mmm.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.mmm.common.Search;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.payment.PaymentDao;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.purchase.PurchaseDao;
import com.mmm.service.ticketing.TicketingDao;

@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService {

	
///	Field
	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	
	@Autowired
	@Qualifier("ticketingDaoImpl")
	private TicketingDao ticketingDao;
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	public static final String impKey = "6944686805011226";
	public static final String impSecret = "ZXtPf4IT38iJVVxXvy4CNmejclGC3qu2oYRD2Ax6IQQELnBgWGTK383fuKRxamAzkscn2KtKAjplH0CE";
	public String accessToken;
	
	//외부 Http 연결을 용이하게 하기 위한 template
//	HttpEntity<?> headers;						//Movie와 다르게 없이 사용해보자
	RestTemplate template = new RestTemplate();
	ObjectMapper mapper = new ObjectMapper();
	JSONParser jsonParser = new JSONParser();
	
	/// 1. paymentDao Setter
	public void setPaymentDao(PaymentDao paymentDao) {
		System.out.println(">>> "+getClass()+".setPaymentDao() Call.....");
		this.paymentDao = paymentDao;		
	}
	
	/// 2. ticketingDao Setter
	public void setTicketingDao(TicketingDao ticketingDao) {
		System.out.println(">>> "+getClass()+".setTicketingDao() Call.....");
		this.ticketingDao = ticketingDao;		
	}
	
	/// 3. purchaseDao Setter
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		System.out.println(">>> "+getClass()+".setPurchaseDao() Call.....");
		this.purchaseDao = purchaseDao;		
	}

/// Constructor
	public PaymentServiceImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}

	///Method
	@Override
	public void addPayment(Map<String, Object> inputMap) throws Exception {
		
		
//		Parameter에서 Data 뽑아오기 
		Ticketing ticketing  = (Ticketing)inputMap.get("ticketing");
		Purchase purchase = (Purchase)inputMap.get("purchase");
		Payment payment = (Payment)inputMap.get("payment");

		
		System.out.println("------------addPayment payment :  "+payment);
		System.out.println("------------addPayment ticketing :  "+ticketing);
		System.out.println("------------addPayment purchase :  "+purchase);
		
//		DB에 넣기( 예매,	 구매,	결제).. transaction 관리를 위해 여기서..
		if (payment.getPayObjectFlag()==0) {
			ticketingDao.addTicketing(ticketing);
		}else if (payment.getPayObjectFlag()==1) {
			purchaseDao.addPurchase(purchase);
		}else if (payment.getPayObjectFlag()==2) {
			ticketingDao.addTicketing(ticketing);
			purchaseDao.addPurchase(purchase);
		}
		paymentDao.addPayment(payment);
		
		
//		savingPoint 처리를 위해.. cash로 결제를 한 경우에만 적립한다.
		if (payment.getPayMethod() == 0 || payment.getPayMethod() == 3 
			|| payment.getPayMethod() == 4 || payment.getPayMethod() == 6) {
			
			System.out.println("------------addPayment plusPoint :  "+(Point)inputMap.get("plusPoint"));
			paymentDao.addPoint((Point)inputMap.get("plusPoint"));
		}
		
//		usingPoint 처리를 위해.. point로 결제를 한 경우에만 차감한다.
		if (payment.getPayMethod() == 1 || payment.getPayMethod() == 3 
				|| payment.getPayMethod() == 5 || payment.getPayMethod() == 6) {
			
			System.out.println("------------addPayment minusPoint :  "+(Point)inputMap.get("minusPoint"));
			paymentDao.addPoint((Point)inputMap.get("minusPoint"));
		}
		
		
		
//		String impUid = payment.getImpUid();
		
//		imPort에서 결제 정보 가져오는 ..
//		this.getPayinfo(impUid);
		
		
	}

	@Override
	public HashMap<String, Object> getPaymentList(Search search) throws Exception {
		return paymentDao.getPaymentList(search);
	}

	@Override
	public Payment getPayment(int paymentNo) throws Exception {
		
		return paymentDao.getPayment(paymentNo);
	}
		
		
	@Override
	public void cancelPayment(Payment payment) throws Exception {
		paymentDao.cancelPayment(payment);
	}

	@Override
	public HashMap<String, Object> getPaymentListAd(Search search) throws Exception {
		return paymentDao.getPaymentListAd(search);
	}

	@Override
	public void savePoint(Point point) throws Exception {
		paymentDao.addPoint(point);
	}

	@Override
	public HashMap<String, Object> getPointList(Search search) throws Exception {
		return paymentDao.getPointList(search);
	}

	@Override
	public int checkAttedance(int userNo) throws Exception {
		return paymentDao.checkAttedance(userNo);
	}
	
	
	
//	imp 다녀오기 위해 토큰을 받는 메소드
	public void getToken() throws Exception{
		
		String url = "https://api.iamport.kr/users/getToken";
	
//		header 세팅
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
//		this.headers = new HttpEntity<>(headerMap);
		
//		body 세팅__ imp key & secret
		JSONObject bodyJson = new JSONObject();
		bodyJson.put("imp_key", impKey);
		bodyJson.put("imp_secret", impSecret);
		System.out.println("------------bodyJson  : " + bodyJson);
		
//		body 와 header 정보 HttpEntity에 넣기
		HttpEntity<String> request = new HttpEntity<String>(bodyJson.toString() , headerMap);
		
		ResponseEntity<String> responseEntity = template.exchange(url, HttpMethod.POST, request, String.class);
		System.out.println("------------responseEntity  : " + responseEntity);
		
		JSONObject jsonObject = (JSONObject) jsonParser.parse(responseEntity.getBody().toString());
		System.out.println("--------------obj : " + jsonObject);
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		System.out.println("--------------response : " + response);
		
		accessToken = response.get("access_token").toString();
		System.out.println("--------------accessToken : " + accessToken);
		
	
	}
	
	
//	impUid로 결제 정보를 가져오는 메소드
	public void getPayinfo(String impUid)throws Exception{
		this.getToken();
		
		String url = "https://api.iamport.kr/payments/" + impUid;
		System.out.println("---- url : "+ url);
		
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		headerMap.add("Authorization", this.accessToken);
		HttpEntity<String> request = new HttpEntity<String>(headerMap);
		
		ResponseEntity<String> responseEntity = template.exchange(url, HttpMethod.GET, request, String.class);
		
		JSONObject jsonObject = (JSONObject) jsonParser.parse(responseEntity.getBody().toString());
		
		System.out.println(jsonObject);
	}

	@Override
	public int getTotalPoint(int userNo) throws Exception {
		return paymentDao.getTotalPoint(userNo);
	}

	
}
