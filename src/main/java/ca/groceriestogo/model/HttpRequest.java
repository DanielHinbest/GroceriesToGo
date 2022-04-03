package ca.groceriestogo.model;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class HttpRequest {

    private static HttpURLConnection connection;
    private static String urlString;

    public static int MethodToGetThingsWork(String urlString) {
        try {
            URL url = new URL(urlString);
            connection = (HttpURLConnection) url.openConnection();

            //request setup
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);

            int status = connection.getResponseCode();
            System.out.println(status);
            return status;

        } catch (MalformedURLException | ProtocolException e) {
            e.printStackTrace();
            return -1;
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }

}
