package com.cyb.shopping_portal.daos;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyb.shopping_portal.entities.Orders;
import com.cyb.shopping_portal.entities.Products;
import com.cyb.shopping_portal.entities.Users;

@Repository
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Products> getAllProducts() {
		
		return (List<Products>)sessionFactory.getCurrentSession().createQuery("from Products where quantity > 0 ").list() ;
		
	
	}
public Products getProductDetails(int id) {
		
		return (Products)sessionFactory.getCurrentSession().get(Products.class,id);
	
	}
public int saveOrder(Orders ord) {
	try{
		sessionFactory.getCurrentSession().save(ord);
		return 1;
		}
		catch(HibernateException e)
		{
			return 0;
		}
	
}
	
public int checkUser(Users u)
{
	
	String hql = "Select log.userId from Users log where log.userId=:userName"; 
               
       
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            query.setParameter("userName", u.getUserId());
            @SuppressWarnings("unchecked")
			List<Users>  result = query.list();
            
            try{
            	result.get(0);
            	return 0;
            	
            }
            catch(IndexOutOfBoundsException e)
            {
            	
            	return 1;
            }
            
        
}


public int registerUser(Users u) {
	try{
		sessionFactory.getCurrentSession().save(u);
		return 1;
		}
		catch(HibernateException e)
		{
			return 0;
		}
	
}
public Users verifyUser(String uname,String pass)
{

	
	Query query = sessionFactory.getCurrentSession().createQuery("from Users as u where u.userId=:uid and u.password=:upass");
	query.setParameter("uid", uname);
	query.setParameter("upass", pass);
	
	
	Users u=null;
	@SuppressWarnings("unchecked")
	List<Users> list =(List<Users>) query.list();
	
	if(!list.isEmpty() || null==list)
	{
	System.out.println(list.get(0));
     u=list.get(0);
	System.out.println(u.getRole());
	}
	
	return u;

}


public int updateProduct( int id,int qty)
{
	  
    String hql = "update Products set quantity = :qty where productId = :id";
    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setInteger("qty",qty);
    query.setInteger("id",id);
    int rowCount = query.executeUpdate();
    System.out.println("Rows affected: " + rowCount);
    return rowCount;	
}
public List<Products> getProductHistory(String uid) {
	Query query1 = sessionFactory.getCurrentSession().createQuery("select o.prodId from Orders o where o.userId = :uid").setString("uid", uid);
	List lst =query1.list();
try{
	lst.get(0);
}
catch(Exception e)
{
	return null;
}
	Query query2 = sessionFactory.getCurrentSession().createQuery("from Products p where p.productId in (:ids)").setParameterList("ids",lst);
	List<Products> list =(List<Products>)query2.list();
	return list;
	
}
public Users getUser(String uid) {

	List<Users> u=sessionFactory.getCurrentSession().createQuery("from Users u where u.userId = :uid").setString("uid",uid).list();
	return u.get(0);
}
public int updateUser(String uid, String name, String address, String mobno) {

	
	Query query=sessionFactory.getCurrentSession().createQuery("update Users set name=:nm, address=:addr, mobno=:mob  where userId=:uid");
	query.setString("nm", name);
	query.setString("addr", address);
	query.setString("mob", mobno);
	query.setString("uid", uid);
	
	int modifications=query.executeUpdate();
	
	System.out.println(modifications);
	return modifications;
}

}
