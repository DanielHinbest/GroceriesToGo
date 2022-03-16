package ca.groceriestogo.model;

import java.sql.*;

/**
 * Purpose of this file is to make a secure connection to the database and
 * to terminate it.
 * @author Yash Gadhiya
 * @version v1.0
 * @since March 16, 2021
 * */
public class 	DatabaseConnect {
    /**
     * url of the connection string
     * */
    static String url = "jdbc:mysql://localhost:3306/groceriestogo?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehaviour=convertToNull";
    /**
     * Connection object
     * */
    static Connection aConnection;
    /**
     * name of the admin user
     * */
    static String user = "root";
    /**
     * password of the admin user
     * */
    static String password = "password";

    /**
     * This method initializes the connection to the database using
     * JDBC driver provided and information about the db and admin.
     * @return returns the database connection instance
     * */
    public static Connection initialize() {
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); // loads the JDBC Driver for PostGreSQL
            aConnection = DriverManager.getConnection(url, user, password); // creates the database connection instance

        }
        catch (ClassNotFoundException e)  //will occur if you did not import the PostGreSQL *.jar file with drivers
        {
            System.out.println(e);
        }
        catch (SQLException e)	//any other database exception (misnamed db, misnamed user, worng password, etc)
        { System.out.println(e); }
        return aConnection;
    }

    /**
     * closes the database connection
     */
    public static void terminate()
    {
        try
        {
            aConnection.close();
        }
        catch (SQLException e)
        { System.out.println(e);	}
    }
}


