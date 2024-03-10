package com.webtools.finalProject.Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class TravelFilter implements Filter {

	private int counter;
	boolean isLoggedIn;
	
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if needed
    	 counter = 0;
    	 isLoggedIn=false;
    	 
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	
    	
    	HttpServletRequest httpRequest = (HttpServletRequest) request;
    	HttpServletResponse httpResponse = (HttpServletResponse) response;
    	HttpSession session = httpRequest.getSession(false);
    	//String userAgent = httpRequest.getHeader("User-Agent");
    	//For first time and different browser
    	if (session != null) {
    	    isLoggedIn = session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn");
    	    String userAgent = httpRequest.getHeader("User-Agent");
    	    String storedUserAgent = (String) httpRequest.getSession().getAttribute("userAgent");
    	    if ((userAgent != null) && (storedUserAgent == null)) {
    	        chain.doFilter(request, response);
    	    } else if (userAgent.equals(storedUserAgent)) {
    	        chain.doFilter(request, response);
    	    } else {
    	        if (isLoggedIn) {
    	            session.invalidate();
    	        }
    	        httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.htm");
    	    }

    	} else {
    		 if (isLoggedIn) {
    	    	 isLoggedIn=false;
    	    	 httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.htm");
    			 return;
 	        }else {
 	        	chain.doFilter(request, response);
 	        }
 	    }
    		
    	}
    		

    @Override
    public void destroy() {
        
    }
}
