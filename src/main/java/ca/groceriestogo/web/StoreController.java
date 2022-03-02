package ca.groceriestogo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {
	
	@RequestMapping(value="/store/{store_id}", method=RequestMethod.GET)
	public String storeHome(Model model, @PathVariable int store_id) {		
		model.addAttribute("store", store_id);
		return "store";
	}
}
