<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query Result</title>
</head>
	<body>
	 <%@page import="jsp_azure_test.DataHandler"%>
	 <%@page import="java.sql.ResultSet"%>
	 <%@page import="java.sql.Array"%>
	 <%
	 DataHandler handler = new DataHandler();
	 
	 // Get the attribute values passed from the input form.
	 String name = request.getParameter("cname");
	 String address = request.getParameter("address");
	 String Category = request.getParameter("category");

	 /*
	  * If the user hasn't filled out all the time, movie name and duration. This is very simple checking.
	  */
	  if (name == null || address == null || Category == null || name.equals("") || address.equals("") || Category.equals("")) {
	  		response.sendRedirect("SCHNURRENBERGER_SOFIA_IP_TASK7_add_query1_form.jsp");
	  } else {
	  		int categoryInt = Integer.parseInt(Category);
	  		boolean success = handler.addCustomer(name, address, categoryInt);
  			if (!success) { // Something went wrong
  		 	%>
  		 		<h2>There was a problem inserting the course</h2>
  		 	<%
	  		} else { // Confirm success to the user
		 		%>
		  		<h2>Customers:</h2>
		  		 <ul>
			  		 <li>Name: <%=name%></li>
			  		 <li>Address: <%=address%></li>
			  		 <li>Category: <%=Category%></li>
			  	</ul>
	 			<h2>Was successfully inserted.</h2>

	 			<a href="SCHNURRENBERGER_SOFIA_IP_TASK7_Query1.jsp">See all Customers.</a>
	 			<%
 		}
 	}
 	%>
	</body>
</html>