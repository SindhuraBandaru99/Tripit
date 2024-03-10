package com.webtools.finalProject.Pojo;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Table;

import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.OneToOne;

import jakarta.persistence.CascadeType;
import jakarta.persistence.OneToMany;

import org.springframework.stereotype.Component;



@Component
@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String email;
	private String password;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserProductMap> userproducts = new  HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserWishlistMap> userwishlist = new  HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	 private Set<UserOrderMap> userorderlist = new  HashSet<>();
	
//	@OneToMany
//	private Set<TravelPackages> travelPackages = new HashSet<>();
	
//	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
//    private Address address;
	
	
	public Set<UserOrderMap> getUserorderlist() {
		return userorderlist;
	}

	public void setUserorderlist(Set<UserOrderMap> userorderlist) {
		this.userorderlist = userorderlist;
	}



	public User() {
		
	}

	

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", userproducts="
				+ userproducts + ", userwishlist=" + userwishlist + "]";
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<UserProductMap> getUserproducts() {
		return userproducts;
	}

	public void setUserproducts(Set<UserProductMap> userproducts) {
		this.userproducts = userproducts;
	}
}

	
	


