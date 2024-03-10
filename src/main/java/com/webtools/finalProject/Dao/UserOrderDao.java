package com.webtools.finalProject.Dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.User;
import com.webtools.finalProject.Pojo.UserOrderMap;
import com.webtools.finalProject.Pojo.UserProductMap;

@Component
public class UserOrderDao extends DAO{
	public UserOrderMap create(UserOrderMap userOrder) {
		 try {
	            //save user object in the database
	        	begin();
	        	getSession().persist(userOrder);
	        	commit();
	        	close();
	        	
	        	
	        } catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            e.printStackTrace();
	            
	            
	        }
	        return userOrder;
	}
	public List<UserOrderMap> getAllUserOrders(User user){
		System.out.println("userId inside UserProductMap: " + user);
		List<UserOrderMap> userOrders = null;
		try {
			begin();
			System.out.println("Getting all the UserProducts added to the cart: -----");
			Query<UserOrderMap> query = getSession().createQuery("FROM UserOrderMap where user = :user", UserOrderMap.class);
			query.setParameter("user", user);
			userOrders = query.list();
			System.out.println("userOrders from DB"+ userOrders);
			commit();
			close();
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return userOrders;
		
	}
	
	public void delete(List<TravelPackages> travelPackages) {
		
		try {
            //save user object in the database
        	begin();
        	getSession().remove(travelPackages);
        	commit();
        	close();
        	
        	
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            e.printStackTrace();
            
            
        }
	}
}
