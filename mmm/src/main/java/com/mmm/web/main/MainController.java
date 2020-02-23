package com.mmm.web.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.movie.MovieService;
import com.mmm.service.product.ProductService;

@Controller
@RequestMapping("/main/*")
public class MainController {

	///Field
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService; 
	 
	@Autowired
	@Qualifier("dateTimeServiceImpl")
	private DateTimeService dateTimeService; 	
	
	@Autowired
	@Qualifier("inventoryServiceImpl")
	private InventoryService inventoryService; 		
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService; 	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@RequestMapping(value="", method=RequestMethod.GET) 
	public String mainPage() throws Exception {
		
		
		
		
		return "forward:/main/main.jsp";
	}
}
