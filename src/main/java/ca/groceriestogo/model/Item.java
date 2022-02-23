package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The item class is a model for the items that a store would sell
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Item")
public class Item {
	/**
	 * The ID for an item
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="item_id")
	private int itemId;
	/**
	 * The name of an item
	 */
	@Column(name="item_name")
	private String itemName;
	/**
	 * The item brand
	 */
	@Column(name="item_brand")
	private String itemBrand;
	/**
	 * The availability of an item's stock
	 */
	@Column(name="item_stock")
	private int itemStock;
	/**
	 * The cost of an item
	 */
	@Column(name="item_cost")
	private double itemCost;
	
	/**
	 * Get the ID number for the item
	 * @return the itemId
	 */
	public int getItemId() {
		return itemId;
	}
	/**
	 * Set the Item ID
	 * @param itemId the item ID to set
	 */
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	/**
	 * Get the item name
	 * @return the item name
	 */
	public String getItemName() {
		return itemName;
	}
	/**
	 * Set the item name
	 * @param itemName the item name to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	/**
	 * Get the item brand
	 * @return the item brand
	 */
	public String getItemBrand() {
		return itemBrand;
	}
	/**
	 * Set the item brand
	 * @param itemBrand the item brand to set
	 */
	public void setItemBrand(String itemBrand) {
		this.itemBrand = itemBrand;
	}
	/**
	 * Get the item stock
	 * @return the item stock
	 */
	public int getItemStock() {
		return itemStock;
	}
	/**
	 * Set the item stock
	 * @param itemStock the item stock to set
	 */
	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}
	/**
	 * Get the item's cost
	 * @return the item cost
	 */
	public double getItemCost() {
		return itemCost;
	}
	/**
	 * Set the item cost
	 * @param itemCost the item cost to set
	 */
	public void setItemCost(double itemCost) {
		this.itemCost = itemCost;
	}
	
	
}
