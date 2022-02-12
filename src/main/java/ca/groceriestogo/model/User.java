package ca.groceriestogo.model;

import javax.persistence.*;
import java.util.Set;

/**
 * The User class is a model representing the users of the system. This is a database entity
 * and represents the user table in the database.
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @serial 1.0
 */
@Entity
@Table(name = "user")
public class User {
	/**
	 * The auto generated user ID field for the database
	 */
    private Long id;
    /**
     * The user name that the user uses to login to the website
     */
    private String username;
    /**
     * The password for the user which is used to login to the website
     */
    private String password;
    /**
     * The password confirmation that is set when the user registers with the website.
     */
    private String passwordConfirm;
    /**
     * A set of roles that a user might be assigned with the website
     */
    private Set<Role> roles;

    /**
     * Return the auto generated ID
     * @return The user ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    /**
     * Set the user ID value
     * @param id The user ID
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Return the user name
     * @return The user name
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the value of the username
     * @param username the username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Return the password from the database
     * @return The hashed password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the user password
     * @param password the password for the user
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get the password confirmation. This checks to confirm the password is correct.
     * @return the password confirmation
     */
    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    /**
     * Set the value for the password confirmation. This does not get stored in the database but
     * is used to confirm the passwords match
     * @param passwordConfirm The confirmation password
     */
    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    /**
     * Using a join table return a set of roles for the user
     * @return the user roles
     */
    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    /**
     * Create a set of roles that the user can have
     * @param roles The set of roles
     */
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}