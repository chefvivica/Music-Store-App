package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.OrderDao;
import com.model.Order;

@Service
@Transactional
public class OrderService {
	
	
	@Autowired
	private OrderDao orderDao;
	
	public void addOrder(Order order) {
		orderDao.save(order);
	}
	
}
