package com.webtools.finalProject.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.finalProject.Dao.TravelPackagesDao;
import com.webtools.finalProject.Exception.UserException;
import com.webtools.finalProject.Pojo.Admin;
import com.webtools.finalProject.Pojo.TravelPackages;
import com.webtools.finalProject.Pojo.User;
import com.webtools.finalProject.Validator.LoginValidator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
    private Environment environment;
	
	@Autowired
    private TravelPackagesDao tdao;
	
	
	
	List<TravelPackages> allPackages = new ArrayList<TravelPackages>();
	

	@GetMapping("/adminLogin.htm")
	public ModelAndView handleLogin() {
		return new ModelAndView("adminLogin");
	}
	
	@PostMapping("/adminDashboard.htm")
	public ModelAndView loginSuccessful(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UserException, IOException {
		String aUserName = request.getParameter("adminName");
		String aPassword = request.getParameter("adminPassword");
		String adminUname = environment.getProperty("admin.username");
		String adminPassword = environment.getProperty("admin.password");
		
		if(aUserName.equals(adminUname)) {
			if(aPassword.equals(adminPassword)) {
				return new ModelAndView("adminDashboard");
			}
		}
		return new ModelAndView("adminDashboard");
	}
	
	@PostMapping("/manageDashboard.htm")
	public ModelAndView dashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
			TravelPackages travelPackage) throws Exception {
		String selected = request.getParameter("userSelectedOption");
		if(selected.contains("Create")) {
			travelPackage.setPackageName(request.getParameter("packageName"));
			travelPackage.setPackageDescription(request.getParameter("packageDescription"));
			travelPackage.setPackagePrice(Integer.parseInt(request.getParameter("packagePrice")));
			TravelPackagesDao travelDao = new TravelPackagesDao();
			travelDao.save(travelPackage);
		}else if (selected.contains("Get")) {
			String pid = request.getParameter("pacakageId");
			Integer tid = Integer.parseInt(pid);
			
			TravelPackages selectedProduct =tdao.getSelectedProduct(tid);
			session.setAttribute("tid", tid);
			session.setAttribute("selectedProduct", selectedProduct);
			
		}else if (selected.contains("Delete")) {
			String pid = request.getParameter("pacakageId");
			Integer tid = Integer.parseInt(pid);
			
			TravelPackages selectedProduct=tdao.getSelectedProduct(tid);
			tdao.delete(selectedProduct);
		}else if (selected.contains("Update")) {
			
			Integer packageId = Integer.parseInt(request.getParameter("packId"));
			String packageName = request.getParameter("packageName");
			String packageDescription = request.getParameter("packageDescription");
			Integer packagePrice = Integer.parseInt(request.getParameter("packagePrice"));
			String imageURL = request.getParameter("imageURL");
			tdao.update(packageId,packageName, packageDescription,packagePrice, imageURL);
		}else if (selected.contains("Show")) {
			
			allPackages = tdao.getProducts();
			session.setAttribute("allPackages", allPackages);
		}
		
		
		return new ModelAndView("adminDashboard");
	}

}
