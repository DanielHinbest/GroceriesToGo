package ca.groceriestogo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	 * Adds an item to the cart and redirects back to the list
	 * @param model A model with attributes
	 * @return The redirect to the item list
	 */
	@RequestMapping(value = "/stores/{store_id}/{product_id}/add", method = RequestMethod.GET)
	public String addItemToCart(Model model, @PathVariable int product_id, @PathVariable int store_id) {
		model.addAttribute("store", store_id);
		model.addAttribute("product", product_id);
		return "add_item_to_cart";
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
	
	@RequestMapping(value="/cart/{cart_item_id}", method=RequestMethod.GET)
	public String removeItemFromCart(Model model, @PathVariable int cart_item_id) {
		model.addAttribute("cart_item", cart_item_id);
		return "remove_item_from_cart";
	}
}
