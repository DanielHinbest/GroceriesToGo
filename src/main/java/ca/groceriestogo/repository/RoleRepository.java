package ca.groceriestogo.repository;

import ca.groceriestogo.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
	
}