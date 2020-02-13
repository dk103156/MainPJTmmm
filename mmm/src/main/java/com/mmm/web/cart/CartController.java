package com.mmm.web.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.mmm.common.Search;
import com.mmm.service.cart.CartService;
import com.mmm.service.cart.impl.CartServiceImpl;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.User;
import com.mmm.service.inven.impl.InvenServiceImpl;
import com.mmm.service.product.ProductService;
import com.mmm.service.product.impl.ProductServiceImpl;
import com.mmm.service.purchase.impl.PurchaseServiceImpl;

//==> 구매관리 Controller
@Controller
@RequestMapping("/cart/*")

public class CartController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	
	public CartController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//장바구니 추가
	@RequestMapping(value="addCart" , method=RequestMethod.GET)
	public String addCart(@ModelAttribute("cart")Cart cart ,  @RequestParam("prodNo")int prodNo , @RequestParam("quantity")int quantity, Model model,HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("/cart/addCart : GET");
		
		System.out.println("받아온 quantity는? ->"+ quantity);
		
		System.out.println("받아온 prodNo는? ->"+ prodNo);
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("jhhhojojo->"+session.getAttribute("user"));
		
		
		cart.setCartUser(user.getUserNo());
		cart.setProduct(productService.getProduct(prodNo));
		
		
		cartService.addCart(cart);
		
		System.out.println("addCart ->"+ cart);
		System.out.println("cartService.addCart에 담긴 cart ->"+cart);
		
		
		
		System.out.println("forward:/product/getProduct 로 갑니당!");

		return "forward:/product/getProduct?prodNo="+prodNo;
		
	}
	
	@RequestMapping(value="getCartList")
	public String getCartList(@ModelAttribute("cart") Cart cart , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/cart/getCartList : GET / POST");
		
		Map<String , Object> map = cartService.getCartList(cart);
		
		model.addAttribute("list", map.get("list"));
		
		System.out.println("getCartList.jsp로 갑니당!");
	
		
		
		return "forward:/cart/getCartList.jsp";
	}
	
	@RequestMapping(value="deleteCart",method=RequestMethod.DELETE)
	public String deleteCart(@ModelAttribute("cart") Cart cart) throws Exception {
		
		System.out.println("/cart/deleteCart : DELETE ");
		
		cartService.deleteCart(cart);
		
		System.out.println("getCartList.jsp로 갑니당!");
	
		
		
		return "forward:/cart/getCartList.jsp";
	}
	
	
}
