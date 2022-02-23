package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The order details for a customer
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Order")
public class Order {
	/**
	 * The order ID number
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="order_id")
	private int orderId;
	/**
	 * The overall cost of the order
	 */
	@Column(name="order_cost")
	private int orderCost;
	/**
	 * The number of items ordered
	 */
	@Column(name="number_of_items")
	private int numberOfItems;
	/**
	 * The date the order was placed
	 */
	@Column(name="orderDate")
	private int orderDate;
	
	/**
	 * Gets the order ID number
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}
	/**
	 * Sets the order ID number
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	/**
	 * Gets the cost of the order
	 * @return the orderCost
	 */
	public int getOrderCost() {
		return orderCost;
	}
	/**
	 * Sets the cost of the order
	 * @param orderCost the orderCost to set
	 */
	public void setOrderCost(int orderCost) {
		this.orderCost = orderCost;
	}
	/**
	 * Gets the number of items
	 * @return the numberOfItems
	 */
	public int getNumberOfItems() {
		return numberOfItems;
	}
	/**
	 * Sets the number of items
	 * @param numberOfItems the numberOfItems to set
	 */
	public void setNumberOfItems(int numberOfItems) {
		this.numberOfItems = numberOfItems;
	}
	/**
	 * Gets the order date
	 * @return the orderDate
	 */
	public int getOrderDate() {
		return orderDate;
	}
	/**
	 * Sets the order date
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(int orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
