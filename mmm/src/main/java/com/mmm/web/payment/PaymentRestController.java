package com.mmm.web.payment;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
@RequestMapping("/payment/*")
public class PaymentRestController {

	///Field
	
	public static final String impKey = "6944686805011226";
	public static final String impSecret = "ZXtPf4IT38iJVVxXvy4CNmejclGC3qu2oYRD2Ax6IQQELnBgWGTK383fuKRxamAzkscn2KtKAjplH0CE";
	public String accessToken;
	
	//외부 Http 연결을 용이하게 하기 위한 template
//	HttpEntity<?> headers;						//Movie와 다르게 없이 사용해보자
	RestTemplate template = new RestTemplate();
	ObjectMapper mapper = new ObjectMapper();
	JSONParser jsonParser = new JSONParser();
	
//	Constructor
	public PaymentRestController() {
		System.out.println(this.getClass()+"   Constructor Call...");
	}
	
//	public void getToken() throws Exception{
//		
//		String url = "https://api.iamport.kr/users/getToken";
//	
////		header 세팅
//		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
//		headerMap.add("Accept", MediaType.APPLICATION_JSON_VALUE);
//		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
////		this.headers = new HttpEntity<>(headerMap);
//		
////		body 세팅__ imp key & secret
//		JSONObject bodyJson = new JSONObject();
//		bodyJson.put("imp_key", impKey);
//		bodyJson.put("imp_secret", impSecret);
//		System.out.println("------------bodyJson  : " + bodyJson);
//		
////		body 와 header 정보 HttpEntity에 넣기
//		HttpEntity<String> request = new HttpEntity<String>(bodyJson.toString() , headerMap);
//		
//		ResponseEntity<String> responseEntity = template.exchange(url, HttpMethod.POST, request, String.class);
//		System.out.println("------------responseEntity  : " + responseEntity);
//		
//		JSONObject jsonObject = (JSONObject) jsonParser.parse(responseEntity.getBody().toString());
//		System.out.println("--------------obj : " + jsonObject);
//		
//		JSONObject response = (JSONObject) jsonObject.get("response");
//		System.out.println("--------------response : " + response);
//		
//		accessToken = response.get("access_token").toString();
//		System.out.println("--------------accessToken : " + accessToken);
//		
//	
//	}
//	
//	
//	@RequestMapping(value = "json/getPaymentInfo", method = RequestMethod.POST)
//	public void getPayinfo(@RequestParam("imp_uid") String impUid )throws Exception{
//		this.getToken();
//		
//		String url = "https://api.iamport.kr/payments/" + impUid;
//		System.out.println("---- url : "+ url);
//		
//		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
//		headerMap.add("Accept", MediaType.APPLICATION_JSON_VALUE);
//		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
//		headerMap.add("Authorization", this.accessToken);
//		HttpEntity<String> request = new HttpEntity<String>(headerMap);
//		
//		ResponseEntity<String> responseEntity = template.exchange(url, HttpMethod.GET, request, String.class);
//		
//		JSONObject jsonObject = (JSONObject) jsonParser.parse(responseEntity.getBody().toString());
//		
//		System.out.println(jsonObject);
//	}
	
	
	
}
