package ca.groceriestogo.model;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

/**
 * Manages the HTTP Requests
 * @author Daniel Hinbest, Ryan Clayson, Yash Gadhiya
 * @version 1.0 (2022-03-19)
 * @since 1.0
 */
public class HttpRequest {

	/**
	 * A new HTTP connection
	 */
    private static HttpURLConnection connection;
    /**
     * A new URL string
     */
    private static String urlString;

    /**
     * Connect to HTTP
     * @param urlString the url path
     * @return the status
     */
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
