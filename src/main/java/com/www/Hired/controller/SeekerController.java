package com.www.Hired.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.www.Hired.dao.DaoFactory;
import com.www.Hired.pojo.Employer;
import com.www.Hired.pojo.Job;
import com.www.Hired.pojo.JobSeeker;
import com.www.Hired.pojo.User;
import com.www.Hired.validator.SeekerValidator;

@Controller
@RequestMapping(value="/seeker")
public class SeekerController {
	
	@Autowired
	@Qualifier("daoFac")
	DaoFactory df;
	
	@Autowired
	@Qualifier("jbsValidator")
	SeekerValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView seekerHome(HttpServletRequest req) throws Exception {
		User u = (User)req.getSession(false).getAttribute("user");
		if(u!=null) {
		JobSeeker jbs = (JobSeeker)df.createUserDAO().getSeeker(u.getUserid());
		req.getSession().setAttribute("jbs", jbs);
		return new ModelAndView("seekerPage");
		}
		else {
			return new ModelAndView("error", "msg", "Cannot retreive login details. Login before viewing page");
		}
		
	}
	
	@RequestMapping(value="/listJob")
	public ModelAndView listJobs() {
		try {
		List<Job> joblist = df.createJobDAO().getJobList();
		return new ModelAndView("seekerJobList", "jobList", joblist);
		}
		catch(Exception ex) {
		System.out.println("Exception: " + ex.getMessage());
		return new ModelAndView("error", "msg", "Could not retrieve job");
	}
	}
	
	@RequestMapping(value="/applyJob")
	public ModelAndView applyJob(@RequestParam("jobid")int jobid, HttpServletRequest req) {
		
		try {
			JobSeeker jbs = (JobSeeker) req.getSession(false).getAttribute("jbs");
			if(jbs!=null) {
				Job job = df.createJobDAO().getJobById(jobid);
				job.getSeekers().add(jbs);
				df.createJobDAO().updateJob(job);
				
				df.createUserDAO().updateSeeker(jbs);
				req.getSession(false).setAttribute("jbs",jbs);
				return new ModelAndView("error", "msg", "Applied to job successfully");
			}
			else {
				return new ModelAndView("error", "msg", "Cannot retreive login details. Login before viewing page");
			}
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			System.out.println("Exception: " + ex.getMessage());
			return new ModelAndView("error", "msg", "System error. Cannot apply to job");
		}
//		return null;
		
	}
	
	@RequestMapping(value="/appliedJobs")
	public ModelAndView appliedJobs(HttpServletRequest req) {
		try {
			JobSeeker jbs = (JobSeeker) req.getSession(false).getAttribute("jbs");
			if(jbs!=null) {
				return new ModelAndView("appliedJob", "jbs", jbs);
			}
			else {
				return new ModelAndView("error", "msg", "Cannot retreive login details. Login before viewing page");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	

}
