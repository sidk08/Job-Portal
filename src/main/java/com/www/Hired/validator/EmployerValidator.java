package com.www.Hired.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.www.Hired.dao.DaoFactory;
import com.www.Hired.pojo.Employer;

public class EmployerValidator implements Validator {
	
	@Autowired
	@Qualifier("daoFac")
	DaoFactory df;
	
	@Override
	public boolean supports(Class aClass) {
		return aClass.equals(Employer.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Employer em = (Employer) obj;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "organization", "error.invalid.firstname", "Organization Required");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "industry", "error.invalid.lastname", "Last Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error.invalid.username", "Email/User Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password Required");
		
Employer checkem = new Employer();
		
		checkem.setUsername(em.getUsername());
		
		if(df.createUserDAO().authenticateUser(checkem) != null) {
			errors.rejectValue("error.invalid.username", "Username already exist");
		}
		
	}
}
