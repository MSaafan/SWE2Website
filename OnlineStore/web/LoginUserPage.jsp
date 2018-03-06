<%-- 
    Document   : login
    Created on : Dec 19, 2016, 2:46:20 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserLoginBackEnd</title>
        
         
        
    </head>
    <body>
  
        
        <%
            try {
                String name = request.getParameter("name");
                String pass = request.getParameter("pass");

                String url = "jdbc:mysql://localhost:3306/onlinestore";
                String user = "root";
                String password = "root";
                Connection con = null;
                Statement st = null;
                ResultSet RS = null;

                con = DriverManager.getConnection(url, user, password);
                st = con.createStatement();

                RS = st.executeQuery("SELECT * FROM `onlinestore`.`user`");
                int x = 0;
                while (RS.next()) {

                    if (RS.getString("userName").equals(name) && RS.getString("userPass").equals(pass)) {
                        out.print(RS.getString("userName") + "-");
                        out.print(RS.getString("userPass") + "-");
                        session.setAttribute("name", RS.getString("username"));
                        session.setAttribute("pass", RS.getString("userPass"));
                        response.sendRedirect("UserPage.html");
                        x = 1;
                    }

                }
                if (x == 0) {
                    out.println("Invalid Name OR  password   <a href='LoginUserForm.html'> <br> try again</a>");

                }

            } catch (Exception cnfe) {
                System.err.print("exception" + cnfe);
            }
        %>

        
        
        
        
    </body>
</html>

