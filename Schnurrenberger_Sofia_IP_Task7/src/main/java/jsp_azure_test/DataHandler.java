package jsp_azure_test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
public class DataHandler {
 private Connection conn;
 // Azure SQL connection credentials

// Database credentials
final static String HOSTNAME = "<schn0050>-sql-server.database.windows.net";
final static String DBNAME = "schn0050";
final static String USERNAME = "<schn0050>";
final static String PASSWORD = "<Sofiase10>";
final private String url  =   String.format("jdbc:sqlserver://schn0050.database.windows.net:1433;database=schn0050;user=schn0050@schn0050;password={Sofiase10};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
	 // Initialize and save the database connection
	 private void getDBConnection() throws SQLException {
		 if (conn != null) {
		 return;
	 }
		 this.conn = DriverManager.getConnection(url);
	 }
	 // Return the result of selecting everything from the movie_night table
	 public ResultSet getAllCustomers() throws SQLException {
		 getDBConnection();
	
		 final String sqlQuery = "SELECT * FROM Customer;";
		 final PreparedStatement stmt = conn.prepareStatement(sqlQuery);
		 return stmt.executeQuery();
	 }
	 // Inserts a record into the movie_night table with the given attribute values
	 public boolean addCustomer(
			 String Name, String Address, int Category) throws
		SQLException {
				 getDBConnection(); // Prepare the database connection
				 // Prepare the SQL statement
				 final String sqlQuery =
				 "INSERT INTO Customer " +
				 "(cname, address, category) " +
				 "VALUES " +
				 "(?, ?, ?)";
				 final PreparedStatement stmt = conn.prepareStatement(sqlQuery);
				 // Replace the '?' in the above statement with the given attribute values
				 stmt.setString(1, Name);
				 stmt.setString(2, Address);
				 stmt.setInt(3,  Category);
				 // Execute the query, if only one record is updated, then we indicate success by returning true
				 return stmt.executeUpdate() == 1;
	 }
	 
	 public ResultSet retrieveCustomer(
			 int lower_number, int upper_number) throws
		SQLException {
				 getDBConnection(); // Prepare the database connection
				 // Prepare the SQL statement
				 final String sqlQuery = "SELECT * FROM Customer WHERE category BETWEEN ? AND ? ORDER BY cname; ";
				 final PreparedStatement stmt = conn.prepareStatement(sqlQuery);
				 // Replace the '?' in the above statement with the given attribute values		
				 stmt.setInt(1,  lower_number);
				 stmt.setInt(2,  upper_number);
				 
				 // Execute the query, if only one record is updated, then we indicate success by returning true
				 return stmt.executeQuery();
	 }
	 
}