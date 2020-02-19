package com.mmm.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	public ProductRestController(){
		System.out.println(this.getClass());
	}	
	
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	@RequestMapping( value="json/getProduct", method=RequestMethod.POST)
	public Product getMovieList(@RequestBody Map<String, Object> map ) throws Exception {
		
	
		int prodNo = (int) map.get("prodNo");
		
		
		return productService.getProduct(prodNo);
		
	}
	
}
