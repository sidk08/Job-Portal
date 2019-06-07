package com.www.Hired.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name="jobseekertable")
@PrimaryKeyJoinColumn(name = "userid")
public class JobSeeker extends User {
	
	@Column(name="firstname")
	String firstname;
	
	@Column(name="lastname")
	String lastname;
	
	@Column(name="email")
	String email;
	
	@Column(name="exp")
	int exp;
	
	@Column(name="address")
	String address;
	
	@Column(name="primaryskill")
	String primarySkill;
	
	@Column(name="secondskill")
	String secondSkill;
	
	@Column(name="otherskill")
	String otherSkill;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinTable (
       name="seeker_job_table",
       joinColumns = {@JoinColumn(name="userID", nullable = false, updatable=true)},
       inverseJoinColumns = {@JoinColumn(name="jobID" )}
    )
	private Set<Job> appliedJobs = new HashSet<Job>();
	
	public JobSeeker() {
		super();
	}

	public JobSeeker(String firstname, String lastname, String email, int exp, String address, String primarySkill,
			String secondSkill, String otherSkill) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.exp = exp;
		this.address = address;
		this.primarySkill = primarySkill;
		this.secondSkill = secondSkill;
		this.otherSkill = otherSkill;
	}
	
	
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrimarySkill() {
		return primarySkill;
	}

	public void setPrimarySkill(String primarySkill) {
		this.primarySkill = primarySkill;
	}

	public String getSecondSkill() {
		return secondSkill;
	}

	public void setSecondSkill(String secondSkill) {
		this.secondSkill = secondSkill;
	}

	public String getOtherSkill() {
		return otherSkill;
	}

	public void setOtherSkill(String otherSkill) {
		this.otherSkill = otherSkill;
	}

	public Set<Job> getAppliedJobs() {
		return appliedJobs;
	}

	public void setAppliedJobs(Set<Job> appliedJobs) {
		this.appliedJobs = appliedJobs;
	}
	
	
}
