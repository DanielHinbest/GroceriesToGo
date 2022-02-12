package ca.groceriestogo.service;

import ca.groceriestogo.model.User;
import ca.groceriestogo.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

/**
 * The implementation of the user service interface
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
@Service
public class UserServiceImpl implements UserService {
	/**
	 * An instance of a user repository
	 */
    @Autowired
    private UserRepository userRepository;
    /**
     * An instance of the role repository
     */
    @Autowired
    private RoleRepository roleRepository;
    /**
     * An instance of the BCrypt encoder to hash passwords
     */
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * Save the new user into the database and hash the password in BCrypy
     */
    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    /**
     * Search for a new user to verify it exists
     */
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    /**
     * Search for a new user to verify it exists
     */
    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}