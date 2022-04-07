package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The product class is a model for the products that a store would sell
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Product")
public class Product {
	/**
	 * The ID for an product
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="product_id")
	private int productId;
	/**
	 * The name of an product
	 */
	@Column(name="product_name")
	private String productName;
	/**
	 * The product brand
	 */
	@Column(name="product_brand")
	private String productBrand;
	/**
	 * The availability of an product's stock
	 */
	@Column(name="product_stock")
	private int productStock;
	/**
	 * The cost of an product
	 */
	@Column(name="product_cost")
	private double productCost;

	@Column(name = "product_image")
	private String productImage;

	@Column(name = "department_id")
	private int departmentId;

	@Column(name = "store_id")
	private int storeId;
	
	/**
	 * Get the ID number for the product
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * Set the product ID
	 * @param productId the product ID to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	/**
	 * Get the product name
	 * @return the product name
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * Set the product name
	 * @param productName the product name to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * Get the product brand
	 * @return the product brand
	 */
	public String getProductBrand() {
		return productBrand;
	}
	/**
	 * Set the product brand
	 * @param productBrand the product brand to set
	 */
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	/**
	 * Get the product stock
	 * @return the product stock
	 */
	public int getProductStock() {
		return productStock;
	}
	/**
	 * Set the product stock
	 * @param productStock the product stock to set
	 */
	public void getProductStock(int productStock) {
		this.productStock = productStock;
	}
	/**
	 * Get the product's cost
	 * @return the product cost
	 */
	public double getProductCost() {
		return productCost;
	}
	/**
	 * Set the product cost
	 * @param productCost the product cost to set
	 */
	public void setProductCost(double productCost) {
		this.productCost = productCost;
	}

	public String getProductImage() { return productImage; }
	public void setProductImage(String productImage) { this.productImage = productImage; }

	public int getDepartmentId() { return departmentId; }
	public void setDepartmentId(int departmentId) { this.departmentId = departmentId; }

	public int getStoreId() { return storeId; }
	public void setStoreId(int storeId) { this.storeId = storeId; }
	
	
}
