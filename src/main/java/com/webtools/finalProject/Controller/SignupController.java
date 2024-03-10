  package com.webtools.finalProject.Controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.finalProject.Exception.UserException;
import com.webtools.finalProject.Pojo.User;

import com.webtools.finalProject.Validator.SignupValidator;
import com.webtools.finalProject.Dao.UserDao;

import java.util.List;



@Controller
public class SignupController {
	
	@Autowired
	SignupValidator signupValidator;
	
	@Autowired
	UserDao userDao;
	
	
	@GetMapping("/signup.htm")
	public ModelAndView handleLogin(ModelMap model, User user) {
		 model.addAttribute("user", user);
		return new ModelAndView("signup");
		
	}
	
	@PostMapping("/signUpLogin.htm")
	public String handleUserSignUp( HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@ModelAttribute("user") User user, BindingResult result) throws Exception
	{
		signupValidator.validate(user, result);
		
		if(result.hasErrors()) {
			return "signup";
		}else {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Integer nameCount =0;
			Integer emailCount = 0;
//			String streetName = request.getParameter("streetName");
//			int streetNum = Integer.parseInt(request.getParameter("streetNum"));
//			String city = request.getParameter("city");
//			String state = request.getParameter("state");
//			String zipcode = request.getParameter("zipcode");
			List<User> users =userDao.getAllUsers();
			if(!users.isEmpty()) {
					for(User currentUser: users) {
						if(name.equals(currentUser.getName())) {
							user.setName("");
							user.setPassword(password);
							user.setEmail(email);
							request.setAttribute("userNameAlertMessage", "Username already exists");
							System.out.println("Username already exist");
							nameCount+=1;
							return "signup";
						}else if(email.equals(currentUser.getEmail())) {
							user.setName("");
							user.setPassword("");
							user.setEmail("");
							request.setAttribute("emailAlertMessage", "Email already exists");
							System.out.println("Email already exist");
							emailCount+=1;
							return "signup";

						}
					}
					if(nameCount == 0 && emailCount ==0) {
						user.setEmail(email);
						user.setName(name);
						user.setPassword(password);
						try {
							userDao.save(user);
							//addressDao.save(address);
							session.setAttribute("user", user);
//							session.setAttribute("address", address);
							
						} catch (UserException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						return "userLogin";
					}
				}else {
					user.setEmail(email);
					user.setName(name);
					user.setPassword(password);

					try {
						userDao.save(user);
						//addressDao.save(address);
						session.setAttribute("user", user);
//						session.setAttribute("address", address);
						
					} catch (UserException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					return "userLogin";

				}
			
			
			
			System.out.println(name);
			System.out.println(email);
			System.out.println(password);
			
						
			
//			try {
//				userDao.save(user);
//				//addressDao.save(address);
//				session.setAttribute("user", user);
////				session.setAttribute("address", address);
//				
//			} catch (UserException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			return "userLogin";
			
		}
	
	}

}
