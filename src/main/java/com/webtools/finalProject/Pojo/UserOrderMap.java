package com.webtools.finalProject.Pojo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="userOrders")
public class UserOrderMap {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer user_order_id;
	
	@ManyToOne
	@JoinColumn(name="id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="packageId")
	private TravelPackages travelPackages;
	
	
	public UserOrderMap() {
		
	}

	public UserOrderMap( User user, TravelPackages travelPackages, Integer amount) {
		
		this.user = user;
		this.travelPackages = travelPackages;
		this.amount = amount;
	}

	public Integer getUser_order_id() {
		return user_order_id;
	}

	public void setUser_order_id(Integer user_order_id) {
		this.user_order_id = user_order_id;
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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	private Integer amount;
}
