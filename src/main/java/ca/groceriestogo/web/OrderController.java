package ca.groceriestogo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
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
	 * Cart redirect to checkout
	 * @param model A model with content
	 * @return a redirect to checkout
	 */
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartRedirect(Model model) {
		return "redirect:/checkout";
	}
	
	/**
	 * Checkout page
	 * @param model A model with content
	 * @return the checkout view
	 */
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Model model) {
		return "checkout";
	}
}
