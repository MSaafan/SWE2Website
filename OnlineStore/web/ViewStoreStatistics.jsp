<%-- 
    Document   : ViewStoreStatistics
    Created on : 13-Mar-2018, 23:22:59
    Author     : Momo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver").newInstance();%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sky Forms</title>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		
		<link rel="stylesheet" href="css/demo.css">
		<link rel="stylesheet" href="css/sky-forms.css">
    </head>
    <body>
        <h1 align="center"><span style="background-color: #FFFFFF">Stores List</span></h1>
        <%
            String url = "jdbc:mysql://localhost:3306/onlinestore";
          String user = "root"; //write your username
          String password = "root"; // write your password  
            
            Connection con=null;
            Statement st = null;
            ResultSet RS = null;
           String curName = (String)session.getAttribute("username");
            try {
                con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();
               RS=st.executeQuery("SELECT * FROM onlinestore.store_product;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="4" width="100%" bgcolor="#FFFFFF">
            <tr>
                <th>Store ID </th>
                <th>Product ID </th>
                <th>Number of Views </th>
                <th>Sold Count </th>
                <th>Left in Stock  </th>
            </tr>
            
            <%
                while (RS.next()) { %>
            <tr>
                <%if(RS.getString("userName") == curName) {%>
              <td><%=RS.getString("storeID")%></td>
               <td><%=RS.getString("productID")%></td>
                <td><%=RS.getString("numberOfViews")%></td>
                 <td><%=RS.getString("soldCount")%></td>
                 <td><%=RS.getString("stockCount")%></td>
                <%}%>
            </tr>

            <%}%>
        </table>
    </body>
</html>

    
