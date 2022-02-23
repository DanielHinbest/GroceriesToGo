/**
 * 
 */
package ca.groceriestogo.model;

import javax.persistence.*;
// Maybe build something similar to UserRoles with this?
//import java.util.Set;

/**
 * The store class is a model for a store that would be accessible on the website for ordering from
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Store")
public class Store {
	/**
	 * The unique ID for the store
	 */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="store_id")
	private int storeId;    
    /**
     * The store's name
     */
    @Column(name="store_name")
    private String storeName;
    /**
     * The phone number to contact the store
     */
    @Column(name="phone_number")
    private String phoneNumber;
    /**
     * The street address for the store
     */
    @Column(name="address_line_1")
    private String addressLine1;
    /**
     * The additional street address information for the store
     */
    @Column(name="address_line_2")
    private String addressLine2;
    /**
     * The city the store is located in
     */
    private String city;
    /**
     * The province the store is located in
     */
    private String province;
    /**
     * The store's postal code
     */
    @Column(name="postal_code")
    private String postalCode;
    
	/**
	 * Gets the store ID
	 * @return the store ID
	 */
	public int getStoreId() {
		return storeId;
	}
	/**
	 * Sets the store ID
	 * @param storeId the store ID to set
	 */
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	/**
	 * Gets the store name
	 * @return the store name
	 */
	public String getStoreName() {
		return storeName;
	}
	/**
	 * Sets the store name
	 * @param storeName the store name to set
	 */
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	/**
	 * Gets the phone number
	 * @return the phone number
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}
	/**
	 * Sets the phone number
	 * @param phoneNumber the phone number to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	/**
	 * Get the first address line
	 * @return the address line 1
	 */
	public String getAddressLine1() {
		return addressLine1;
	}
	/**
	 * Set the first address line
	 * @param addressLine1 the address line 1 to set
	 */
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	/** 
	 * Get the second address line
	 * @return the addressLine2
	 */
	public String getAddressLine2() {
		return addressLine2;
	}
	/**
	 * Set the address line 2
	 * @param addressLine2 the addressLine2 to set
	 */
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	/**
	 * Get the city
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * Set the city
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * Get the province
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}
	/**
	 * Set the province
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	 * Get the postal code
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}
	/**
	 * Set the postal code
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
    
    
}
