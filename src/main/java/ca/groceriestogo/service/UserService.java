package ca.groceriestogo.service;

import ca.groceriestogo.model.User;

public interface UserService {
	void save(User user);
	
	User findByUsername(String username);
}