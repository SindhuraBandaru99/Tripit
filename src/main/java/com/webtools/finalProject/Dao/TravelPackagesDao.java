package com.webtools.finalProject.Dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.finalProject.Exception.UserException;
import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.User;

@Component
public class TravelPackagesDao extends DAO {
	
	public List<TravelPackages>	 getProducts() throws UserException{
		
		List<TravelPackages> myEntities = null;
		try {
			myEntities = getSession().createQuery("FROM TravelPackages", TravelPackages.class).getResultList();
			System.out.println(myEntities);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
        return myEntities;
    }
	
	public TravelPackages getSelectedProduct(Integer packageId) throws UserException{
			
			List<TravelPackages> myEntities = null;
			TravelPackages travelPackage = null;
			try {
				//myEntities = getSession().createQuery("FROM User where packageId= :packageId", TravelPackages.class).getResultList();
				Query<TravelPackages> query =  getSession().createQuery("FROM TravelPackages where packageId= :packageId", TravelPackages.class);
			    query.setParameter("packageId", packageId);
			    travelPackage = query.uniqueResult();
			    
				System.out.println(travelPackage);
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
			
	        return travelPackage;
	    }
	
	public void save(TravelPackages travelPackages) throws Exception {
        try {
            //save Travel Package object in the database
        	begin();
        	getSession().persist(travelPackages);
        	commit();
        } catch (HibernateException e) {
            rollback();       
            e.printStackTrace();
            
            throw new UserException("Exception while creating TravelPackages: " + e.getMessage());
    }
 }
	
	public void delete(TravelPackages travelPackages) throws UserException {
		 try {
	         //delete Travel Package object in the database
	     	begin();
	     	getSession().remove(travelPackages);
	     	commit();
	     	close();
	     } catch (HibernateException e) {
	         rollback();
	         throw new UserException("Exception while deleting Package: " + e.getMessage());
	     }
	}
	
	public void update(Integer packageID, String packageName, String packageDescription, Integer packagePrice, String imageURL ) throws UserException {
		
		TravelPackages travelPackages = getSelectedProduct(packageID);
		
		if(travelPackages!=null) {
			try {
		         //Updates Travel Package object in the database
		     	begin();
		     	travelPackages.setPackageName(packageName);
		     	travelPackages.setPackageDescription(packageDescription);
		     	travelPackages.setPackagePrice(packagePrice);
		     	travelPackages.setImage(imageURL);
		     	getSession().merge(travelPackages);
		     	commit();
		     	close();
		     } catch (HibernateException e) {
		         rollback();
		         throw new UserException("Exception while deleting Package: " + e.getMessage());
		     }
		}
		 
	}
	
	public List<TravelPackages>	 getSearchedProducts(String enteredText) throws UserException{
		
		List<TravelPackages> myEntities = null;
		try {
			myEntities = getSession().createQuery("FROM TravelPackages where packageDescription LIKE '%"+enteredText+"%'", TravelPackages.class).getResultList();
			System.out.println("Searched Products:" + myEntities);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
        return myEntities;
    }
	
	public List<TravelPackages>	 getSortedProducts() throws UserException{
			
			List<TravelPackages> myEntities = null;
			try {
				myEntities = getSession().createQuery("FROM TravelPackages ORDER BY packageDescription ASC", TravelPackages.class).getResultList();
				System.out.println(myEntities);
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
			
	        return myEntities;
	    }
	
	public List<TravelPackages> getPaginationResults(Integer pageNumber) {
		 List<TravelPackages> travelPackages = null;
		 begin();
		 try {
			 Query<TravelPackages> query = getSession().createQuery("FROM TravelPackages", TravelPackages.class);
			 query.setFirstResult((4*(pageNumber-1)));
			 query.setMaxResults(4*pageNumber);
			 travelPackages = query.list();
			 commit();
			 close();
			 System.out.println(travelPackages);
		 }
		 catch(Exception e) {
			 System.out.println(e);
			 e.printStackTrace();
		 }
		return travelPackages;
	}
	
	public List<TravelPackages> getTravelPackagesForUser(int userId) {
		List<TravelPackages> travelPackages = null;
		begin();
		try {
			
		    String hql = "SELECT tp FROM User u JOIN u.travelPackages tp WHERE u.id = :userId";
		    Query<TravelPackages> query = getSession().createQuery(hql, TravelPackages.class);
		    query.setParameter("userId", userId);
		    travelPackages = query.list();
		    commit();
			close();
			System.out.println(travelPackages);
		}catch(Exception e) {
			 System.out.println(e);
			 e.printStackTrace();
		 }
		return travelPackages;
		
	}

}
