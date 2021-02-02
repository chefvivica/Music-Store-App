package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDao;
import com.model.Product;
import com.model.User;


@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	public List<Product> findAllProduct() {	
		return  productDao.findAll();
	}
	
	
	public Product addProduct(Product product) {
		return productDao.save(product);
	}
	
	
	public Optional<Product> getProductById(int id) {
		return productDao.findById(id);
	}
	
	public void updateProduct(Product product) {
		productDao.save(product);
	}
	
	
	public void deleteProduct(int id) {
		productDao.deleteById(id);
	}

	


}
