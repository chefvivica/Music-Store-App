package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.OrderDetailDao;
import com.model.OrderDetail;

@Service
@Transactional
public class OrderDetailService {
	
	@Autowired
	OrderDetailDao orderDetailDao;
	public void addOrderDetail(OrderDetail orderDetail) {
		orderDetailDao.save(orderDetail);
	}
	
	
	
}
