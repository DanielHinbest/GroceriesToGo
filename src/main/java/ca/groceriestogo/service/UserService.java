package ca.groceriestogo.service;

import ca.groceriestogo.model.User;

/**
 * An interface that creates a function to save a user and to search for a username from the
 * database
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
public interface UserService {
	/**
	 * Save the user into the database
	 * @param user The user information
	 */
	void save(User user);
	
	/**
	 * Search for the user in the database to see if it exists
	 * @param username the username being used for the search
	 * @return The user class found in the database
	 */
	User findByUsername(String username);
	

	/**
	 * Search for the user in the database to see if it exists
	 * @param email the email being used for the search
	 * @return The user class found in the database
	 */
	User findByEmail(String email);
}