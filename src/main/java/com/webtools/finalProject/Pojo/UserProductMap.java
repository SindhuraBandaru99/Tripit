package com.webtools.finalProject.Pojo;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import org.springframework.stereotype.Component;

import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.User;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "userproducts")
public class UserProductMap {
	@Id
	@Column(name = "user_product_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "id")
	private User user;
	
	
	@ManyToOne
	@JoinColumn(name = "packageId")
	private TravelPackages travelPackages;

	
	public UserProductMap(User user, TravelPackages travelPackages) {
		// TODO Auto-generated constructor stub
		this.user = user;
		this.travelPackages = travelPackages;
	}
	public UserProductMap() {
		
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
//	@Override
//	public String toString() {
//		return "UserProductMap [id=" + id + ", user=" + user + ", travelPackages=" + travelPackages + "]";
//	}
	
		
	
}
