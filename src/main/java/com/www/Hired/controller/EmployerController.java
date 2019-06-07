package com.www.Hired.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.www.Hired.dao.DaoFactory;
import com.www.Hired.pojo.Employer;
import com.www.Hired.pojo.Job;
import com.www.Hired.pojo.User;
import com.www.Hired.validator.JobValidator;

@Controller
@RequestMapping(value="/employer")
public class EmployerController {
	
	@Autowired
	@Qualifier("daoFac")
	DaoFactory df;
	
	@Autowired
	@Qualifier("jobValidator")
	JobValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView employerHome(HttpServletRequest req) throws Exception {
		
		User u = (User)req.getSession(false).getAttribute("user");
		if(u!=null) {
		Employer em = df.createUserDAO().getEmployer(u.getUserid());
		req.getSession().setAttribute("em", em);
		return new ModelAndView("employerPage");
		}
		else {
			return new ModelAndView("error", "msg", "Cannot retreive login details. Login before viewing page");
		}
	}
	
	@RequestMapping(value="/createJob", method=RequestMethod.GET)
	public ModelAndView createJob(HttpServletRequest req) {
		
		Job jb = new Job();
		
		return new ModelAndView("createJob","jb",jb);
	}
	
	@RequestMapping(value="/createJob", method=RequestMethod.POST)
	public ModelAndView saveJob(HttpServletRequest req,  @ModelAttribute("jb")Job job, BindingResult result) {
		
		validator.validate(job, result);
		
		if(result.hasErrors()) {
			return new ModelAndView("createJob","jb",job);
		}
		
		try {
			
			job.setPostedOn(new Date());
			job.setStatus(true);
			Employer em = (Employer) req.getSession(false).getAttribute("em");
			job.setPostedBy(em.getOrganization());
			
			Job savedJob = df.createJobDAO().createJob(job);
			
			return new ModelAndView("savedJob");
		}
		catch(Exception ex) {
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "error while saving job");
		}
		
	}
	
	@RequestMapping(value="/listJob")
	public ModelAndView listJob(HttpServletRequest req) {
		try {
		Employer em = (Employer)req.getSession(false).getAttribute("em");
		List<Job> joblist = df.createJobDAO().getJobListByOrg(em.getOrganization());
		return new ModelAndView("employerJobList", "jobList", joblist);
		}
		catch(Exception ex) {
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "Could not retrieve job");
		}
	}
	
	@RequestMapping(value="/updateJob", method=RequestMethod.GET)
	public ModelAndView updateJobPage(@RequestParam("jobid")int jobid, HttpServletRequest req) {
		
		if(req.getSession(false).getAttribute("em") == null) {
			return new ModelAndView("error", "msg", "Cannot retreive login details. Login before viewing page");
		}
		try {
			Job job = df.createJobDAO().getJobById(jobid);
//			if(job!=null) {
				return new ModelAndView("updateJobPage", "jb", job);
//			}
		}
		catch(Exception ex) {
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "Could not update job");
		}
		
	}
	
	@RequestMapping(value="/updateJob", method=RequestMethod.POST)
	public ModelAndView updateJob(@ModelAttribute("jb")Job job, HttpServletRequest req) {
				
		try {
			job.setPostedOn(new Date());
			job.setStatus(true);
			Employer em = (Employer) req.getSession(false).getAttribute("em");
			job.setPostedBy(em.getOrganization());
			Job upJob = df.createJobDAO().updateJob(job);
		}
		catch(Exception ex) {
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "Could not update job");
		}
		
		return new ModelAndView("error", "msg", "Job Updated successfully");
	}
	
	@RequestMapping(value="/deleteJob")
	public ModelAndView deleteJob(@RequestParam("jobid") int jobid, HttpServletRequest req) {
		
		try {
			df.createJobDAO().deleteJob(jobid);
			return new ModelAndView("error", "msg", "Job deleted");
		}
		catch(Exception ex) {
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "Could not delete job");
		}
		
	}
	

}
