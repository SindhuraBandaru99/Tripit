package com.webtools.finalProject.Pojo;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.CascadeType;

import java.util.HashSet;
import java.util.Set;


import com.webtools.finalProject.Pojo.User;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "travelpackages")
public class TravelPackages {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer packageId;
	private String packageName;
	private String packageDescription;
	private Integer packagePrice;
	private String image;
	

	
	@Override
	public String toString() {
		return "TravelPackages [packageId=" + packageId + ", packageName=" + packageName + ", packageDescription="
				+ packageDescription + ", packagePrice=" + packagePrice + ", image=" + image + ", users=" + users + "]";
	}
	@OneToMany(mappedBy = "travelPackages", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserProductMap> users = new HashSet<UserProductMap>();
	
	@OneToMany(mappedBy = "travelPackages", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserWishlistMap> usersWishlist = new HashSet<UserWishlistMap>();

	@OneToMany(mappedBy = "travelPackages", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserOrderMap> userOrderMap = new HashSet<UserOrderMap>();
	
	public Set<UserWishlistMap> getUsersWishlist() {
		return usersWishlist;
	}
	public void setUsersWishlist(Set<UserWishlistMap> usersWishlist) {
		this.usersWishlist = usersWishlist;
	}
	public Set<UserProductMap> getUsers() {
		return users;
	}
	public void setUsers(Set<UserProductMap> users) {
		this.users = users;
	}
	public TravelPackages() {
		
	}
	public Integer getPackageId() {
		return packageId;
	}
	public void setPackageId(Integer packageId) {
		this.packageId = packageId;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getPackageDescription() {
		return packageDescription;
	}
	public void setPackageDescription(String packageDescription) {
		this.packageDescription = packageDescription;
	}
	public Integer getPackagePrice() {
		return packagePrice;
	}
	public void setPackagePrice(Integer packagePrice) {
		this.packagePrice = packagePrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	

}
