package com.service;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.UserDao;
import com.model.User;


@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public List<User> findAllUsers() {	
		return  userDao.findAll();
	}
	
	public User addUser(User user) {
		return userDao.save(user);
	}
	
	
	public Boolean vaildlogin(String username, String password) {
		AtomicBoolean userExsits = new AtomicBoolean(false);
		User user = new User();
		user = userDao.getUserByUsername(username);
		if(user.getPassword().equals(password)) {
			userExsits.set(true);
		}	
		return userExsits.get();
	}
	
	public User findUserByName(String username) {	
		return userDao.getUserByUsername(username);		
	}
	

}