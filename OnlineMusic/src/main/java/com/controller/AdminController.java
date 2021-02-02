package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CategoryDao;
import com.model.Category;
import com.model.Product;
import com.model.User;
import com.service.CategoryService;
import com.service.ProductService;
import com.service.UserService;

@RestController
@RequestMapping
public class AdminController {
	
	List<Category> categoryList = new ArrayList<Category>();
	List<Product> productList = new ArrayList<Product>();
	List<User> userList = new ArrayList<User>();
	
	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;
	
	
	@Autowired
	private ProductService productService;

	@GetMapping("/admin")
	public ModelAndView getAdmin() {
		ModelAndView mv = new ModelAndView("admin-login");
		return mv;
	}

	@PostMapping("/admin")
	public ModelAndView loginAdmin(@ModelAttribute("user") User user, HttpSession session) {
		String username = user.getUsername();
		String password = user.getPassword();		
		ModelAndView mv1 = new ModelAndView("admin-login");
		if (userService.vaildlogin(username, password)) {
			User currUser = userService.findUserByName(username);
			if (currUser.getRole().equals("admin")) {
				session.setAttribute("username", username);
				ModelAndView mv = new ModelAndView("redirect:/admin-index");
				return mv;
			} else {
				mv1.addObject("headerMessage", "Sorry, You don't have access to login.");
				return mv1;
			}
		}
		mv1.addObject("headerMessage", "Sorry, it doesn't match our record, please try again.");		
		return mv1;
	}

	@GetMapping("/admin-index")
	public ModelAndView adminSuccess(HttpSession session) {
		ModelAndView mv = new ModelAndView("admin-index");
		return mv;
	}

	@GetMapping("/admin/product-inventory")
	public ModelAndView manageProduct(HttpSession session) {
		productList = productService.findAllProduct();
		categoryList = categoryService.findAllCategories();
		ModelAndView mv = new ModelAndView("inventory");
		mv.addObject("products", productList);
		return mv;
	}

	@GetMapping("/admin/add-product")
	public ModelAndView addProductPage(ModelMap model, HttpSession session) {
		ModelAndView mv = new ModelAndView("product-form");
		categoryList = categoryService.findAllCategories();
		return mv;
	}


	@PostMapping("/admin/add-product")
	public ModelAndView addProduct(HttpSession session, @ModelAttribute("product") Product product, @RequestParam("categoryName") String categoryName) {			
		Category category = new Category();
		category = categoryService.findCategoryByName(categoryName);
		if(category ==null) {
			category = categoryService.addCategory(categoryName);
		}
		product.setCategory(category);
		productService.addProduct(product);	
		ModelAndView mv = new ModelAndView("redirect:/admin/product-inventory");
		return mv;
	}
	
	
	@GetMapping("/admin/product-detail/{product.id}")	
	public ModelAndView showProductDetail(HttpSession session,@PathVariable("product.id") int id) {
		Optional<Product> optionalProduct = productService.getProductById(id);
		Product product = optionalProduct.get();
		ModelAndView mv = new ModelAndView("admin-product-detail");
		mv.addObject("product",product);
		return mv;
	}
	
	
	@GetMapping("/edit-product/{product.id}")	
	public ModelAndView editProduct(HttpSession session, ModelMap model, @PathVariable("product.id") int id) {
		Optional<Product> optionalProduct = productService.getProductById(id);
		Product product = optionalProduct.get();
		ModelAndView mv = new ModelAndView("product-edit");	
		model.put("product", product);
		return mv;
	}
	@PostMapping("/edit-product/{product.id}")	
	public ModelAndView updateProduct(HttpSession session, @ModelAttribute("product")Product product, @PathVariable("product.id") int id,
			@RequestParam("categoryName") String categoryName) {
		List<Category> categoryList = new ArrayList<Category>();
		Category category = new Category();
		category = categoryService.findCategoryByName(categoryName);
		if(category ==null) {
			category = categoryService.addCategory(categoryName);
		}
		product.setCategory(category);
		productService.updateProduct(product);
		ModelAndView mv = new ModelAndView("redirect:/admin/product-inventory");
		return mv;
	}
	
	@GetMapping("/remove-product/{product.id}")	
	public ModelAndView removeProduct(HttpSession session, @PathVariable("product.id") int id) {
		Optional<Product> optionalProduct = productService.getProductById(id);
		Product product = optionalProduct.get();
		
		String categoryName = product.getCategoryName();
		Category category = categoryService.findCategoryByName(categoryName);
		category.removeProduct(id);
		categoryService.updateCategory(category);
		
		productService.deleteProduct(id);		
		
		ModelAndView mv = new ModelAndView("redirect:/admin/product-inventory");
		return mv;
	}
	
	@GetMapping("/admin/customer-management")
	public ModelAndView manageCustomer(HttpSession session) {
		userList = userService.findAllUsers();
		ModelAndView mv = new ModelAndView("user-list");
		mv.addObject("users", userList);
		return mv;
	}
	
	
	@GetMapping("/admin-logout")	
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/admin");
		return mv;
		
	}
	
	
	@GetMapping("/error-page")
	public ModelAndView error(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("error-page");
		return mv;
		
	}
	

}
