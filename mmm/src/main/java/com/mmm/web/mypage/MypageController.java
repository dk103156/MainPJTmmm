package com.mmm.web.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.common.CheckAuth;
import com.mmm.service.datetime.DateTimeService;
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
	public String mypageUser() throws Exception{
		
		System.out.println("/mypage/mypageUser : GET ");
			
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
