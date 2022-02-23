package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The department class is a model grouping the items that a store would sell
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-02-19)
 * @since 1.0
 */
@Entity
@Table(name = "Department")
public class Department {
	/**
	 * The ID for a department
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="department_id")
	private int departmentId;
	/**
	 * The name of the department
	 */
	@Column(name="department_name")
	private String departmentName;
	
	/**
	 * Get the deparment ID
	 * @return the department ID
	 */
	public int getDepartmentId() {
		return departmentId;
	}
	/**
	 * Set the department ID
	 * @param departmentId the department ID to set
	 */
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	/**
	 * Get the department name
	 * @return the department name
	 */
	public String getDepartmentName() {
		return departmentName;
	}
	/**
	 * Set the department name
	 * @param departmentName the department name to set
	 */
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	
}
