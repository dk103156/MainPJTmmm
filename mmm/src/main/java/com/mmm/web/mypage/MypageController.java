package com.mmm.web.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

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
import com.mmm.service.board.BoardService;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.movie.MovieService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.ticketing.TicketingService;
import com.mmm.service.user.UserService;
import com.mmm.web.user.UserRestController;

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
	
	@Autowired
	private TicketingService ticketingService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private BoardService boardService;
	
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
		model.addAttribute("mySeeMovieCnt", mySeeMovieCnt(user.getPhone()));
		model.addAttribute("wishMovieCnt", wishMovieCnt(user.getUserNo()));
		model.addAttribute("commentCnt", commentCnt(user.getUserId()));
		
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
	
	// 한줄평 개수 가져오기
	public int commentCnt(String userId) {
		
		int commentCnt = 0;
		
		try {
			Search search = new Search();
			search.setStartRowNum(1);
			search.setCurrentPage(1);
			search.setPageSize(10);
			search.setCommentType(3);
			search.setUserId(userId);
		
			Map<String, Object> resultMap = boardService.getCommentList(search);
			
			System.out.println("commentCnt : "+resultMap);
			
			if(resultMap != null) {
				List<Comment> list = (List<Comment>) resultMap.get("list");
				commentCnt = (int)resultMap.get("totalCount");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return commentCnt;
		
	}
	
	// 위시리스트 개수 가져오기
	public int wishMovieCnt(int userNo) {
		
		int wishMovieCnt = 0;
		
		try {
			Search search = new Search();
			search.setStartRowNum(1);
			search.setCurrentPage(1);
			search.setPageSize(10);
			
			HashMap<String, Object> inputData = new HashMap<String, Object>();
			inputData.put("userNo", userNo);
			inputData.put("search", search);
			
			HashMap<String, Object> result = movieService.getWishMovieList(inputData);
			
			System.out.println(result);
			
			if(result != null) {
				wishMovieCnt = (int) result.get("totalCnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return wishMovieCnt;
	}
	
	// 내가 본 영화 개수 가져오기
	public int mySeeMovieCnt(String ticketerPhone) {
		
		int mySeeMovieCnt = 0;
		
		try {
			
			// 1. 티켓팅 리스트를 가져오기 위해서 Search 셋팅(폰번호)
			Search search = new Search();
			search.setTicketerPhone(ticketerPhone);
			search.setSearchCondition("2");
			search.setCurrentPage(1);
			search.setPageSize(8);
			
			// 2. 티켓팅 리스트 가져오기
			Map<String, Object> map = ticketingService.getTicketingList(search);
			List<Ticketing> list = (List<Ticketing>)map.get("list");
			
			// 3. 티켓팅한 영화상영 정보를 담을 리스트 생성
			List<String> dateTimeNoList = new ArrayList<String>();
			
			// 4. 티켓팅의 영화상영번호 리스트에 저장
			for(Ticketing t: list) {
				dateTimeNoList.add(t.getDateTimeNo());
			}
			
			// 5. 영화상영번호 중복 제거
			HashSet<String> distinctData = new HashSet<String>(dateTimeNoList);
			dateTimeNoList = new ArrayList<String>(distinctData);
			
			// 6. 중복제거된 영화상영정보의 사이즈가 곧 내가 본 영화의 수
			mySeeMovieCnt = dateTimeNoList.size();
			
			return mySeeMovieCnt;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mySeeMovieCnt;
		
	}

}
