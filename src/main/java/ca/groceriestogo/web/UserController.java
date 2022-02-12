package ca.groceriestogo.web;

import ca.groceriestogo.model.User;
import ca.groceriestogo.service.UserService;
import ca.groceriestogo.service.SecurityService;
import ca.groceriestogo.validator.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * A controller class designed for handling the routing and functionality of the application
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
@Controller
public class UserController {
	/**
	 * A new instance of the user service
	 */
	@Autowired
	private UserService userService;
	/**
	 * A new instance of the security service
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 * A new instance of the user validator
	 */
	@Autowired
	private UserValidator userValidator;
	
	/**
	 * The routing for the registration form in GET method
	 * @param model The user model required to perform the actions
	 * @return {String} The registration view
	 */
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		
		return "registration";
	}
	
	/**
	 * The routing and functionality for the registration form in POST method
	 * @param userForm the content in the form
	 * @param bindingResult the result of the input
	 * @param model The user model
	 * @return a redirection to the welcome view
	 */
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);
		
		if (bindingResult.hasErrors()) {
			return "registration";
		}
		
		userService.save(userForm);
		
		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());
		
		return "redirect:/index"; 
	}
	
	/**
	 * The login routing when the view is in GET method
	 * @param model The user model
	 * @param error The errors from the form
	 * @param logout The user logout
	 * @return The login view
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null){
			model.addAttribute("error", "Your username and password is invalid.");
		}
		
		if (logout != null) {
			model.addAttribute("message", "You have been logged out successfully");
		}
		
		return "login";
	}
	
	/**
	 * The routing for the home page after a successful login
	 * @param model The user model that is logged in
	 * @return The home page view
	 */
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String welcome(Model model) {
		return "index";
	}
}