package com.www.Hired.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.www.Hired.pojo.Employer;
import com.www.Hired.pojo.Job;

public class JobDAO extends DAO{
	
	public Job createJob(Job job) throws Exception {
		
		try {
			begin();
			getSession().save(job);
			commit();
			close();
//			return seeker;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not save job " + e);
		}
		return job;
	}
	
	public List<Job> getJobList() throws Exception{
		try {
			begin();
			Query q = getSession().createQuery("from Job");
			List<Job> joblist = q.list();
			commit();
			close();
			return joblist;
		}
		catch(HibernateException ex) {
			rollback();
			throw new Exception("Failed to retrieve jobs" + ex);
		}
		
	}
	
	public List<Job> getJobListByOrg(String org) throws Exception{
		
		try {
			begin();
			Query q = getSession().createQuery("from Job where postedby= :org");
			q.setString("org", org);		
			List<Job> joblist = q.list();
//			System.out.println();
			commit();
			close();
			return joblist;
		}
		catch(HibernateException ex) {
			rollback();
			throw new Exception("Failed to retrieve jobs" + ex);
		}
	}
	
	public Job getJobById(int jobid) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from Job where jobId= :jbid");
			q.setInteger("jbid", jobid);		
			Job job = (Job) q.uniqueResult();
//			System.out.println();
			commit();
			close();
			return job;
		}
		catch(HibernateException ex) {
			rollback();
			throw new Exception("Failed to retrieve job" + ex);
		}
//		return null;
		
	}
	
	public Job updateJob(Job job) throws Exception {
		try {
			begin();
			getSession().update(job);
			commit();
			close();
//			return seeker;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not update job " + e);
		}
		return job;
	}
	
	public void deleteJob(int jobid) throws Exception{
		
		try {
			Job job = getJobById(jobid);
			begin();
			getSession().delete(job);
			commit();
			close();
		}
		catch (HibernateException e) {
			rollback();
			throw new Exception("Could not delete job " + e);
		}
	}
}
