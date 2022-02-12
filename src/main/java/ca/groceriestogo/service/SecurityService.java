package ca.groceriestogo.service;

/**
 * The Security Service interface holds methods for checking who is logged in
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
public interface SecurityService {
	/**
	 * Function declaration to check if a user is logged in and find their username
	 * @return the username
	 */
	String findLoggedInUsername();
	
	/**
	 * Function declaration for logging in a user
	 * @param username the username for the user
	 * @param password the password for the user
	 */
	void autologin(String username, String password);
}