package ca.groceriestogo.model;
import java.sql.Connection;
import java.util.Vector;


public class tester {

    public static void main(String[] args) {
        System.out.println("************THIS IS A TESTER FILE***********");

        Connection c = null;
        Store aStore;


        c = DatabaseConnect.initialize();
        StoreDA.initialize(c);
        Vector<Store> listOfStores = new Vector<Store>();

        listOfStores = StoreDA.retrieveAll();

        for (int i=0; i<listOfStores.size(); i++) {
            System.out.println(listOfStores.get(i).getStoreName());
        }

        StoreDA.terminate();
        DatabaseConnect.terminate();
    }
}
