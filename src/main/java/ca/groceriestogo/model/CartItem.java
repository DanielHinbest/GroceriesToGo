package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The cart item class is a model for the items that are in a cart
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Cart Item")
public class CartItem {
	/**
	 * ID number for the cart item
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cart_item_id")
	private int cartItemId;
	/**
	 * The quantity of items being purchased
	 */
	private int quantity;
	/**
	 * The cost of the item
	 */
	private int cost;
	
	/**
	 * Get the cart item ID
	 * @return the cartItemId
	 */
	public int getCartItemId() {
		return cartItemId;
	}
	/**
	 * Set the cart item id
	 * @param cartItemId the cartItemId to set
	 */
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	/**
	 * Get the item quantity
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * Set the item quantity
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	/**
	 * Get the item cost
	 * @return the cost
	 */
	public int getCost() {
		return cost;
	}
	/**
	 * Set the item cost
	 * @param cost the cost to set
	 */
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
}
