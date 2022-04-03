package ca.groceriestogo.model;
import java.sql.Connection;
import java.util.Vector;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class tester {

    public static void main(String[] args) {
        System.out.println("************THIS IS A TESTER FILE***********");

        Connection c = null;


        c = DatabaseConnect.initialize();
        StoreDA.initialize(c);
        Vector<Store> listOfStores = new Vector<Store>();

        Vector<Store> recommendedList = new Vector<Store>();

        listOfStores = StoreDA.retrieveAll();

        for (int i=0; i<listOfStores.size(); i++) {
            System.out.println(listOfStores.get(i).getStoreName());
        }

//        JSONArray storeJson = StoreDA.StoreJson();

        System.out.println();
        System.out.println("Recommended store list");

        recommendedList = StoreDA.recommendedList(listOfStores, "L1G8G2");
        for (int i=0; i<recommendedList.size(); i++) {
            System.out.println(recommendedList.get(i).getStoreName());
        }

        StoreDA.terminate();
        DatabaseConnect.terminate();

        JSONObject jsonObject = new JSONObject();

        jsonObject = StoreDA.toJSON(listOfStores);
        System.out.println(jsonObject);

    }
}
