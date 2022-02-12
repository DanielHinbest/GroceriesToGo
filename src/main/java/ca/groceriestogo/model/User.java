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
     * The user's email address
     */
    private String email;
    /**
     * The password for the user which is used to login to the website
     */
    private String password;
    /**
     * The password confirmation that is set when the user registers with the website.
     */
    private String passwordConfirm;
    /**
     * The first name of the user
     */
    private String firstName;
    /**
     * The last name of the user
     */
    private String lastName;
    /**
     * The user's birthday
     */
    private String dateOfBirth;
    /**
     * The address for the user
     */
    private String addressLine1;
    /**
     * The additional address details for the user
     */
    private String addressLine2;
    /**
     * The city of the user
     */
    private String city;
    /**
     * The province of the user
     */
    private String province;
    /**
     * The user's postal code
     */
    private String postalCode;
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
     * Return the user's email address
     * @return the email address
     */
    public String getEmail() {
		return email;
	}

    /**
     * Set the user's email address
     * @param email The email address
     */
	public void setEmail(String email) {
		this.email = email;
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
     * Return the user's first name
     * @return the first name
     */
    public String getFirstName() {
		return firstName;
	}

    /**
     * Set the user's last name
     * @param firstName the user's first name
     */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * Return the user's last name
	 * @return the user's last name
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Set the user's last name
	 * @param lastName the user's last name
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * Return the date of birth
	 * @return the user's date of birth
	 */
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	/**
	 * Set the user's date of birth
	 * @param dateOfBirth the date of birth
	 */
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	/**
	 * Return the user's address
	 * @return the user's address
	 */
	public String getAddressLine1() {
		return addressLine1;
	}

	/**
	 * Set the user's address 
	 * @param addressLine1 the address
	 */
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	/**
	 * Return the additional address details
	 * @return the additional address details
	 */
	public String getAddressLine2() {
		return addressLine2;
	}

	/**
	 * Set the additional address details
	 * @param addressLine2 additional address details
	 */
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	
	/**
	 * Return the user's city
	 * @return the user's city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * Set the user's city
	 * @param city The user's city
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * Return the user's province
	 * @return The user's province
	 */
	public String getProvince() {
		return province;
	}
	
	/**
	 * Set the user's province
	 * @param province the user's province
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * Return the user's postal code
	 * @return the postal code
	 */
	public String getPostalCode() {
		return postalCode;
	}

	/**
	 * Set the user's postal code
	 * @param postalCode the postal code
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
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