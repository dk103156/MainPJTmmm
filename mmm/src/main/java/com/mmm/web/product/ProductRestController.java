package com.mmm.web.product;

import java.sql.Timestamp;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	@Autowired
	@Qualifier("cartServiceImpl")
	CartService cartService;
	
	public ProductRestController(){
		System.out.println(this.getClass());
	}	
	
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	@RequestMapping( value="json/addCart", method=RequestMethod.POST)
	public void addCart(@RequestBody Map<String, Object> map, @ModelAttribute Cart cart ) throws Exception {
		System.out.println("장바구니 추가 시작");
		System.out.println(map);
		String cartUserNo =  (String) map.get("cartUserNo"); 
		String cartProdNo =  (String) map.get("cartProdNo");
		Integer carProdQuantity = (Integer) map.get("cartProdQuantity");
		Long time = (Long) map.get("cartRegDate");
		
		cart.setCartUserNo(Integer.parseInt(cartUserNo));
		cart.setCartProdNo(Integer.parseInt(cartProdNo));
		cart.setCartProdQuantity(carProdQuantity.intValue());
		cart.setCartRegDate(new Timestamp(time));
		
		cartService.addCart(cart);
	}
	
}
