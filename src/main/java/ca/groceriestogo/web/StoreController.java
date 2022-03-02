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
	public String storeItems(Model model, @PathVariable int store_id) {		
		model.addAttribute("store", store_id);
		return "store_items";
	}
	
	/**
     * Store locator file route
     * @param model The model being passed
     * @return the test view
     **/
	@RequestMapping(value = {"/storelocator"}, method = RequestMethod.GET)
	public String storelocator(Model model) {
		return "storelocator";
	}
}
