<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customers in Range</title>
</head>
<body>
<%@page import="jsp_azure_test.DataHandler"%>
<%@page import="java.sql.ResultSet"%>

<%
    // Retrieve values from request attributes
     String lowerCategoryStr = request.getParameter("lcategory");
	 String upperCategoryStr = request.getParameter("ucategory");

    // We instantiate the data handler here, and get all the movies from the database
    final DataHandler handler = new DataHandler();
    if (lowerCategoryStr == null || upperCategoryStr == null || lowerCategoryStr.equals("") || upperCategoryStr.equals("")) {
    	response.sendRedirect("SCHNURRENBERGER_SOFIA_IP_TASK7_add_query12_form.jsp");
    } else { 
  		int upperCategory= Integer.parseInt(upperCategoryStr);
  		int lowerCategory  = Integer.parseInt(lowerCategoryStr);
    	
     	 ResultSet customer_range = handler.retrieveCustomer(lowerCategory,upperCategory);
%>

<!-- The table for displaying all the movie records -->
<table cellspacing="2" cellpadding="2" border="1">
    <tr> <!-- The table headers row -->
        <td align="center">
            <h4>Customer Name</h4>
        </td>
        <td align="center">
            <h4>Address</h4>
        </td>
        <td align="center">
            <h4>Category</h4>
        </td>
    </tr>
    <%
            while (customer_range.next()) { // For each movie_night record returned...
	            // Extract the attribute values for every row returned
	            final String Name = customer_range.getString("cname");
	            final String Address = customer_range.getString("address");
	            final int Category = customer_range.getInt("category");
	
	            out.println("<tr>"); // Start printing out the new table row
	            out.println( // Print each attribute value
	                    "<td align=\"center\">" + Name +
	                            "</td><td align=\"center\"> " + Address +
	                            "</td><td align=\"center\"> " + Category + "</td>");
	            out.println("</tr>");
            }
    }
    %>
    
</table>
</body>
</html>
