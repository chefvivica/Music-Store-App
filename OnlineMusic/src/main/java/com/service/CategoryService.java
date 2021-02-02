package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CategoryDao;
import com.model.Category;

@Service
@Transactional
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	public List<Category> findAllCategories() {
		return categoryDao.findAll();
	}

	public Category findCategoryByName(String name) {
		return categoryDao.getCategoryByName(name);
	}

	public Optional<Category> findCategoryById(int id) {
		return categoryDao.findById(id);
	}

	public Category addCategory(String categoryName) {
		Category category = new Category();
		category.setName(categoryName);
		categoryDao.save(category);
		return category;
	}

	public Category updateCategory(Category category) {
		categoryDao.save(category);
		return category;
	}

}
