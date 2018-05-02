<%-- 
    Document   : AddCollaborator
    Created on : 01-May-2018, 02:02:53
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
        
        
        String collaboratorName = request.getParameter("cName");
        String storeID = request.getParameter("sID");
        String storeOwner = session.getAttribute("name").toString();
        
        
               con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();

             RS = st.executeQuery("SELECT * FROM onlinestore.store WHERE storeOwner = '"+ storeOwner +"' AND storeID = "+ storeID +";");
                
             if (!RS.next() ) {
                out.println("You Don't own this Store <br>"); 
             } 
             else{
                st.executeUpdate("INSERT INTO `onlinestore`.`collaborators` (`storeID`, `collaboratorName`) VALUES ('"+storeID+"','"+collaboratorName+"');");
                response.sendRedirect("UserPage.html");
             }
                
                
              
         
                %>
    </body>
</html>
