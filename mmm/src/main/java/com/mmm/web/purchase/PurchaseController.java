package com.mmm.web.purchase;

import java.util.ArrayList;
import java.util.List;

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

import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.User;
import com.mmm.service.inven.InvenService;
import com.mmm.service.product.ProductService;
import com.mmm.service.purchase.PurchaseService;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("invenServiceImpl")
	private InvenService invenService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="addPurchase" , method=RequestMethod.GET)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase, @RequestParam("quantity")int quantity ,@RequestParam(value="prodNo") int prodNo,  HttpSession session,Model model)throws Exception{
		
		System.out.println("/purchase/addPurchase : GET");
		
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("jhhhojojo->"+session.getAttribute("user"));
		
		System.out.println("받아온 userNo는? ->"+ user);
		System.out.println("받아온 prodNo는? ->"+ prodNo);
		
		Product product = new Product();
		product = productService.getProduct(prodNo);
		
//		User user =  new User();
//		user = userService.getUser(userNo);
		
		purchase.setPurchaseQuantity(quantity);
		purchase.setPurchaseUser(user.getUserNo());
		purchase.setPurchaseProd(product);
		
		
		System.out.println("oioijfowjiofw->"+productService.getProduct(prodNo));
		
		System.out.println("forward:/purchase/addPurchase 로 갑니당!");
		
		return "forward:/purchase/addPurchase.jsp?prodNo="+prodNo;
	}

	@RequestMapping(value="addPurchase" , method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase,@RequestParam("userNo")int userNo )throws Exception{
		
		System.out.println("/purchase/addPurchase : POST");
		
		System.out.println("받아온 userNo는? ->"+ userNo);
		
		purchaseService.addPurchase(purchase);
		
		System.out.println("forward:/purchase/addPurchase 로 갑니당!");
		
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
}
