package com.www.Hired.dao;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
//import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.criterion.Example;

import com.www.Hired.pojo.Employer;
import com.www.Hired.pojo.JobSeeker;
import com.www.Hired.pojo.User;

public class UserDAO extends DAO{
	
	public User authenticateUser(User user) {
		
		Criteria c = getSession().createCriteria(User.class);
		
		c.add(Example.create(user));
		
		User u = (User) c.uniqueResult();
		
		return u;
	}
	
	public JobSeeker getSeeker(int id) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from JobSeeker where userid= :userid");
			q.setInteger("userid", id);		
			JobSeeker seeker = (JobSeeker) q.uniqueResult();
			commit();
			close();
			return seeker;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get jobseeker " + id, e);
//			System.out.println(e);
		}
		
	}
	
	public JobSeeker getSeekerByUsername(int id) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from JobSeeker where userid= :userid");
			q.setInteger("userid", id);		
			JobSeeker seeker = (JobSeeker) q.uniqueResult();
			commit();
			close();
			return seeker;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get jobseeker " + id, e);
//			System.out.println(e);
		}
		
	}
	
	public void createSeeker(JobSeeker jb) throws Exception {
		
		try {
			begin();
			getSession().save(jb);
			commit();
			close();
//			return seeker;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not save jobseeker " + e);
		}
		
	}
	
	public Employer getEmployer(int id) throws Exception{
		
		try {
			begin();
			Query q = getSession().createQuery("from Employer where userid= :userid");
			q.setInteger("userid", id);		
			Employer em = (Employer) q.uniqueResult();
			System.out.println(em);
			commit();
			close();
			return em;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get employer " + id, e);
//			System.out.println(e);
		}
	}
	
	public void createEmployer(Employer em) throws Exception{
		
		try {
			begin();
			getSession().save(em);
			commit();
			close();
//			return em;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not save employer " + e);
//			System.out.println(e);
		}
	}
	
	public void updateSeeker(JobSeeker jbs) throws Exception{
		try {
			begin();
			getSession().update(jbs);
			commit();
			close();
		} catch (Exception e) {
			rollback();
			throw new Exception("Could not update seeker " + e);// TODO: handle exception
		}
	}
}
