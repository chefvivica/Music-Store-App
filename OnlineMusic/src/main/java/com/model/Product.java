package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="product_id")
	private int id;
	@Column(name="product_name")
	@NotNull
	private String name;
	private String genre;
	@NotNull
	@Column(name="condition_status")
	private String conditionStatus;
	private double price;
	private String image;
	@JoinColumn(name="category_id", nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	private Category category;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String name, String genre, String conditionStatus, double price, String image, Category category) {
		super();
		this.name = name;
		this.genre = genre;
		this.conditionStatus = conditionStatus;
		this.price = price;
		this.image = image;
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getConditionStatus() {
		return conditionStatus;
	}
	public void setConditionStatus(String conditionStatus) {
		this.conditionStatus = conditionStatus;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getCategoryName() {
		return category.getName();
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", genre=" + genre + ", conditionStatus=" + conditionStatus
				+ ", price=" + price + ", image=" + image + ", category=" + category + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((conditionStatus == null) ? 0 : conditionStatus.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + id;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (conditionStatus == null) {
			if (other.conditionStatus != null)
				return false;
		} else if (!conditionStatus.equals(other.conditionStatus))
			return false;
		if (genre == null) {
			if (other.genre != null)
				return false;
		} else if (!genre.equals(other.genre))
			return false;
		if (id != other.id)
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		return true;
	}
	
	
	
	
	
	
}