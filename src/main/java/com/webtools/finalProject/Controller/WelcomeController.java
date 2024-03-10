package com.webtools.finalProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {
	
	@GetMapping("/welcome.htm")
	public ModelAndView handleGet() {
		return new ModelAndView("welcome");
		
	}

}
