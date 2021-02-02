package com.model;

public class ShippingInfo {
	private String name;
	private String email;
	private String phone;
	private String street;
	private String apt;
	private String city;
	private String state;
	private String zipcode;
	public ShippingInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShippingInfo(String name, String email, String phone, String street, String apt, String city, String state,
			String zipcode) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.street = street;
		this.apt = apt;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getApt() {
		return apt;
	}
	public void setApt(String apt) {
		this.apt = apt;
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
	@Override
	public String toString() {
		return "ShippingInfo [name=" + name + ", email=" + email + ", phone=" + phone + ", street=" + street + ", apt="
				+ apt + ", city=" + city + ", state=" + state + ", zipcode=" + zipcode + "]";
	}
	
	
}
