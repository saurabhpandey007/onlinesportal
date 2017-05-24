package com.cyb.shopping_portal.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyb.shopping_portal.daos.UserDao;
import com.cyb.shopping_portal.entities.Orders;
import com.cyb.shopping_portal.entities.Products;
import com.cyb.shopping_portal.entities.Users;

@Service("userService")
@Transactional
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	
	public List<Products> getAllProductsList()
	{
		return (userDao.getAllProducts());
	}


	public Products getProductDetails(int id)
	{
		return (userDao.getProductDetails(id));
	}

	public int orderproduct(Orders ord)
	{
		return(userDao.saveOrder(ord));
		
	}

	public int checkUser(Users u)
	{
		return(userDao.checkUser(u));
		
	}
	public int registerUser(Users u)
	{
		return(userDao.registerUser((u)));
		
	}

	public Users validateUser(String uname,String pass)
	{
		return(userDao.verifyUser(uname, pass));
				
	}
	public int UpdateProduct(int id,int qty)
	{
		userDao.updateProduct(id, qty);
		return 0;
		
	   
	}


	public List<Products> getHistory(String uid) {
		
		return userDao.getProductHistory(uid);
		
	}


	public Users getUsers(String uid) {
		return userDao.getUser(uid);
		
	}


	public int updateUser(String uid, String name, String address, String mobno) {
		return userDao.updateUser(uid,name,address,mobno);
		
	}

}

