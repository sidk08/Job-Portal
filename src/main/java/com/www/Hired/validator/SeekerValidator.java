package com.www.Hired.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.www.Hired.dao.DaoFactory;
import com.www.Hired.pojo.JobSeeker;

public class SeekerValidator implements Validator {
	
	@Autowired
	@Qualifier("daoFac")
	DaoFactory df;
	
	@Override
	public boolean supports(Class aClass) {
		return aClass.equals(JobSeeker.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		JobSeeker jbs = (JobSeeker) obj;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", "error.invalid.firstname", "First Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", "error.invalid.lastname", "Last Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error.invalid.username", "Email/User Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password Required");
		
		JobSeeker checkjbs = new JobSeeker();
		
		checkjbs.setUsername(jbs.getUsername());
		
		if(df.createUserDAO().authenticateUser(checkjbs) != null) {
			errors.rejectValue("error.invalid.username", "Username already exist");
		}
	
	}

}
