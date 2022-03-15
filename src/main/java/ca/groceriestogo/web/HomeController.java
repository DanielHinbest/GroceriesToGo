package ca.groceriestogo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * A controller class designed for handling the routing and functionality of the main details
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-03-02)
 * @since 1.0
 */
@Controller
public class HomeController {
	/**
	 * The routing for the home page after a successful login
	 * @param model The user model that is logged in
	 * @return The home page view
	 */
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Model model) {
		return "index";
	}
	/**
     * Test file route
     * @param model The model being passed
     * @return the test view
     **/
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		return "test";
	}
	/**
     * About file route
     * @param model The model being passed
     * @return the test view
     **/
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		return "about";
	}
		
	/**
     * Order History file route
     * @param model The model being passed
     * @return the test view
     **/
	@RequestMapping(value = "/order_history", method = RequestMethod.GET)
	public String orderhistory(Model model) {
		return "orderhistory";
	}
	
	/**
	 * Cart file route
	 * @param model the model with the information for the view
	 * @return the cart view
	 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model) {
		return "cart";
	}
	
	/**
	 * Privacy Policy file route
	 * @param model the model with the information for the view
	 * @return the privacy policy view
	 */
	@RequestMapping(value = "/privacypolicy", method = RequestMethod.GET)
	public String privacypolicy(Model model) {
		return "privacypolicy";
	}
	
	/**
	 * FAQ file route
	 * @param model the model with the information for the view
	 * @return the privacy policy view
	 */
	@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
	public String faq(Model model) {
		return "faq";
	}
}
