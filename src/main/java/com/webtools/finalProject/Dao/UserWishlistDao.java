package com.webtools.finalProject.Dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.finalProject.Pojo.User;
import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.UserProductMap;
import com.webtools.finalProject.Pojo.UserWishlistMap;

@Component
public class UserWishlistDao extends DAO {
	public UserWishlistMap create(UserWishlistMap userWishlist) {
        try {
            //save user object in the database
        	begin();
        	getSession().persist(userWishlist);
        	commit();
        	close();
        	
        	
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            e.printStackTrace();
            
            
        }
        return userWishlist;
    }
	public List<UserWishlistMap> getAllUserWishlistItems(User user){
		System.out.println("userId inside UserProductMap: " + user);
		List<UserWishlistMap> userWishlistItems = null;
		try {
			begin();
			System.out.println("Getting all the UserProducts added to the cart: -----");
			Query<UserWishlistMap> query = getSession().createQuery("FROM UserWishlistMap where user = :user", UserWishlistMap.class);
			query.setParameter("user", user);
			userWishlistItems = query.list();
			System.out.println("userProducts from DB"+ userWishlistItems);
			commit();
			close();
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return userWishlistItems;
		
	}
	
	public void deleteSelectedWishlistItem(TravelPackages travelPackages) {
		try{
			begin();
			System.out.println("Deleting the selcted wishlist item: ----");
			Query<UserWishlistMap> query =getSession().createQuery("Delete FROM UserWishlistMap where travelPackages = :travelPackages");
			query.setParameter("travelPackages",travelPackages);
			query.executeUpdate();
			System.out.println("Deleted from DB");
			commit();
			close();
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
}
