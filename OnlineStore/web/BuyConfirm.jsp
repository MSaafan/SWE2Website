<%-- 
    Document   : Buy
    Created on : 18-Apr-2018, 20:58:39
    Author     : Momo
--%>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.lang.Class"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Confirm Buy Page</title>
    </head>
    <body>
         <%
             
          String url = "jdbc:mysql://localhost:3306/onlinestore";
          String user = "root"; //write your username
          String password = "root"; // write your password  
            
            Connection con=null;
            Statement st = null;
            ResultSet RS = null;

                String productID = request.getParameter("productID");
                String Quantity = request.getParameter("quantity");
                String shippingAddress = request.getParameter("shippingAddress");
                String currentUser = session.getAttribute("name").toString();
                
            try {
                con = DriverManager.getConnection(url, user, password);
                st = con.createStatement();
               st.executeUpdate("INSERT INTO `onlinestore`.`shipment` (`productID`, `quantity`, `userName`, `shippingAddress`) VALUES ('"+productID+"', '"+Quantity+"', '"+currentUser+"', '"+shippingAddress+"');");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>

               <h1 align="center"><span style="background-color: #FFFFFF">
                   Confirmed Purchase
                   </span>
               </h1>
               <h2>
                   Product ID: <%=productID%><br>
                   Quantity: <%=Quantity%><br>
                   Shipping Address: <%=shippingAddress%><br>           
               </h2>
               
                   <form action="BrowseStores.jsp" class="sky-form">
                   	<footer>
					<button type="submit" class="button">Browse Stores</button>
                                        
			</footer>
                    </form>

    </body>
</html>
