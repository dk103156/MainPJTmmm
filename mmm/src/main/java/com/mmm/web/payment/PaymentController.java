package com.mmm.web.payment;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.service.domain.Movie;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.movie.MovieService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.purchase.PurchaseService;
import com.mmm.service.ticketing.TicketingService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	
	///Field
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	
	@Autowired
	@Qualifier("ticketingServiceImpl")
	private TicketingService ticketingService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "/preparePayment", method = RequestMethod.POST)
	public String preparePayment(	@ModelAttribute Ticketing ticketing,
									@ModelAttribute Purchase purchase,
									HttpSession session,
									Model model)throws Exception{
		
//		Movie poster를 가져오기 위해 ticketing에서 movieTitle 뽑기
		Movie inputMovie = new Movie();
		inputMovie.setMovieTitle(ticketing.getMovieName().trim());
		Movie movie = movieService.getMovieByMovieTitle(inputMovie);
		
		System.out.println(" --------------- movie : "+movie);
		System.out.println(" --------------- ticketing : "+ticketing);
		System.out.println(" --------------- purchase : "+purchase);
		System.out.println(" --------------- (User)session.getAttribute(\"user\") : "+(User)session.getAttribute("user"));
		
		int totalPoint = paymentService.getTotalPoint(((User)session.getAttribute("user")).getUserNo());
		System.out.println(" --------------- totalPoint : "+totalPoint);
		
		model.addAttribute("movie",movie);
		model.addAttribute("ticketing",ticketing);
		model.addAttribute("purchase",purchase);
		model.addAttribute("totalPoint",totalPoint);
//		발행한 상품권 중 사용가능한 상품권 리스트도 넣어주어야 한다.
		
		
		return "forward:/payment/addPayment.jsp";
	}
	
	@RequestMapping(value = "/addPayment", method = RequestMethod.POST)
	public String addPayent(@ModelAttribute Payment payment,
							@ModelAttribute Ticketing ticketing,
							@ModelAttribute Purchase purchase,
//							@RequestParam(value = "ticketingNo" , required = false) String ticketingNo,		//bodyEntity에 넣어서 주는 ticketing 정보
//							@RequestParam(value = "purchaseNo", required = false) String purchaseNo,		//bodyEntity에 넣어서 주는 purchase 정보
//							@RequestParam("impUid") String impUid,
							HttpSession session, Model model)throws Exception{
		
		System.out.println("------------input payment :  "+payment);
		System.out.println("------------input ticketing :  "+ticketing);
		System.out.println("------------input purchase :  "+purchase);
		System.out.println("----------- input impUid  : "+payment.getImpUid());
		
//		로그인한 회원 정보 from session
		User user = (User)session.getAttribute("user");
		payment.setUserNo(user.getUserNo());
		System.out.println("----------- user.getUserNo() : "+user.getUserNo());
		
//	1.ticketing setting
		String uuid = UUID.randomUUID().toString().substring(0, 23); //티켓팅 번호
		ticketing.setTicketingPinNo(uuid); 				//핀번호
		ticketing.setTicketingDate(new Timestamp(new java.util.Date().getTime())); //현재 날짜로 삽입
		ticketing.setTicketingStatus(0); 				//상태 0이면 예매완료 1이면 취소
		ticketing.setTicketerPhone(user.getPhone());	//회원,비회원 포함

//	2.ticketing setting
		
//	3.payment setting
//		payMethod 나눠주는 Logic..
		String voucherExist ="";
		if (payment.getUsingVoucherFirst() != null) {
			voucherExist += payment.getUsingVoucherFirst();
		}
		if (payment.getUsingVoucherSecond() != null) {
			voucherExist += payment.getUsingVoucherSecond();
		}
		if (payment.getUsingVoucherThird() != null) {
			voucherExist += payment.getUsingVoucherThird();
		}
		System.out.println("----------- vouchExist  : "+voucherExist);
		
		if (payment.getCash() > 0 && payment.getUsingPoint() ==0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 0 / only cash");
			payment.setPayMethod(0);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() >0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 1 / only point");
			payment.setPayMethod(1);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() ==0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 2 / only voucher");
			payment.setPayMethod(2);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() >0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 3 / cash+point");
			payment.setPayMethod(3);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() ==0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 4 / cash+voucher");
			payment.setPayMethod(4);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() > 0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 5 / point+voucher");
			payment.setPayMethod(5);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() > 0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 6 / cash+point+voucher");
			payment.setPayMethod(6);
		}
		
//		payObjectFlag 세팅 (0 : ticketing 1: purchase  2:ticketing + purchase)
		if (ticketing.getTicketingPrice() > 0 && purchase.getPurchasePrice() == 0) {
//			1 : 예매만 한경우
			System.out.println("==> PayObjectFlag  : 0 / ticketing");
			payment.setPayObjectFlag(0);
		}else if (ticketing.getTicketingPrice() == 0 && purchase.getPurchasePrice() > 0) {
			System.out.println("==> PayObjectFlag  : 1 / purchase");
//			2 : 구매만 한경우
			payment.setPayObjectFlag(1);
		}else if (ticketing.getTicketingPrice() > 0 && purchase.getPurchasePrice() > 0) {
			System.out.println("==> PayObjectFlag  : 2 / ticketing + purchase(QuickOrder)");
//			3 : 예매 + 구매만 한경우
			payment.setPayObjectFlag(2);
		}
		
//		addPayment()를 위한  parameter 맵
		Map<String, Object> inputMap = new HashMap<String, Object>();	
		
//		결제 안에 예매, 구매 넣기
		payment.setTicketing(ticketing);
		payment.setPurchase(purchase);
		
//	4.Point setting
		Point minusPoint = new Point();
		Point plusPoint = new Point();
		
//		savingPoint 계산.. cash로 결제를 한 경우에만 적립한다.
		if (payment.getPayMethod() == 0 || payment.getPayMethod() == 3 
			|| payment.getPayMethod() == 4 || payment.getPayMethod() == 6) {
			
//			적립 1% ...... properties 처리하자...
			int savingPoint = (int)(payment.getCash()*0.01);
			payment.setSavingPoint(savingPoint);
			
			System.out.println("--------> cash : "+ payment.getCash());
			System.out.println("--------> savingPoint : "+savingPoint);
			
//		적립포인트..
			plusPoint.setUserNo(user.getUserNo());
			plusPoint.setPointStatus("S0");		// 적립-현금결제
			plusPoint.setPartPoint(payment.getSavingPoint());
			
			inputMap.put("plusPoint", plusPoint);
		}
		
//		usingPoint 처리를 위해.. point로 결제를 한 경우에만 차감한다.
		if (payment.getPayMethod() == 1 || payment.getPayMethod() == 3 
				|| payment.getPayMethod() == 5 || payment.getPayMethod() == 6) {
//			사용포인트..
				minusPoint.setUserNo(user.getUserNo());
				minusPoint.setPointStatus("U0");		//사용- 포인트 결제
//				사용 포인트 음수(-) 처리
				minusPoint.setPartPoint(payment.getUsingPoint()*-1);
				
				System.out.println("--------> savingPoint : "+minusPoint.getPartPoint());
				inputMap.put("minusPoint", minusPoint);
		}
		
//		addPayment()  parameter 넣기
		inputMap.put("ticketing", ticketing);
		inputMap.put("purchase", purchase);
		inputMap.put("payment", payment);
		
//		service 호출.. BL 수행
		paymentService.addPayment(inputMap);

		
		model.addAttribute(payment);
		
//		예매 / 구매 / 예매+구매 인지에 따라 다른 model AND view
		if (payment.getPayObjectFlag() == 0) {			// 1: only 예매
			
//			포스터 주기위해..
			Movie inputMovie = new Movie();
			inputMovie.setMovieTitle(ticketing.getMovieName());
			Movie resultMovie = movieService.getMovieByMovieTitle(inputMovie);
			
			model.addAttribute("movie", resultMovie);
			model.addAttribute(ticketing);
			
			return "forward:/ticketing/completeTicketing.jsp";
			
		}else if (payment.getPayObjectFlag() == 1) {	// 2: only 구매
			model.addAttribute(purchase);
			
			return "forward:/";
			
		}else if (payment.getPayObjectFlag() == 2) {	//3 : 예매 + 구매
			
//			포스터 주기위해..
			Movie inputMovie = new Movie();
			inputMovie.setMovieTitle(ticketing.getMovieName());
			Movie resultMovie = movieService.getMovieByMovieTitle(inputMovie);
			String poster = resultMovie.getPoster();
			System.out.println("--------------> poster : "+poster);
			
			
			model.addAttribute("movie", resultMovie);
			model.addAttribute(ticketing);
			model.addAttribute(purchase);
			
			return "forward:/ticketing/completeTicketing.jsp";
		}
		
		
		return "forward:/payment/testPaymentResult.jsp";
	}
}
