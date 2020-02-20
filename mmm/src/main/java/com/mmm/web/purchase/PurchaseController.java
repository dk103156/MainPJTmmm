package com.mmm.web.purchase;


import java.sql.Timestamp;
import java.util.Date;

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

import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.inventory.InventoryService;
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
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	@Autowired
	@Qualifier("inventoryServiceImpl")
	private InventoryService invenService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	//직접 구매 하는 경우
	@RequestMapping(value="addPurchaseOne", method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("/purchase/addPurchaseOne");
		
		User user = (User) request.getSession().getAttribute("user");
		
		purchase.setPurchaseUserNo(user.getUserNo());
		purchase.setPurchaseDate(new Timestamp(new Date().getTime()));
		
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/test.jsp";
	}
	
	@RequestMapping(value="addPurchase" , method=RequestMethod.GET)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase, @RequestParam("quantity")String quantity ,@RequestParam(value="prodNo") int prodNo,  HttpServletRequest request,Model model)throws Exception{
		
		
		System.out.println("/purchase/addPurchase : GET");
		User user = (User) request.getSession().getAttribute("user");
		
		System.out.println(purchase);
		System.out.println("받아온 userNo는? ->"+ user);
		System.out.println("받아온 prodNo는? ->"+ prodNo);
		
		Product product = new Product();
		product = productService.getProduct(prodNo);
		
		purchase.setPurchaseProductQuantity(quantity);
		purchase.setPurchaseUserNo(user.getUserNo());
		
		System.out.println("oioijfowjiofw->"+productService.getProduct(prodNo));
		
		System.out.println("forward:/purchase/addPurchase 로 갑니당!");
		
		return "forward:/purchase/addPurchase.jsp?prodNo="+prodNo;
	}
	
	@RequestMapping(value="addPurchase" , method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase, @ModelAttribute("ticketing") Ticketing ticketing, HttpServletRequest request, Model model)throws Exception{
		
		System.out.println("예매 정보 전부 넘어왔나요? : \n"+ticketing);
		User user = (User) request.getSession().getAttribute("user");
		
		System.out.println(purchase);
		System.out.println(user.getUserNo());
		purchase.setPurchaseUserNo(user.getUserNo());
		purchase.setPurchaseDate(new Timestamp(new Date().getTime()));
		
		model.addAttribute("purchase",purchase);
		
		 purchaseService.addPurchase(purchase);
		
		return "forward:/purchase/test.jsp";
	}
	
}
