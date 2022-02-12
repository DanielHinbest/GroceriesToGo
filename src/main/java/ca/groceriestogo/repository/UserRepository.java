package ca.groceriestogo.repository;

import ca.groceriestogo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * A new repository inheriting from the JpaRepository to store the user details and search for a 
 * user.
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 *
 */
public interface UserRepository extends JpaRepository<User, Long> {
	/**
	 * Search for a user by the username
	 * @param username the username for the user to search for
	 * @return the user details with the username provided
	 */
	User findByUsername(String username);
}