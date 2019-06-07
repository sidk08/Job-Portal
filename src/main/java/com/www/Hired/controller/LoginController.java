package com.www.Hired.controller;

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
import com.www.Hired.dao.UserDAO;
import com.www.Hired.pojo.Employer;
import com.www.Hired.pojo.JobSeeker;
import com.www.Hired.pojo.User;
import com.www.Hired.validator.EmployerValidator;
import com.www.Hired.validator.SeekerValidator;

@Controller
@RequestMapping(value="/user")
public class LoginController {
	
	@Autowired
	@Qualifier("daoFac")
	DaoFactory df;
	
	@Autowired
	@Qualifier("emValidator")
	EmployerValidator emvalidator;
	
	@Autowired
	@Qualifier("jbsValidator")
	SeekerValidator jbsvalidator;

	@InitBinder("em")
	private void initEmployerBinder(WebDataBinder binder) {
		binder.setValidator(emvalidator);
	}
	@InitBinder("jbs")
	private void initSeekerBinder(WebDataBinder binder) {
		binder.setValidator(jbsvalidator);
	}
	
	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public ModelAndView authenticateUser(@RequestParam("username")String username, @RequestParam("password")String password, HttpServletRequest req){
		
		ModelAndView mv= new ModelAndView("error", "msg", "Invalid username/password");
		
		if(username.trim().equals("") || password.trim().equals("")) {
			return mv;
		}
		
		UserDAO udao = df.createUserDAO();
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u=udao.authenticateUser(u);
		
		if(u !=null) {
			String role = u.getRole();
			req.getSession().setAttribute("user", u);
			if(role != null) {
				if(role.equalsIgnoreCase("ADMIN")) {
					mv = new ModelAndView("redirect:/admin/");}
				else if(role.equalsIgnoreCase("SEEKER")) {
					mv = new ModelAndView("redirect:/seeker/");
				}
				else if (role.equalsIgnoreCase("EMPLOYER")) {
					mv = new ModelAndView("redirect:/employer/");
				}
			}
		}

		return mv;
	}
	
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView createUser(@RequestParam("type")String type) {
		if(type.equalsIgnoreCase("employer")){
			Employer em = new Employer();
		return new ModelAndView("employerRegister","em", em);
		}
	else
	{	
		JobSeeker jbs = new JobSeeker();
		return new ModelAndView("seekerRegister","jbs", jbs);
	}
	}
	
	@RequestMapping(value="/createSeeker", method=RequestMethod.POST)
	public ModelAndView saveSeeker(@RequestParam("username")String username, @RequestParam("password")String password, 
			 @RequestParam("firstname")String firstname, @RequestParam("lastname") String lastname, HttpServletRequest req) throws Exception {
	//ModelAndView mv = new ModelAndView("LoginSuccess", "msg", "User created");
		
		JobSeeker jbs = new JobSeeker();
		
		jbs.setUsername(username);
		jbs.setPassword(password);
		jbs.setFirstname(firstname);
		jbs.setLastname(lastname);
		jbs.setRole("SEEKER");
		
    	UserDAO udao = df.createUserDAO();
		
		udao.createSeeker(jbs);
		
		req.getSession().setAttribute("user", jbs);
		return new ModelAndView("seekerPage");
	}
	
	@RequestMapping(value="/createEmployer", method=RequestMethod.POST)
	public ModelAndView saveEmployer(@RequestParam("username")String username, @RequestParam("password")String password, 
									 @RequestParam("org")String org, @RequestParam("industry") String industry, HttpServletRequest req ) throws Exception {
//		ModelAndView mv = new ModelAndView("LoginSuccess", "msg", "User created");
		
		Employer em = new Employer();
		
		em.setUsername(username);
		em.setPassword(password);
		em.setOrganization(org);
		em.setIndustry(industry);
		em.setRole("EMPLOYER");
		
		UserDAO udao = df.createUserDAO();
		
		udao.createEmployer(em);

		req.getSession().setAttribute("user", em);
		return new ModelAndView("employerPage");
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest req) {
		
		if(req.getSession(false).getAttribute("em") == null) {
			if(req.getSession(false).getAttribute("jbs") == null) {
			return new ModelAndView("error", "msg", "Please log in, before logging out");
			}
		}
//		else {
		
		req.getSession(false).invalidate();
		return new ModelAndView("logoutPage");
//	}
	}
}
