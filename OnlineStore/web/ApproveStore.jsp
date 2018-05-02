<%-- 
    Document   : ApproveStore
    Created on : 13-Mar-2018, 23:22:59
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
               st.executeUpdate("UPDATE `onlinestore`.`store` SET `isApproved`='1' WHERE `storeID`="+ storeID +";");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            out.println("Store Approved SUCCESSFULLY<br>"); 
            out.println(" <a href='AdminPage.html'> Back to Admin Page   <br>");
            out.println(" <a href='BrowseUnapprovedStore.jsp'> Approve Another Store   <br>");
            
        %>
    </body>
</html>