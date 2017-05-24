package com.cyb.shopping_portal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyb.shopping_portal.daos.AdminDao;
import com.cyb.shopping_portal.entities.Products;

@Service("adminservice")
@Transactional
public class AdminService {
	
	@Autowired
	private AdminDao admindao;
	
	public String validateAdmin(String uname,String pass)
	{
		return(admindao.verifyAdmin(uname, pass));
				
	}
	public List<Products> getProductsList()
	{
		return(admindao.veiwProductsList());
				
	}
	
	public Products getProductsById(int id)
	{
		return(admindao.getSingleProduct(id));
				
	}
	public int addProductDetail(Products products) {
		
		
		return (admindao.addProductDetails(products));
		
	}
	
        public int deleteProducts(int id) {
		
       		return (admindao.deleteProduct(id));
		
	}
	

    	public int updateProductDetail(Products products) {
    		
    		
    		return (admindao.updateProductDetails(products));
    		
    	}

}
