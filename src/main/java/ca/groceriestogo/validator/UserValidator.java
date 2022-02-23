package ca.groceriestogo.validator;

import ca.groceriestogo.model.User;
import ca.groceriestogo.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * A class to validate and authenticate a user into the website
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-12)
 * @since 1.0
 */
@Component
public class UserValidator implements Validator {
	/**
	 * Create a new instance of the user service
	 */
	@Autowired
	private UserService userService;
	
	/**
	 * Function to verify the user classes are equal
	 */
	@Override 
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}
	
	/**
	 * Validate a user when they log in
	 */
	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
		if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
			errors.rejectValue("username", "Size.userForm.username");
		}
		if (userService.findByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", "Duplicate.userForm.username");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (user.getEmail().length() < 2) {
			errors.rejectValue("email", "Size.userForm.email");
		}
		if (userService.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "Duplicate.userForm.email");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty");
		if (user.getPhone().length() != 12) {
			errors.rejectValue("phone", "Size.userForm.phone");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}
		
		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
		if (user.getFirstName().length() < 2) {
			errors.rejectValue("firstName", "Size.userForm.firstName");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
		if (user.getLastName().length() < 2) {
			errors.rejectValue("lastName", "Size.userForm.lastName");
		}
		
		/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dateOfBirth", "NotEmpty");
		if (user.getLastName().length() < 2) {
			errors.rejectValue("dateOfBirth", "Size.userForm.DOB");
		}*/
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressLine1", "NotEmpty");
		if (user.getAddressLine1().length() < 2) {
			errors.rejectValue("addressLine1", "Size.userForm.addressLine1");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "NotEmpty");
		if (user.getCity().length() < 2) {
			errors.rejectValue("city", "Size.userForm.city");
		}
		
		if (user.getProvince() == "") {
			errors.rejectValue("province", "Size.userForm.province");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "postalCode", "NotEmpty");
		if (user.getPostalCode().length() < 6 || user.getPostalCode().length() > 7) {
			errors.rejectValue("postalCode", "Size.userForm.postalCode");
		}
	}
}