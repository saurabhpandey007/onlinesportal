package com.cyb.shopping_portal.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="USER_DETAILS")
public class Users {
	
	// fields for USER_DETAILS table
	@Id
	@GeneratedValue
	@Column(name="id" ,length=4)
	private int id;
	
	@Column(name="USER_NAME")
	private String name;
	
	@Column(name="USER_ID")
	private String userId;
	
	@Column(name="PASSWORD")
	private String password;
	
	@Column(name="ADDRESS")
	private String address;
	
	@Column(name="ROLE")
	private String role;
	
	@Column(name="MOBILE_NO")
	private String mobno;
	
		
	//default constructor
	public Users() {
	}


// getters and setters for all the fields
	
	
	
	public String getName() {
		return name;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getMobno() {
		return mobno;
	}


	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	
	
	

}
