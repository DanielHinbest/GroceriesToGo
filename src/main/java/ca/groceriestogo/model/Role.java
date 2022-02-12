package ca.groceriestogo.model;

import javax.persistence.*;
import java.util.Set;

/**
 * The Role class is the model of a role a system user can have. This model is a database entity 
 * and represents the role table in the database
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
@Entity
@Table(name = "role")
public class Role {
	/**
	 * The role ID
	 */
    private Long id;
    /**
     * The name of the role
     */
    private String name;
    /**
     * A set of users in the system. This creates a relationship to the User model
     */
    private Set<User> users;

    /**
     * Return the role ID to the program
     * @return The role ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    /**
     * Set the value of the role ID
     * @param id The role ID
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Return the name of the role to the program
     * @return The role name
     */
    public String getName() {
        return name;
    }

    /**
     * Set the value of the role name
     * @param name The name of the role
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Return a set of users using a many-to-many relationship between the roles and users
     * @return A list of users
     */
    @ManyToMany(mappedBy = "roles")
    public Set<User> getUsers() {
        return users;
    }

    /**
     * Create a set of users based on the users provided
     * @param users A set of users
     */
    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
