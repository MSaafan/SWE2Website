<%-- 
    Document   : AddProduct
    Created on : 13-Mar-2018, 21:38:45
    Author     : Momo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver").newInstance();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

        
        <% 
          String url = "jdbc:mysql://localhost:3306/onlinestore";
          String user = "root"; //write your username
          String password = "root"; // write your password  

        Connection con=null;
        Statement st = null;
        ResultSet RS = null;
        
        
        String name = request.getParameter("sName");
        String location = request.getParameter("sLocation");
        String type = request.getParameter("sType");                
        
        String curName = (String)session.getAttribute("username");
               con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();
               
        
             st.executeUpdate("Insert Into `onlinestore`.`store` (storeName,storeLocation,storeType,storeOwner) values ('" +name + "','" +  location +  "', '" +  type +  "', '" + curName + "' );");
                out.println("INSERTED SUCCESSFULLY<br>"); 
                out.println(" <a href='UserPage.html'> Back to User Page   <br>");
                out.println(" <a href='AddStore.html'> Add Another Store   <br>");
              
         
                %>






    </body>
</html>

