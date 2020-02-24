package com.mmm.web.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.common.CheckAuth;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.User;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

//==>마이페이지 Controller
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	///Field 
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 하지않음
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private JavaMailSender mailSender;	
	
	@Autowired
	private DateTimeService dateTimeService;
	
	///Constructor
	public MypageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="mypage", method = RequestMethod.GET)
	public String mypage() throws Exception{
		
		System.out.println("/mypage/mypage : GET ");
			
		return "forward:/mypage/mypage.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="mypageUser", method = RequestMethod.GET)
	public String mypageUser(Model model,HttpSession session) throws Exception{
		
		System.out.println("/mypage/mypageUser : GET ");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("세션에서 가져온 acc 포인트"+user.getAccPoint()+"세션에서 가져온 total 포인트"+user.getTotalPoint());
		
		user.setTotalPoint(paymentService.getTotalPoint(user.getUserNo()));
		user.setAccPoint(paymentService.getAccPoint(user.getUserNo()));
		userService.updateUser(user);
		
		System.out.println("업데이트 acc 포인트"+user.getAccPoint()+"업데이트 total 포인트"+user.getTotalPoint());
		
		session.setAttribute("user", userService.getUser(user.getUserNo()));
		model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
		
		return "forward:/mypage/mypageUser.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="mySeenMovieList", method = RequestMethod.GET)
	public String myMovieList() throws Exception{
		
		System.out.println("/mypage/mySeenMovieList : GET ");
		
		return "forward:/mypage/mySeenMovieList.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="wishList", method = RequestMethod.GET)
	public String wishList() throws Exception{
		
		System.out.println("/mypage/wishList : GET ");
		
		return "forward:/mypage/wishList.jsp";
	}

}
