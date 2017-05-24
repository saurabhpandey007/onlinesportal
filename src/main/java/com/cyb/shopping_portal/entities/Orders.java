package com.cyb.shopping_portal.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="ORDERDETAILS")
public class Orders {
	
	@Id
	@GeneratedValue
	@Column(name="id" ,length=4)
	private int orderId;
	
	@Column(name="ORDER_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date order_date;
	
	@Column(name="ORDER_QTY")
	private int quantity;
	
	@Column(name="USER_ID")
	private String userId;
	
	@Column(name="PRODUCT_ID")
	private int prodId;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	

}
