package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.Category;

@Repository
public interface CategoryDao extends JpaRepository<Category, Integer>{
	 @Query("SELECT c FROM Category c WHERE c.name = :name")
	 public Category getCategoryByName(@Param("name") String name);
	 
}
