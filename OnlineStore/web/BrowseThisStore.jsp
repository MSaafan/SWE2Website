<%-- 
    Document   : BrowseThisStore
    Created on : 1-Apr-2018, 13:08:51
    Author     : Momo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.lang.Class"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
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
            String storeID = request.getParameter("storeID");
            
            try {
                con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();
               RS=st.executeQuery("SELECT * FROM onlinestore.product where productID IN  (SELECT productID FROM onlinestore.store_product WHERE storeID = "+ storeID +");");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>
              
            <table border="4" width="100%" bordercolorlight="#000000" bgcolor="#FFFFFF">
            <tr>
                <th>Product ID </th>
                <th>Product Name </th>
                <th>Product Price </th>
                <th>Product Category </th>
                <th>Product Brand </th>
                
            </tr>
            
           <%
            
            while (RS.next()) { 
              %>
              
              <tr>
              <td><%=RS.getString("productID")%></td>
              <td><%=RS.getString("productName")%></td>
              <td><%=RS.getString("productPrice")%></td>
              <td><%=RS.getString("productCategory")%></td>
              <td><%=RS.getString("productBrand")%></td>
            </tr>
            
              <%
            }
        %>
        
        </table>
        
        <form action="BuyConfirm.jsp" class="sky-form">
				<header>Buy</header>
				
				<fieldset>					
					<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							 <input type="text" name="productID" placeholder="Product ID" required="required" >
							<b class="tooltip tooltip-bottom-right">Only numbers</b>
						</label>
					</section>
                                    </fieldset>
                                <fieldset>					
					<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							 <input type="text" name="quantity" placeholder="Quantity" required="required" >
							<b class="tooltip tooltip-bottom-right">Only numbers</b>
						</label>
					</section>
                                    </fieldset>
					
                                <fieldset>					
					<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							 <input type="text" name="shippingAddress" placeholder="Shipping Address" required="required" >
							<b class="tooltip tooltip-bottom-right">Only numbers</b>
						</label>
					</section>
                                    </fieldset>
				
				<footer>
					<button type="submit" class="button">Confirm Provided Info</button>
                                        <button type="reset" class="button">Clear</button>
                                        
				</footer>
			</form>
        
    </body>
</html>
