<%-- 
    Document   : AddProduct
    Created on : 06-Mar-2018, 21:38:45
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
        
        
        String name = request.getParameter("pName");
        String price = request.getParameter("pPrice");
        String category = request.getParameter("pCategory");
        String brand = request.getParameter("pBrand");
        
        
               con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();

             st.executeUpdate("Insert Into `onlinestore`.`product` (productName,productPrice,productCategory,productBrand) values ('" +name + "','" +  price +  "', '" + category +  "', '" + brand + "' );");
                out.println("INSERTED SUCCESSFULLY<br>"); 
                out.println(" <a href='AdminPage.html'> Back to Admin Page   <br>");
                out.println(" <a href='AddProduct.html'> Add Another Product   <br>");
              
         
                %>






    </body>
</html>

