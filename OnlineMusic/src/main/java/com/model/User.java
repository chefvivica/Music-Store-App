package com.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int id;
	@Column(name="username", unique=true)
	@NotNull
	private String username;
	@NotNull
	private String password;
	@Column(name="first_name")
	@NotNull
	private String firstName;
	@Column(name="last_name")
	@NotNull
	private String lastName;
	@Column(name="email", unique=true)
	@NotNull
	private String email;
	@NotNull
	private String phone;
	@Column(name="Street_name")
	@NotNull
	private String streetName;
	@Column(name="apt_number")
	@NotNull
	private String aptNumber;
	@NotNull
	private String city;
	@NotNull
	private String state;
	@NotNull
	private String zipcode;
	@NotNull
	private String role;
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private Set<Order> orders;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String password, String firstName, String lastName, String email, String phone,
			String streetName, String aptNumber, String city, String state, String zipcode, String role) {
		super();
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.streetName = streetName;
		this.aptNumber = aptNumber;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getAptNumber() {
		return aptNumber;
	}
	public void setAptNumber(String aptNumber) {
		this.aptNumber = aptNumber;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email + ", phone=" + phone + ", streetName=" + streetName
				+ ", aptNumber=" + aptNumber + ", city=" + city + ", state=" + state + ", zipcode=" + zipcode
				+ ", role=" + role + "]";
	}
	
	
	
	
}
