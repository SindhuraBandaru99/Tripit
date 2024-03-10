package com.webtools.finalProject.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SignupValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", "empty-name", "UserName cannot be blank");
		ValidationUtils.rejectIfEmpty(errors, "password", "empty-password", "Password cannot be blank");
		ValidationUtils.rejectIfEmpty(errors, "email", "empty-email", "Email cannot be blank");
		
	}

}
