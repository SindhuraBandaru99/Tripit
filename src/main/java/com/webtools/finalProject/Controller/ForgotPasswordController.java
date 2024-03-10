package com.webtools.finalProject.Controller;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.finalProject.Dao.UserDao;
import com.webtools.finalProject.Pojo.User;

@Controller
public class ForgotPasswordController {
	
	@Autowired
    private UserDao userDao;
	
	@GetMapping("/forgotPassword.htm")
	public ModelAndView handleLogin() {
		return new ModelAndView("forgotPassword");
	}
	
	
	
	
	@PostMapping("/forgotPasswordSuccess.htm")
	public ModelAndView handleForgotPasswordSuccess(HttpServletRequest request,
            HttpServletResponse response, @ModelAttribute("user") User user) throws Exception{
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String cfPassword = request.getParameter("cfpassword");
		User currentUser = userDao.getUser(user.getName());
		if(currentUser.getName().equals(user.getName())) {
			if(password.equals(cfPassword)) {
				System.out.println("Password Matched");
				userDao.updateUserPassword(name, password);
			}else {
				System.out.println("Password Not Matched");
			}
		}else {
			System.out.println("UserName Not Existed");
		}
		
		return new ModelAndView("userLogin");
		
	}

}


