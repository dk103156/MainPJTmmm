package com.mmm.web.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.User;
import com.mmm.service.event.EventService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

@RestController
@RequestMapping("/customer/*")
public class CustomerRestController {

	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	public CustomerRestController(){
		System.out.println(this.getClass());
	}
	

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="json/uploadImage")
	public String uploadImage(@RequestParam("file") MultipartFile file) {
			
		String fileName="";
		String url="";
		
		try {
			
			fileName = boardService.saveImage(file);
			
			url = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image" + fileName;
			
		}catch(Exception e) {
				e.printStackTrace();
			}
		
		return fileName;
	}
	
	
	@RequestMapping(value="json/getAskList", method=RequestMethod.POST)
	public Map<String,Object> getAskList(@RequestBody Map<String, Object> map, HttpSession session) throws Exception {
		
		System.out.println("customer/json/getAskList");
		User user = (User)session.getAttribute("user");
		
		Search search = new Search();
		if((boolean)map.get("currentPage").equals("0")) {
			search.setCurrentPage(1);
		}else {
			search.setCurrentPage(Integer.parseInt((String)map.get("currentPage")));
		}
		
		search.setCategory(Integer.parseInt((String)map.get("category"))); 
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		map =boardService.getArticleList(search);
		List<Article> list =  (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("askList", list);
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
		
		
	}
}
