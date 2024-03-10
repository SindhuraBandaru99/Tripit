package com.webtools.finalProject.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.webtools.finalProject.Pojo.User;


@Component
public class LoginValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", "empty-userName", "UserName cannot be blank");
		ValidationUtils.rejectIfEmpty(errors, "password", "empty-password", "Password cannot be blank");
		//ValidationUtils.rejectIfEmpty(errors, "role", "empty-role", "Role cannot be blank");
	}

}
