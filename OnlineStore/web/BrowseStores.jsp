<%-- 
    Document   : BrowseStores
    Created on : 1-Apr-2018, 13:05:13
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

            try {
                con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();
               RS=st.executeQuery("SELECT * FROM `onlinestore`.`store`");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="4" width="100%" bordercolorlight="#000000" bgcolor="#FFFFFF">
            <tr>
                <th>Store ID </th>
                <th>Store Name </th>
                <th>Store Location </th>
                <th>Store Type </th>
                <th>Store Owner </th>
            </tr>
            
            <%
                while (RS.next()) { %>
            <tr>
                <%if(RS.getBoolean("isApproved") == true) {%>
              <td><%=RS.getString("storeID")%></td>
               <td><%=RS.getString("storeName")%></td>
                <td><%=RS.getString("storeLocation")%></td>
                 <td><%=RS.getString("storeType")%></td>
                <td><%=RS.getString("storeOwner")%></td>
                <%}%>
            </tr>

            <%}%>
        </table>
        
        <form action="BrowseThisStore.jsp" class="sky-form">
				<header>Browse Store</header>
				
				<fieldset>					
					<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							 <input type="text" name="storeID" placeholder="Store ID" required="required" >
							<b class="tooltip tooltip-bottom-right">Only numbers</b>
						</label>
					</section>
                                    </fieldset>
					
				
				<footer>
					<button type="submit" class="button">Submit</button>
                                        <button type="reset" class="button">Clear</button>
                                        
				</footer>
			</form>
        
    </body>
</html>
