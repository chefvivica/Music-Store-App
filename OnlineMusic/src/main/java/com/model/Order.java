package com.model;

import java.sql.Time;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_id")
	private int id;
	private Date date;
	@NotNull
	@Column(name="grand_price")
	private double grandPrice;
	@JoinColumn(name="user_id", nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	private User user;
	@OneToMany(mappedBy="order", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private Set<OrderDetail> orderDetails;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(Time date, double grandPrice, User user, Set<OrderDetail> orderDetails) {
		super();
		this.date = date;
		this.grandPrice = grandPrice;
		this.user = user;
		this.orderDetails = orderDetails;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getGrandPrice() {
		return grandPrice;
	}
	public void setGrandPrice(double grandPrice) {
		this.grandPrice = grandPrice;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", date=" + date + ", grandPrice=" + grandPrice + ", user=" + user
				+ ", orderDetails=" + orderDetails + "]";
	}

	
	
	
	
}
