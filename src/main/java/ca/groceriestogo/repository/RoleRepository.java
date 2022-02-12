package ca.groceriestogo.repository;

import ca.groceriestogo.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Create a Role Repository that inherits from the JpaRepository. This holds a repository of 
 * the roles for the system
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
public interface RoleRepository extends JpaRepository<Role, Long>{
	
}