package com.www.Hired.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name="jobtable")
public class Job implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="jobID", unique = true, nullable = false)
	int jobId;
	
	@Column(name="jobtitle")
	String jobTitle;
	
	@Column(name="description")
	String description;
	
	@Column(name="postedon")
	Date postedOn;
	
	@Column(name="postedby")
	String postedBy;
	
	@Column(name="status")
	boolean status;
	
	@Column(name="location")
	String location;
	
	@Column(name="skills")
	String skills;
	
	@ManyToMany(mappedBy="appliedJobs", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private Set<JobSeeker> seekers = new HashSet<JobSeeker>();

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPostedOn() {
		return postedOn;
	}

	public void setPostedOn(Date postedOn) {
		this.postedOn = postedOn;
	}

	public String getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public Set<JobSeeker> getSeekers() {
		return seekers;
	}

	public void setSeekers(Set<JobSeeker> seekers) {
		this.seekers = seekers;
	}
	
	
	
}
