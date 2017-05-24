package com.cyb.shopping_portal.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Transient;

@Entity
public class Products {

	@Id
	@GeneratedValue
	@Column(name="id" ,length=4)
	private int productId;
	
	@Column(name="PRODUCT_NAME")
	private String product_name;
	
	@Column(name="PRODUCT_DESC")
	private String product_desc;
	
	@Column(name="PRODUCT_PRICE")
	private float price;
	
	@Column(name="QUANTITY")
	private Integer quantity;
	
	@Column(name="CATEGORY")
	private String category;
	
	@Column(name="IMG_NAME")
	private String img_name;
	
	@Lob
	@Column(name="PRODUCT_IMAGES")
	private byte [] image;
	
	@Transient
	private String base64image;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}
	
	
}
