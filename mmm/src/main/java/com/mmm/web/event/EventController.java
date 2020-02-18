package com.mmm.web.event;

import java.awt.Event;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.domain.User;
import com.mmm.service.event.EventService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	//Field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("dateTimeServiceImpl")
	private DateTimeService dateTimeService;

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	
	//private PointService pointService;

	public EventController() {
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	//@Scheduled(cron = "*/10 * * * * *")
	public void test() throws Exception{
		
		Preview pre = eventService.getPreview(10008);
		Timestamp et = pre.getPreviewEndDate();
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		System.out.println(et);
		
		int com = ts.compareTo(et);
		
		if(com>0) { //현재 날짜가 응모 종료일 이후인 경우
			System.out.println("a");
		}else if(com<0) { //현재 날짜가 응모 종료일 이전인 경우
			System.out.println("b");
		}else { //현재 날짜가 응모  종료일인 경우 (추첨돌리기)
			System.out.println("c");
		}

		System.out.println( " Timestamp : " + ts); //현재시간
		
	}
	
	

	//@Scheduled(cron = "*/10 * * * * *")
	public void testGetWin() throws Exception{
		
		List<Integer> preList = new ArrayList();
		
		
	}
	
	@RequestMapping(value="attendance", method=RequestMethod.GET)
	public String attendance() throws Exception{ 
		System.out.println("/event/attendance : GET");
		return "redirect:/event/addAttendance.jsp";
	}

	@RequestMapping(value="addPreviewAd", method=RequestMethod.GET)
	public String addPreviewAdView(Model model) throws Exception{ 
		System.out.println("/event/addPreviewAd:GET");
		System.out.println("dateTimeService.getTheaterList(new Search())>>>"+dateTimeService.getTheaterList(new Search()));
		model.addAttribute("getTheaterList", dateTimeService.getTheaterList(new Search()));
		return "forward:/event/addPreviewAd.jsp";
	}
	
	
	@RequestMapping(value="addPreviewAd", method=RequestMethod.POST)
	public String addPreviewAd(@RequestParam Map<String, Object> map,@RequestParam("previewImage") MultipartFile[] file, Model model) throws Exception {
		System.out.println("/event/addPreviewAd:POST");
		System.out.println(map);
	
		
		String filesName =System.currentTimeMillis()+"";
		List<String> fn = new ArrayList();
		
		
		Preview preview2 = new Preview();
		
		preview2.setPreviewName((String)map.get("previewName"));
		preview2.setPreviewPlace((String)map.get("previewPlace"));
		
		
		String previewDate = (String)map.get("previewDate")+" "+(String)map.get("previewHH")+":"+(String)map.get("previewMM");
		preview2.setPreviewDate(JavaUtil.ymdhmToTimestamp(previewDate));
		
		
		//preview2.setPreviewTime(JavaUtil.hmToTimestamp(previewTime));
		
		//preview2.setPreviewImage((String)map.get("previewImage"));
		preview2.setPreviewStartDate(JavaUtil.ymdToTimestamp((String)map.get("previewStartDate")));
		preview2.setPreviewEndDate(JavaUtil.ymdToTimestamp((String)map.get("previewEndDate")));
		preview2.setWinnerDate(JavaUtil.ymdToTimestamp((String)map.get("winnerDate")));
		preview2.setWinnerCount(Integer.parseInt((String)map.get("winnerCount")));
		
		String saveName = "";
		if(file!=null) {
			if(file.length>1) {
				System.out.println("길이가 1보다 크면 ");
				for(int i=0; i<file.length; i++) {
				
					saveName += saveFile(file[i])+",";
				}
			}else if(file.length==1) {
				System.out.println("길이가 1보다 작으면 ");
					saveName = saveFile(file[0]);
			}
			System.out.println(saveName);
			preview2.setPreviewImage(saveName);
		}
		
		String[] fileArr = saveName.split(",");
		
		model.addAttribute("fileArr", fileArr);

		eventService.addPreviewAd(preview2);
		model.addAttribute("preview", preview2);
	
		
		return "forward:/event/getPreviewAd.jsp";
	}
	
	
	@RequestMapping(value="getPreviewListAd")
	public String getPreviewListAd(@ModelAttribute("search") Search search , Model model) throws Exception {
	
		System.out.println("/event/getPreviewListAd:GET");
		//search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		//search.setCurrentPage(2);
		search.setPageSize(pageSize);
		
		Map<String, Object> map = eventService.getPreviewListAd(search);
		List<Preview> list = (List<Preview>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		//String[] fileArr = preview.getPreviewImage();
		//model.addAttribute("fileArr", fileArr);
		
		return "forward:/event/getPreviewListAd.jsp";
	}
		
	
	
	
	@RequestMapping(value="getPreviewAd")
	public String getPreviewAd(@RequestParam int previewNo, Model model) throws Exception{
		System.out.println("/event/getPreviewAd:GET");
		Preview preview = eventService.getPreviewAd(previewNo);
		model.addAttribute("preview" , preview);
		String[] fileArr = preview.getPreviewImage().split(",");
		model.addAttribute("fileArr", fileArr);
		return "forward:/event/getPreviewAd.jsp";
	}
	
	
	
	@RequestMapping(value="updatePreviewAd", method=RequestMethod.GET)
	public String updatePreviewAdView(@RequestParam int previewNo, Model model) throws Exception{
		System.out.println("/event/updatePreviewAd:GET");
		System.out.println("updatePreviewAd:previewNo>>>" + previewNo);
		Preview preview = eventService.getPreviewAd(previewNo);
		String hour = preview.getPreviewTime().substring(0, 2);
		String min = preview.getPreviewTime().substring(3, 5);
		String[] fileArr = preview.getPreviewImage().split(",");

		System.out.println("dateTimeService.getTheaterList(new Search())>>>"+dateTimeService.getTheaterList(new Search()));
		model.addAttribute("getTheaterList", dateTimeService.getTheaterList(new Search()));
		model.addAttribute("preview" , preview);
		model.addAttribute("fileArr", fileArr);

		model.addAttribute("hour", hour);
		model.addAttribute("min", min);
		return "forward:/event/updatePreviewAd.jsp";
	}
	
	
	
	@RequestMapping(value="updatePreviewAd", method=RequestMethod.POST)
	public String updatePreviewAd(@RequestParam Map<String, Object> map,@RequestParam("previewImage") MultipartFile[] file, Model model) throws Exception{
		System.out.println("/event/updatePreviewAd:POST");
		System.out.println(map);
	
		
		String filesName =System.currentTimeMillis()+"";
		List<String> fn = new ArrayList();
		
		
		Preview preview2 = new Preview();
		
		preview2.setPreviewNo(Integer.parseInt((String)map.get("previewNo")));
		preview2.setPreviewName((String)map.get("previewName"));
		preview2.setPreviewPlace((String)map.get("previewPlace"));
		
		
		String previewDate = (String)map.get("previewDate")+" "+(String)map.get("previewHH")+":"+(String)map.get("previewMM");
		preview2.setPreviewDate(JavaUtil.ymdhmToTimestamp(previewDate));
		
		
		//preview2.setPreviewTime(JavaUtil.hmToTimestamp(previewTime));
		
		//preview2.setPreviewImage((String)map.get("previewImage"));
		preview2.setPreviewStartDate(JavaUtil.ymdToTimestamp((String)map.get("previewStartDate")));
		preview2.setPreviewEndDate(JavaUtil.ymdToTimestamp((String)map.get("previewEndDate")));
		preview2.setWinnerDate(JavaUtil.ymdToTimestamp((String)map.get("winnerDate")));
		preview2.setWinnerCount(Integer.parseInt((String)map.get("winnerCount")));
		
		String saveName = "";
		
		if(file!=null) {
			if(file.length>1) {
				System.out.println("길이가 1보다 크면 ");
				for(int i=0; i<file.length; i++) {
				
					saveName += saveFile(file[i])+",";
				}
			}else if(file.length==1) {
				System.out.println("길이가 1보다 작으면 ");
					saveName = saveFile(file[0]);
			}
			System.out.println(saveName);
			preview2.setPreviewImage(saveName);
		}
		
			String[] fileArr = saveName.split(",");
			model.addAttribute("fileArr", fileArr);

			eventService.updatePreviewAd(preview2);
			model.addAttribute("preview", preview2);
			
		return "forward:/event/getPreviewAd.jsp";
	}
	
	
	
	@RequestMapping(value="getPreviewList")
	public String getPreviewList(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("프리뷰리스트와따!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		String[] fileArr = null;
		List<String[]> fileNameArr = new ArrayList<>();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		System.out.println("search에 flag잘 담겨와??????????"+search);
		Map<String, Object> map = eventService.getPreviewList(search);
		List<Preview> list = (List<Preview>)map.get("list");
		System.out.println("#################카운트"+(Integer)map.get("totalCount"));
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Preview preview : list) {
			 fileArr = preview.getPreviewImage().split(",");
			 fileNameArr.add(fileArr);
		}
		System.out.println("fileNameArr>>>>>>>>>>>>>>>"+fileNameArr);
		
		model.addAttribute("fileNameArr", fileNameArr);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/event/getPreviewList.jsp";
	}
	
	
	//getPreview 이거 근데 restController 가야할것같음===>나중에..
	@RequestMapping(value="getPreview", method=RequestMethod.GET)
	public String getPreview(@RequestParam int previewNo, Model model) throws Exception{
		System.out.println("/event/getPreview:GET");
		Preview preview = eventService.getPreviewAd(previewNo);
		
		model.addAttribute("preview" , preview);
		String[] fileArr = preview.getPreviewImage().split(",");
		model.addAttribute("fileArr", fileArr);
		return "forward:/event/getPreviewAd";
	}
		
	
	
	//addPartPrev.jsp 응모페이지 띄워주는거
	@RequestMapping(value="addPartPrev", method=RequestMethod.GET)
	public String addPartPrevView(@RequestParam int previewNo, HttpSession session, Model model) throws Exception{
		
		System.out.println("/event/addPartPrev:GET");
		System.out.println("eventController에서 addPartPrev>>>>>>>>>>>previewNo"+previewNo);
		
		Preview preview = eventService.getPreview(previewNo);
		User user = (User)session.getAttribute("user");
		
		
		
		String[] fileArr = preview.getPreviewImage().split(",");
		
		model.addAttribute("preview", preview);
		model.addAttribute("user", user);
		model.addAttribute("fileArr", fileArr);
		
		return "forward:/event/addPartPrev.jsp";
	}
	
	
	//응모하기 버튼 눌렀을 시 리얼 데이터 들어가는거
	@RequestMapping(value="addPartPrev", method=RequestMethod.POST)
	public String addPartPrev(@ModelAttribute("participation") Participation participation, Model model) throws Exception{
		System.out.println("/event/addPartPrev:POST");
		eventService.addPartPrev(participation);
		participation = eventService.getParticiation(participation.getPartNo());
//		model.addAttribute("participation", participation); 
		return "forward:/event/getPreviewList"; 
	}
	
	
	@RequestMapping(value="deletePreview", method=RequestMethod.POST)
	public String deletePreviewAd(@RequestParam int previewNo) throws Exception{
		System.out.println("/event/deletePreview:POST");
		System.out.println("삭제할 previewNo: " + previewNo);
		eventService.deletePreview(previewNo);
		return "redirect:/event/getListPreviewAd.jsp";
	} 
	

	
	
	
	//getWinnerList
	@RequestMapping(value="getWinnerList", method=RequestMethod.POST)
	public String getWinnerListPost(@RequestParam int previewNo, Model model) throws Exception {
		System.out.println("/event/getWinnerList");
		Map<String, Object> map = eventService.getWinnerList(previewNo);
		Preview preview = eventService.getPreviewAd(previewNo);
		List<Participation> list = (List<Participation>)map.get("list");
		
		//나중에 userServiceImpl 주입받으면 getUser로 유저정보 가져오기
		System.out.println("<<<<<<<getWinnerList>>>>>");
		for(Participation p : list) {
			System.out.println("참여자:::::::"+p.getUserNo());
		}
		
		model.addAttribute("list",list);
		model.addAttribute("preview", preview);
		
		return "forward:/event/getWinnerList.jsp";
	}
	
	
	@RequestMapping(value="addQuizAd", method=RequestMethod.GET)
	public String addQuizAdView() {
		System.out.println("/event/addQuizAd:GET");
		return "redirect:/event/addQuizAd.jsp";
	}
	
	
	@RequestMapping(value="addQuizAd", method=RequestMethod.POST)
	public String addQuizAd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("/event/addQuizAd:POST");
		Quiz quiz = new Quiz();
		
		quiz.setQuestion((String)map.get("question"));
		quiz.setOptionFirst((String)map.get("optionFirst"));
		quiz.setOptionSecond((String)map.get("optionSecond"));
		quiz.setOptionThird((String)map.get("optionThird"));
		quiz.setOptionFourth((String)map.get("optionFourth"));
		quiz.setAnswer(Integer.parseInt((String)map.get("answer")));
		quiz.setQuizStartDate(JavaUtil.ymdToTimestamp((String)map.get("quizStartDate")));
		quiz.setQuizEndDate(JavaUtil.ymdToTimestamp((String)map.get("quizEndDate")));
		
	
		eventService.addQuizAd(quiz);
		model.addAttribute("quiz", quiz);
		return "forward:/event/getQuizAd.jsp";
	}
	
	
	//getQuizListAd
	@RequestMapping(value="getQuizListAd")
	public String getQuizListAd(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/event/getQuizListAd");
		System.out.println("getQuizListAd의 search>>>>>>>>>>>>>>"+search);
		System.out.println(">>>>>>>>currentPage입니다:"+ search.getCurrentPage());
		//search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = eventService.getQuizListAd(search);
		List<Preview> list = (List<Preview>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/event/getQuizListAd.jsp";
	}
	

	@RequestMapping(value="getQuizList")
	public String getQuizList(@ModelAttribute("search") Search search, HttpSession session ,Model model) throws Exception{
		System.out.println("/event/getQuizList");
		System.out.println("getQuizList의 search>>>>>>>>>>>>>>"+search);
		System.out.println(">>>>>>>>currentPage입니다:"+ search.getCurrentPage());
		
		
		double totalCount = 0;
		double winCount = 0;
		double winRate = 0;
		  
		
		//search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = eventService.getQuizListAd(search);
		List<Quiz> list = (List<Quiz>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage>>>>>>>>>>"+resultPage);
		
		User user = (User)session.getAttribute("user");
		System.out.println(user+">>>>>>>>>>>>>>>>>>>>>>>");
		int userNo = user.getUserNo();
		
		Participation participation = eventService.getQuizRecord(userNo);
		System.out.println(user);
		
		if(participation!=null) {
			 totalCount = participation.getTotalQuizCount();
			 winCount = participation.getWinQuizCount();
			 winRate = (winCount/totalCount)*100;
		}
		
		//참여여부를 알기위해...
				Map<String,Object> partMap = new HashMap<String,Object>();
				List<Quiz> returnList = new ArrayList<Quiz>();
				
		for(Quiz quiz: list) {
			
			partMap.put("userNo", userNo);
			partMap.put("quizNo", quiz.getQuizNo());
			System.out.println("partMap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+partMap);
			
			
			int partFlag = eventService.checkQuiz(partMap);
			System.out.println("참여했는지???참여했으면1, 아니면0"+ partFlag);
			quiz.setPartFlag(partFlag);
			returnList.add(quiz);
		}
		
		int leftQuiz= resultPage.getTotalCount()-(int)totalCount;
		System.out.println("파트플래그잘들어갔니????"+returnList);
		model.addAttribute("totalCount", (int)totalCount);
		model.addAttribute("winCount", (int)winCount);
		model.addAttribute("winRate", winRate);
		model.addAttribute("user", user);
		model.addAttribute("list",returnList);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("leftQuiz", leftQuiz);
		
		
		return "forward:/event/getQuizList.jsp";
	}
	
	
	@RequestMapping(value="getQuizAd", method=RequestMethod.GET)
	public String getQuizAd(@ModelAttribute("quiz") Quiz quiz, Model model) throws Exception {
		System.out.println("/event/getQuizAd:GET");
		quiz = eventService.getQuizAd(quiz.getQuizNo());
		model.addAttribute("quiz", quiz);
		return "forward:/event/getQuizAd.jsp";
	}
	
	
	@RequestMapping(value="updateQuizAd", method=RequestMethod.GET)
	public String updateQuizAdView(@RequestParam int quizNo, Model model) throws Exception {
		System.out.println("/event/updateQuizAd:GET");
		System.out.println("quizNo==>"+ quizNo);
		Quiz quiz = eventService.getQuizAd(quizNo);
		model.addAttribute("quiz", quiz);
		return "forward:/event/updateQuizAd.jsp";
	}
	
	
	@RequestMapping(value="updateQuizAd", method=RequestMethod.POST)
	public String updateQuizAd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("/event/updateQuizAd:POST");
		Quiz quiz = new Quiz();
		quiz.setQuizNo(Integer.parseInt((String)map.get("quizNo")));
		quiz.setQuestion((String)map.get("question"));
		quiz.setOptionFirst((String)map.get("optionFirst"));
		quiz.setOptionSecond((String)map.get("optionSecond"));
		quiz.setOptionThird((String)map.get("optionThird"));
		quiz.setOptionFourth((String)map.get("optionFourth"));
		quiz.setAnswer(Integer.parseInt((String)map.get("answer")));
		quiz.setQuizStartDate(JavaUtil.ymdToTimestamp((String)map.get("quizStartDate")));
		quiz.setQuizEndDate(JavaUtil.ymdToTimestamp((String)map.get("quizEndDate")));
		
		eventService.updateQuizAd(quiz);
		model.addAttribute("quiz", quiz);
		return "forward:/event/getQuizAd.jsp";
	}

	@RequestMapping(value="addPartQuiz", method=RequestMethod.GET)
	public String addPartQuizView(@RequestParam int quizNo, HttpSession session,  Model model) throws Exception{
		
		System.out.println("/event/addPartQuiz:GET");
		Quiz quiz = eventService.getQuizAd(quizNo);
		System.out.println(">>>>>>>>>>>>>>>>>컨트롤러>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>quiz::::::::::"+quiz);
		
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		Participation participation = eventService.getQuizRecord(userNo);
		
		//참여여부를 알기위해...
		Map<String,Object> partMap = new HashMap<String,Object>();
		partMap.put("userNo", userNo);
		partMap.put("quizNo", quiz.getQuizNo());
		System.out.println("partMap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+partMap);
		
		int partFlag = eventService.checkQuiz(partMap);
		System.out.println("참여했는지???참여했으면1, 아니면0"+ partFlag);
		
		if(participation!=null) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>컨트롤러 participation:::"+ participation);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>컨트롤러>>>>>>>>>user"+user);
		double totalCount = participation.getTotalQuizCount();
		double winCount = participation.getWinQuizCount();
		double winRate = (winCount / totalCount)*100;
		System.out.println("totalCount:"+totalCount+"winCount:"+winCount);
		model.addAttribute("quiz", quiz);
		model.addAttribute("totalCount", (int)totalCount);
		model.addAttribute("winCount", (int)winCount);
		model.addAttribute("winRate", winRate);
		model.addAttribute("user", user);
		model.addAttribute("partFlag", partFlag);
		}else {
			
			model.addAttribute("quiz", quiz);
			model.addAttribute("totalCount", 0);
			model.addAttribute("winCount", 0);
			model.addAttribute("winRate", 0.0);
			model.addAttribute("user", user);
			model.addAttribute("partFlag", partFlag);
		}
		
		
		return "forward:/event/addPartQuiz.jsp";
	}
	
	
	//퀴즈제출 버튼 눌렀을 시 리얼 데이터 들어가는거
	@RequestMapping(value="addWinQuiz", method=RequestMethod.POST)
	public String addWinQuiz(@ModelAttribute("participation") Participation participation, Model model) throws Exception{
		
		System.out.println("/event/addWinQuiz");
		System.out.println("######################quizNo::"+participation.getQuizNo());
		System.out.println("궁금하다고!!!!!!!!!!!!!"+participation.getUserNo());
		eventService.addPartQuiz(participation);
		Map<String, Object> updateMap = new HashMap<String,Object>();

		Point point = new Point();
		point.setPointStatus("S2");
		point.setUserNo(participation.getUserNo());
		point.setPartPoint(5);
		
	
		System.out.println("point>>>>>>>>>"+point);
		
		paymentService.savePoint(point);
		
		
		
		updateMap.put("user", participation.getUserNo());
		updateMap.put("quizNo", participation.getQuizNo());
		
		System.out.println("userService.getUser(participation.getUserNo())"+userService.getUser(participation.getUserNo()));
		eventService.updateQuizFlag(updateMap);
		
		model.addAttribute("participation", participation); 
		model.addAttribute("user",userService.getUser(participation.getUserNo()));
		
		return "redirect:/event/getQuizList?userNo="+participation.getUserNo(); 
	}
	
	@RequestMapping(value="addLoseQuiz", method=RequestMethod.POST)
	public String addLoseQuiz(@ModelAttribute("participation") Participation participation, Model model) throws Exception{
		
		System.out.println("/event/addLoseQuiz");
		System.out.println("<<<<<<<<<이벤트컨트롤러 participation>>>>>>"+participation);
		System.out.println("######################quizNo::"+participation.getQuizNo());
		System.out.println("<<<<<<<<<<<<<<<<getUser>>>>>>>>>>>>>>>>>>>"+userService.getUser(participation.getUserNo()));
		System.out.println("궁금하다고!!!!!!!!!!!!!"+participation.getUserNo());
		eventService.addPartQuiz(participation);
		model.addAttribute("participation", participation); 
		model.addAttribute("user",userService.getUser(participation.getUserNo()));
	
		return "redirect:/event/getQuizList?userNo="+participation.getUserNo(); 
	}

	@RequestMapping(value="deleteQuizAd", method=RequestMethod.POST)
	public String deleteQuizAd(@ModelAttribute("quiz") Quiz quiz) throws Exception {
		
		System.out.println("/event/deleteQuizAd:POST");
		eventService.deleteQuiz(quiz.getQuizNo());
		return "redirect:/event/getQuizListAd.jsp";
	}
	
	
	
	//Rest를 써버림
	@RequestMapping(value="getApplyList")
	public String getApplyList(@RequestParam int previewNo, Model model) throws Exception{
			
			System.out.println("/event/getApplyList");
			
			Map<String, Object> map = eventService.getApplyList(previewNo);
			List<Participation> list = (List<Participation>)map.get("list");
			
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>/event/getApplyList(previewNo)의 list는 ?"+list);
			
			model.addAttribute("list", list);
			
		 return "forward:/event/getApplyList.jsp";
	}
	
	
	@RequestMapping(value="updateWinningFlag")
	public String updateWinningFlag(@RequestParam Map<String, Object> map, Model model) throws Exception{
			System.out.println("/event/updateWinningFlag");
			int previewNo = (Integer)map.get("previewNo");
			int userNo = (Integer)map.get("userNo");
	
			System.out.println("updateWinningFlag의previewNo"+previewNo);
			System.out.println("updateWinningFlag의userNo"+userNo);
			
			model.addAttribute("previewNo", previewNo);
			model.addAttribute("userNo", userNo);
			
		 return "forward:/event/getApplyList.jsp";
	}
	
	
	
	@RequestMapping(value="getWinner")
	public String getWinner(@RequestParam int previewNo) throws Exception{
			System.out.println("/event/getWinner");
			randWinner(previewNo);
			return "redirect:/event/getPreviewAd?previewNo="+previewNo;
	}
	
	//@Scheduled(cron = "*/10 * * * * *") //매일 12시로 바꾸기
	public void doRandWinner() throws Exception{
		System.out.println("추첨할래!");
		List<Preview> list = eventService.getPrepareRand();
		System.out.println("추첨할 애들이다!!!>>>>>>>"+list);
		
		for(Preview p : list) {
			randWinner(p.getPreviewNo());
		}
	}
	
	//당첨자를 뽑는애 이벤트 종료에 맞춰서 
	public void randWinner(int previewNo) throws Exception {

		Map<String, Object> updateMap = new HashMap<String,Object>();


		Map<String,Object> map = eventService.getApplyList(previewNo); //응모자 리스트
		List<Participation> list = (List<Participation>)map.get("list"); //응모자들의 참여VO 리스트
		System.out.println("이 시사회에 참여VO리스트>>>" + list);
		
		Preview preview = eventService.getPreviewAd(previewNo); //해당 이벤트의 참여수를 가지고 오기 위함
		int winnerCount = preview.getWinnerCount(); //뽑아야할 당첨자 수 
		System.out.println("뽑아야 할 당첨자수는>>>>>>" + winnerCount);

		List<Integer> applyUserNo = new ArrayList<Integer>(); //응모자 아이디 List를 담을것
		for(Participation p: list) { //응모자 아이디 List
			applyUserNo.add((Integer)p.getUserNo()); 
		}
		
		int winner=0;

		ArrayList<Integer> winnerUserNo = new ArrayList<Integer>(); //당첨자 아이디 List를 담을것 
		
		if(applyUserNo.size() < winnerCount) { //뽑을 수보다 덜 지원했다면
			
			System.out.println("응모자가 당첨자보다 적잖아");
			for(Participation p: list) { //응모자 아이디 List를 winnerUserNo에 넣자
				winnerUserNo.add((Integer)p.getUserNo()); 
			}
			
			
		}else if(applyUserNo.size() >= winnerCount) { //더 많이 지원했거나 같다면 (일반적인 경우)
			
			
			while(winnerUserNo.size() < winnerCount) { //당첨자리스트에 담긴 수가 뽑을 사람수보다 적으면 반복해라!
				
				int randomIndex = (int)(Math.random() * applyUserNo.size());
				
				winner = applyUserNo.get(randomIndex);
				
				if(!winnerUserNo.contains(winner)) { //당첨자리스트에 방금 뽑은 애가 들어있지 않은 경우애만
					
					System.out.println("winner??"+ winner);
					winnerUserNo.add(winner); //당첨자리스트에 넣어라
			
				}
				
				System.out.println("winnerUserNo???"+ winnerUserNo);
				
			}
			
		}
		
		System.out.println("winnerUserNo>>>>>>" + winnerUserNo);
		System.out.println("previewNo>>>>>>>" + previewNo);
		
		updateMap.put("userList", winnerUserNo);
		updateMap.put("previewNo", previewNo);

		System.out.println("updateMap>>>>>>>" + updateMap);
		eventService.updateWinningFlag(updateMap);
		
		
	}
	

	//addAttendanceCheck

	private String saveFile(MultipartFile file) {
		
		String filePath = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
		String saveName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		File saveFile = new File(filePath, saveName);
		
		try {
			file.transferTo(saveFile);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
		
	}
	
	
}