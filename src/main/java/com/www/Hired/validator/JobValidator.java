package com.www.Hired.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.www.Hired.pojo.Job;

public class JobValidator implements Validator{

	@Override
	public boolean supports(Class aClass) {
		// TODO Auto-generated method stub
		return aClass.equals(Job.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "jobTitle", "error.invalid.jobtitle", "Job Title Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "error.invalid.description", "Description Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "error.invalid.location", "Location Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "skills", "error.invalid.skills", "Skills for job Required");
	}

}
