package com.www.Hired.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="employertable")
@PrimaryKeyJoinColumn(name = "userid")
public class Employer extends User{
	
	@Column(name="organization")
	String organization;
	
	@Column(name="industry")
	String industry;
	
	public Employer() {
		super();
	}

	public Employer(String organization, String industry) {
		super();
		this.organization = organization;
		this.industry = industry;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	
}
