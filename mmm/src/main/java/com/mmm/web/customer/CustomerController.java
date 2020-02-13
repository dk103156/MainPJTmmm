package com.mmm.web.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public CustomerController() {}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	//공지사항===========================================================================
	
	@RequestMapping(value="addNoticeAd", method=RequestMethod.GET)
	public String getAddNoticeAd(HttpSession session) {
		System.out.println("/customer/addNoticeAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		return "forward:/customer/addNoticeAd.jsp";
	}
	
	
	@RequestMapping(value="addNoticeAd", method=RequestMethod.POST)
	public String PostAddNoticeAd(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addNoticeAd : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); //공지사항은 어드민이 글쓴이
		article.setArticleType(2); // 공지사항
		System.out.println("addNoticeAd에서 article>>" + article);
		boardService.addArtice(article);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getNotice.jsp";
	}
	
	@RequestMapping(value="deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteContact : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(2);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/customer/getNoticeList.jsp";
	}
	
	
	@RequestMapping(value="getNotice", method=RequestMethod.GET)
	public String getNotice(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getNotice : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getNotice] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		System.out.println(date);
		article.setArticleDate(date);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getNotice.jsp";
	}
	
	
	@RequestMapping(value="getNoticeList")
	public String getNoticeList(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/customer/getNoticeList:GET");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(2);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/customer/getNoticeList.jsp";
	}
	
	//===========================================================================공지사항 끝
	
	//일대일문의===========================================================================
	
	@RequestMapping(value="addContact", method=RequestMethod.GET)
	public String getAddContact(HttpSession session, Model model) {
		System.out.println("/customer/addContactAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		model.addAttribute("user", user);
		
		return "forward:/customer/addContact.jsp";
	}
	
	
	
	@RequestMapping(value="addContact", method=RequestMethod.POST)
	public String PostAddContact(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addContact : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); 
		article.setArticleType(1); // 
		System.out.println("addContact에서 article>>" + article);
		boardService.addArtice(article);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getContact.jsp";
	}
	
	@RequestMapping(value="deleteContact", method=RequestMethod.GET)
	public String deleteContact(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteContact : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(1);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/customer/getContactList.jsp";
	}
	
	@RequestMapping(value="getContact", method=RequestMethod.GET)
	public String getContact(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getContact : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getAsk] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String writerId = article.getUserId();
		User writer = userService.getUserId(writerId);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		System.out.println(date);
		article.setArticleDate(date);
		
		model.addAttribute("article", article);
		model.addAttribute("writer", writer);
		
		
		return "forward:/customer/getContact.jsp";
	}
	
	
	@RequestMapping(value="getContactList")
	public String getContactList(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/customer/getContactList");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(1);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/customer/getContactList.jsp";
	}
	
	//===========================================================================일대일문의 끝
	//자주찾는질문===========================================================================

	@RequestMapping(value="addAskAd", method=RequestMethod.GET)
	public String getAddAskAd(HttpSession session) {
		System.out.println("/customer/addAskAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		return "forward:/customer/addAskAd.jsp";
	}
	
	
	
	@RequestMapping(value="addAskAd", method=RequestMethod.POST)
	public String PostAddAskAd(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addNoticeAd : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); //공지사항은 어드민이 글쓴이
		article.setArticleType(3); // 
		System.out.println("addNoticeAd에서 article>>" + article);
		boardService.addArtice(article);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getAsk.jsp";
	}
	
	@RequestMapping(value="deleteAsk", method=RequestMethod.GET)
	public String deleteAsk(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteAsk : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/customer/getAskList.jsp";
	}
	
	@RequestMapping(value="getAsk", method=RequestMethod.GET)
	public String getAsk(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getAsk : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getAsk] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		System.out.println(date);
		article.setArticleDate(date);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getAsk.jsp";
	}
	
	
	@RequestMapping(value="getAskList")
	public String getAskList(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/customer/getAskList");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/customer/getAskList.jsp";
	}
	
	//==========================================================================자주찾는질문 끝

}
