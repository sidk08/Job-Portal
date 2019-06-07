package com.www.Hired.dao;

import com.www.Hired.dao.*;

public class DaoFactory {
	
	public UserDAO createUserDAO() {
		return new UserDAO();
	}
	
	public AdminDAO createMessageDAO() {
		return new AdminDAO();
	}
	
	public JobDAO createJobDAO() {
		return new JobDAO();
	}

}
