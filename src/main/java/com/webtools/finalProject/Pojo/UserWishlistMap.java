package com.webtools.finalProject.Pojo;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Component
@Entity
@Table(name = "userwishlistitems")
public class UserWishlistMap {
	@Id
	@Column(name = "user_wishlist_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "packageId")
	private TravelPackages travelPackages;

	public UserWishlistMap() {
		
	}

	public UserWishlistMap( User user, TravelPackages travelPackages) {
	
		this.user = user;
		this.travelPackages = travelPackages;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public TravelPackages getTravelPackages() {
		return travelPackages;
	}

	public void setTravelPackages(TravelPackages travelPackages) {
		this.travelPackages = travelPackages;
	}
}
