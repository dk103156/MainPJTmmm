package com.mmm.web.event;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.Search;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.User;
import com.mmm.service.event.EventService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

@RestController
@RequestMapping("/event/*")
public class EventRestController {

	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	public EventRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="json/getApplyList/{previewNo}", method=RequestMethod.GET)
	public Map<String, Object> getApplyList(@PathVariable int previewNo) throws Exception {
		
		System.out.println("/event/json/getApplyList : GET");
		
		Map<String,Object> map = eventService.getApplyList(previewNo);
		List<Participation> list = (List<Participation>)map.get("list");
		System.out.println("getApplyList 의 list" + list);

//		이거 나중에 userNo로 바뀌면 getUser(userNo)해서 userName 가져와서 list에 담자
//			System.out.println("userName::::" + userService.getUser(userId));
//		
		
		for(Participation p : list) {
			System.out.println(p.getPartDate());
			if(p.getPartStrDate() instanceof String) {
				System.out.println("partStrDate는 스트링");
			}else if(p.getPartDate() instanceof Timestamp ) {
				System.out.println("partDate는 타임스탬프 이시다 ");
			}
			System.out.println(p.getPartStrDate());

		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		
		return returnMap;
	}
	
	@RequestMapping(value="json/getWinnerList/{previewNo}", method=RequestMethod.GET)
	public Map<String, Object> getWinnerList(@PathVariable int previewNo) throws Exception {
		
		System.out.println("/event/json/getWinnerList : GET");
		
		Map<String,Object> map = eventService.getWinnerList(previewNo);
		
		List<Participation> list = (List<Participation>)map.get("list");
		List<User> uList = new ArrayList<User>();
		
		System.out.println("getWinnerList 의 list" + list);
		
		
		for(Participation p : list) {
			System.out.println(p.getPartDate());
			if(p.getPartStrDate() instanceof String) {
				System.out.println("partStrDate는 스트링");
			}else if(p.getPartDate() instanceof Timestamp ) {
				System.out.println("partDate는 타임스탬프 이시다 ");
			}
			System.out.println(p.getPartStrDate());

		
			User user = userService.getUser(p.getUserNo());
			uList.add(user);
		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("uList", uList);
		
		return returnMap;
	}
	
	
	
	
	@RequestMapping(value="json/getPreview", method=RequestMethod.GET)
	public Map<String,Object> getPreview(@RequestBody Preview preview) throws Exception{
		
		System.out.println("/event/json/getPreview : GET");
		Map<String, Object> map = new HashMap<String,Object>();
		
		preview = eventService.getPreview(preview.getPreviewNo());
		String[] fileArr = preview.getPreviewImage().split(",");
		
		map.put("preview", preview);
		map.put("fileArr", fileArr);
		
		return map;
	}
	
	@RequestMapping(value="json/checkPart")
	public Map<String, Object> checkPart(@RequestBody Map<String, Object> map) throws Exception{
		
		System.out.println("eventRestController도착!!!");
		String userNo= (String)map.get("userNo");
		System.out.println("checkPart의 userNo"+userNo);
		
		if(map.get("previewNo")!=null) {
			int previewNo =  Integer.parseInt((String)map.get("previewNo"));
			System.out.println("checkPart의 previewNo"+previewNo);
			map.put("previewNo", previewNo);
		}else if(map.get("quizNo")!=null){
			int quizNo =  Integer.parseInt((String)map.get("quizNo"));
			System.out.println("checkPart의 quizNo"+quizNo);
			map.put("quizNo", quizNo);

		}
		
		map.put("userNo", userNo);
		System.out.println(map);
		
		int result = (int)eventService.checkPart(map);
		System.out.println("result"+result);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);
		
		return returnMap;
		
	}
	
	
	@RequestMapping(value="json/checkQuiz")
	public Map<String, Object> checkQuiz(@RequestBody Map<String, Object> map) throws Exception{
		
		System.out.println("eventRestController도착!!!");
		String userNo= (String)map.get("userNo");
		System.out.println("checkQuiz의 userNo"+userNo);
		int choice = Integer.parseInt((String)map.get("choice"));
		int quizNo= Integer.parseInt((String)map.get("quizNo"));
	    System.out.println("###########################"+quizNo);
	    
	    
		map.put("quizNo", quizNo);     //quizNo를 map에 넣는다
		map.put("userNo", userNo);		//참여자를  map에 넣는다
		map.put("choice", choice);       //선택한걸 map에 넣는다
		System.out.println(map);
		
		
		
		int partCnt = (int)eventService.checkQuiz(map);
		int answer = eventService.getQuizAd(quizNo).getAnswer();
		int result = 0;
		
		if(partCnt > 0) { //이미 참여했다?
			result = 2;
		}else if(partCnt == 0){	//아직 참여한 적 없다
			if(answer==choice) { result = 0;} //답이 같다면?--> 포인트를...적립하자
			else if(answer!=choice) {result = 1;} //다르다면?
		}
		
		System.out.println("result"+result);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);
		returnMap.put("partCnt", partCnt);
		
		return returnMap;
		
	}
	
	
	
}
