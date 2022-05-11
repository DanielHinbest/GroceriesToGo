# GroceriesToGo
This was the capstone project for Daniel Hinbest, Ryan Clayson, and Yash Gadhiya for Computer Programming and Analysis at Durham College. It is a grocery delivery website that would allow items to be added to a cart to be ready for delivery. It includes use of a store locator map, a search tool, and a standard view of what stores would be available and their products.

This project was built using:
- Java, HTML, CSS, JavaScript
- Spring Framework
- MySQL


Groceries To Go was built using Eclipse IDE, and uses Maven dependencies stored in pom.xml. The application can be run using the maven jetty server or by generating a war file to run on Apache Tomcat.

To run in with maven jetty:
Apache Maven will need to be downloaded and added to the system path for use in the command line.
Open the root of the project in a command line and use the command mvn install to install the required maven dependencies.
Run the mvn jetty:run command to start the server. The application will be accessible on localhost:8080.

The database will need to be configured on a local MySQL server and will need to ensure the authentication matches what's stored in application.properties and in the header.jsp JSTL tags.
