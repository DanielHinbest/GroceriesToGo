package ca.groceriestogo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.*;
import java.util.Vector;

/**
 * The data access for the store
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-03-16)
 * @since 1.0
 */
public class StoreDA {

	/**
	 * A vector of stores
	 */
    static Vector<Store> stores = new Vector<Store>();
    /**
     * A vector of recommended stores
     */
    static Vector<Store> recommendedStores = new Vector<Store>();
    /**
     * A store object
     */
    static Store aStore;
    /**
     * A connnection
     */
    static Connection aConnection;
    /**
     * A statement
     */
    static Statement aStatement;

    /**
     * The unique ID for the store
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="store_id")
    static int storeId;
    /**
     * The store's name
     */
    @Column(name="store_name")
    static String storeName;
    /**
     * The phone number to contact the store
     */
    @Column(name="phone_number")
    static String phoneNumber;
    /**
     * The street address for the store
     */
    @Column(name="address_line_1")
    static String addressLine1;
    /**
     * The additional street address information for the store
     */
    @Column(name="address_line_2")
    static String addressLine2;
    /**
     * The city the store is located in
     */
    static String city;
    /**
     * The province the store is located in
     */
    static String province;
    /**
     * The store's postal code
     */
    @Column(name="postal_code")
    static String postalCode;

    /**
     * initializes the connection to the database
     * @param c the connection value
     * */
    public static void initialize(Connection c)
    {
        try {
            aConnection=c;
            aStatement=aConnection.createStatement();
        }
        catch (SQLException e)
        { System.out.println(e);	}
    }

    /**
     * terminates the connection from the database
     * */
    public static void terminate()
    {
        try
        { 	// close the statement
            aStatement.close();
        }
        catch (SQLException e)
        { System.out.println(e);	}
    }
    /**
     * Retrieve all the stores
     * @return  the stores
     */
    public static Vector<Store> retrieveAll() {
        try
        {
            // execute the SQL query statement
            PreparedStatement psRetrieveAll = aConnection.prepareStatement("SELECT * FROM Store ");
            ResultSet rs = ((PreparedStatement) psRetrieveAll).executeQuery();
            boolean moreData = rs.next();

            while (moreData) {
                storeId = rs.getInt("store_id");
                storeName = rs.getString("store_name");
                phoneNumber = rs.getString("phone_number");
                addressLine1 = rs.getString("address_line_1");
                addressLine2 = rs.getString("address_line_2");
                city = rs.getString("city");
                province = rs.getString("province");
                postalCode = rs.getString("postal_code");

                try {
                    aStore = new Store(storeId, storeName, phoneNumber, addressLine1, addressLine2, city, province, postalCode);
                }
                catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
                stores.addElement(aStore);
                moreData = rs.next();
            }
            rs.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return stores;
    }

    /**
     * Provide a list of recommended stores
     * @param storeList The store list
     * @param postalCode The postal code
     * @return the list of stores
     */
    public static Vector<Store> recommendedList(Vector<Store> storeList, String postalCode) {

        String potentialCode = null;
        String subString1 = postalCode.substring(0,3);


        for (int i=0; i<storeList.size(); i++) {
            potentialCode =  storeList.get(i).getPostalCode();
            String subString2 = potentialCode.substring(0,3);
            if (subString1.equals(subString2)) {
                recommendedStores.addElement(storeList.get(i));
            }
        }
        return recommendedStores;
    }
}
