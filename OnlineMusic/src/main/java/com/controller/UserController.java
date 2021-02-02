package com.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.ProductDao;
import com.model.Order;
import com.model.OrderDetail;
import com.model.Product;
import com.model.ShippingInfo;
import com.model.User;
import com.service.OrderDetailService;
import com.service.OrderService;
import com.service.ProductService;
import com.service.UserService;

@RestController
@RequestMapping
public class UserController {
	// key product, value quantity
	HashMap<Product, Integer> cartDetail = new HashMap<Product, Integer>();
	List<Product> productList = new ArrayList<Product>();
	List<User> userList = new ArrayList<User>();
	List<ShippingInfo> shipping = new ArrayList<ShippingInfo>();
	

	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;

	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private OrderService orderService;


	@GetMapping("/chefviv-music")
	public ModelAndView welcomePage() {
		ModelAndView mv = new ModelAndView("welcome");
		return mv;
	}

	@GetMapping("/registration")
	public ModelAndView getRegistration() {
		ModelAndView mv = new ModelAndView("registration-form");
		return mv;
	}

	@PostMapping("/registration")
	public ModelAndView registration(@ModelAttribute("user") User user, @RequestParam String username, HttpSession session) {
		userService.addUser(user);
		ModelAndView mv = new ModelAndView("redirect:/login");
		session.setAttribute("regi", "You registered successfully!");
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView getLogin(@ModelAttribute("user") User user, ModelMap model) {
		ModelAndView mv = new ModelAndView("login-form");
		mv.addObject("user", user);
		return mv;
	}

	@PostMapping("/login")
	public ModelAndView loginAdmin(HttpSession session, User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		ModelAndView mv1 = new ModelAndView("login-form");
		if (userService.vaildlogin(username, password)) {
			User currUser = userService.findUserByName(username);
			if (currUser.getRole().equals("user")) {
				session.setAttribute("username", username);
				session.setAttribute("cartDetail", cartDetail);
				session.setAttribute("user", currUser);
				ModelAndView mv = new ModelAndView("redirect:/products");
				return mv;
			}
		}
		mv1.addObject("headerMessage", "Your username or password is incorrect, please try again.");
		return mv1;
	}

	@GetMapping("/products")
	public ModelAndView showProducts(HttpSession session) {
		productList = productService.findAllProduct();
		ModelAndView mv = new ModelAndView("product-list");
		mv.addObject("products", productList);
		User user = (User) session.getAttribute("user");
		mv.addObject("user", user);
		return mv;
	}
	@GetMapping("/product-detail/{product.id}")	
	public ModelAndView showProductDetail(HttpSession session,@PathVariable("product.id") int id) {
		Optional<Product> optionalProduct = productService.getProductById(id);
		Product product = optionalProduct.get();
		ModelAndView mv = new ModelAndView("product-detail");
		mv.addObject("product",product);
		return mv;
	}

	@GetMapping("/order/{product.id}")
	public ModelAndView orderPage(HttpSession session, @PathVariable("product.id") int id) {
		ModelAndView mv = new ModelAndView("redirect:/login");
		mv.addObject("message", "Please login first!");
		if(session.getAttribute("user")!=null) {
			Optional<Product> optionalProduct = productService.getProductById(id);
			Product product = optionalProduct.get();
			cartDetail.put(product, cartDetail.containsKey(product) ? cartDetail.get(product) + 1 : 1);
			ModelAndView mv1 = new ModelAndView("redirect:/products");
			return mv1;
		}
		
		return mv;
	}

	@GetMapping("/usercart")
	public ModelAndView showCart(HttpSession session) {
		ModelAndView mv = new ModelAndView("cart");
		mv.addObject("cart", cartDetail);
		User user = (User) session.getAttribute("user");
		mv.addObject("user", user);
		double sum = 0;
		for (Map.Entry<Product, Integer> entry : cartDetail.entrySet()) {
			sum += entry.getKey().getPrice() * entry.getValue();
		}
		mv.addObject("sum", sum);
		session.setAttribute("sum", sum);
		return mv;
	}

	@GetMapping("/clear-cart")
	public ModelAndView clearCart() {
		cartDetail.clear();
		ModelAndView mv = new ModelAndView("redirect:/usercart");
		return mv;

	}

	@GetMapping("/remove-item/{entry.key.id}")
	public ModelAndView removeItemFromCart(@PathVariable("entry.key.id") int id) {
		Optional<Product> optionalProduct = productService.getProductById(id);
		Product product = optionalProduct.get();
		cartDetail.remove(product);
		ModelAndView mv = new ModelAndView("redirect:/usercart");
		return mv;

	}

	@GetMapping("/checkout")
	public ModelAndView checkoutPage(HttpSession session) {
		ModelAndView mv = new ModelAndView("checkout");
		return mv;

	}

	@PostMapping("/checkout")
	public ModelAndView checkout(HttpSession session, @ModelAttribute("ship") ShippingInfo ship) {
		ModelAndView mv = new ModelAndView("redirect:/deal");
		mv.addObject("ship", ship);
		session.setAttribute("ship", ship);
		return mv;

	}

	@GetMapping("/deal")
	public ModelAndView getReceipt(HttpSession session) {
		ModelAndView mv = new ModelAndView("receipt");

		mv.addObject("cart", cartDetail);
		return mv;

	}

	@PostMapping("/deal")
	public ModelAndView sendOrderData(HttpSession session) {
		Order order = new Order();
		User user = userService.findUserByName((String) session.getAttribute("username"));
		order.setUser(user);
		order.setGrandPrice((double) session.getAttribute("sum"));
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		order.setDate(date);

		orderService.addOrder(order);
		for (Map.Entry<Product, Integer> entry : cartDetail.entrySet()) {
			OrderDetail od = new OrderDetail();
			od.setProductId(entry.getKey().getId());
			od.setQuantity(entry.getValue());
			od.setOrder(order);
			orderDetailService.addOrderDetail(od);
		}
		cartDetail.clear();
		ModelAndView mv = new ModelAndView("redirect:/order-success");
		return mv;
	}
	
	@GetMapping("/order-success")
	public ModelAndView getOrderSucess(HttpSession session) {
		ModelAndView mv = new ModelAndView("order-success");
		return mv;

	}
	@GetMapping("/result")
	public ModelAndView pageEntries(HttpSession session , @RequestParam String entries) {
		ModelAndView mv = new ModelAndView("result");
		mv.addObject("entries", entries);		
		return mv;

	}
	
	@PostMapping("/result")
	public ModelAndView getPageEntries(HttpSession session ) {
		ModelAndView mv = new ModelAndView("result");
		productList = productService.findAllProduct();
		mv.addObject("products",productList);
		return mv;

	}
	
	@GetMapping("/search")
	public ModelAndView searchPage(HttpSession session , @RequestParam String searchName) {
		ModelAndView mv = new ModelAndView("search");
		mv.addObject("searchName", searchName);
		return mv;

	}
	
	@PostMapping("/search")
	public ModelAndView getSerach(HttpSession session ) {
		ModelAndView mv = new ModelAndView("search");
		productList = productService.findAllProduct();
		mv.addObject("products",productList);
		return mv;

	}
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("welcome");
		return mv;

	}
	
	
	

}
