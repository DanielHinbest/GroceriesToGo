package ca.groceriestogo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * A controller class designed for handling the routing and functionality of the store information
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-03-01)
 * @since 1.0
 */
@Controller
public class StoreController {
	
	/**
	 * The home page for the store listings
	 * @param model The model information for the stores
	 * @return The stores view
	 */
	@RequestMapping(value="/stores", method=RequestMethod.GET)
	public String storeHome(Model model) {		
		return "stores";
	}
	
	/**
	 * The home page for a store with the item list
	 * @param model The model with store details
	 * @param store_id The store ID for the store visited
	 * @return The store items view
	 */
	@RequestMapping(value="/stores/{store_id}", method=RequestMethod.GET)
	public String storeProducts(Model model, @PathVariable int store_id) {		
		model.addAttribute("store", store_id);
		return "store_products";
	}
	
	/**
	 * A product view
	 * @param model The model with product details
	 * @param store_id The store ID
	 * @param product_id The product ID
	 * @return the product view
	 */
	@RequestMapping(value="/stores/{store_id}/{product_id}", method=RequestMethod.GET)
	public String productView(Model model, @PathVariable int store_id, @PathVariable int product_id) {
		model.addAttribute("store", store_id);
		model.addAttribute("product", product_id);
		return "product";
	}
	
	/**
     * Store locator file route
     * @param model The model being passed
     * @return the test view
     **/
	@RequestMapping(value = "/store_locator", method = RequestMethod.GET)
	public String storelocator(Model model) {
		return "storelocator";
	}
}
