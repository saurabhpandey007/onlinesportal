package com.cyb.shopping_portal.daos;


import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyb.shopping_portal.entities.Products;
import com.cyb.shopping_portal.entities.Users;

@Repository("admindao")

public class AdminDao {
	
	 @Autowired
	 private SessionFactory sessionFactory;
	
	public String verifyAdmin(String uname,String pass)
	{
	
		
		Query query = sessionFactory.getCurrentSession().createQuery("from Users as u where u.userId=:uid and u.password=:upass");
		query.setParameter("uid", uname);
		query.setParameter("upass", pass);
		
		
		Users u=null;
		List<Users> list = query.list();
		//Iterator it = list.iterator();
		if(!list.isEmpty() || null==list)
		{
		System.out.println(list.get(0));
	     u=list.get(0);
		System.out.println(u.getRole());
		}
		/*while(it.hasNext())
		{
			Users o[] = (Users[])it.next();
 
			System.out.println("Product id : "+o[0]+ "Product Name : "+o[1]);
 
			System.out.println("----------------");
		}		*/	
		return u.getRole();

	}
	
	
	
	public List<Products> veiwProductsList()
	{
		
		return  (List<Products>)sessionFactory.getCurrentSession().createCriteria(Products.class).list() ;

	}



	public Products getSingleProduct(int id) {
		return (Products) (sessionFactory.getCurrentSession().get(Products.class,id));
		
	}



	public int addProductDetails(Products products) {
		try{
		sessionFactory.getCurrentSession().save(products);
		return 1;
		}
		catch(HibernateException e)
		{
			return 0;
		}
		
	}
	

	public int deleteProduct(int id) {
	
	Query query = sessionFactory.getCurrentSession().createQuery("delete Products where productId = :ID");
	query.setParameter("ID", id);
	 
	int result = query.executeUpdate();
	System.out.println(result);
	return result;
	}



	public int updateProductDetails(Products products) {
		
		sessionFactory.getCurrentSession().update(products);
		return 0;
	}
	

}
