package ca.groceriestogo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

/**
 * The implementation class for the Security Service interface. This class operates
 * the security services and defines the functions
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
@Service
public class SecurityServiceImpl implements SecurityService {
	/**
	 * The class to manage the user authentication
	 */
	@Autowired
	private AuthenticationManager authenticationManager;
	
	/**
	 * An instance of the User Details
	 */
	@Autowired
	private UserDetailsService userDetailsService;
	
	/**
	 * The logger for the operations
	 */
	private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);
	
	/**
	 * Search for the logged in username
	 */
	@Override
	public String findLoggedInUsername() {
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
		if (userDetails instanceof UserDetails) {
			return ((UserDetails) userDetails).getUsername();
		}
		return null;
	}
	
	/**
	 * Login the user with the username and password provided
	 */
	@Override
	public void autologin(String username, String password) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = 
				new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
		
		authenticationManager.authenticate(usernamePasswordAuthenticationToken);
		
		if (usernamePasswordAuthenticationToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
			logger.debug(String.format("Auto login %s successful!", username));
		}
	}
}