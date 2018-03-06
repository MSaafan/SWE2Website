<%-- 
    Document   : SignupUser
    Created on : Dec 19, 2016 3:26:16 PM
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
        
        
        String mail = request.getParameter("mail");
        String pass = request.getParameter("pass");
        String uname = request.getParameter("name1");
        
        
        
               con = DriverManager.getConnection(url, user, password);
               st = con.createStatement();
               RS=st.executeQuery("SELECT * FROM `onlinestore`.`user`");
          
   
      int x=0;
          while(RS.next()){ 
              
                          if(RS.getString("userName").equals(uname) ||  RS.getString("userMail").equals(mail))
                           {             
                               response.sendRedirect("SignupUserForm.html");
                               
                                x=1;
                           }
                          
                     
                }
          if(x==0)
          {
              
             st.executeUpdate("Insert Into `onlinestore`.`user` (userName,UserMail,UserPass) values ('" +uname + "','" +  mail +  "', '" +  pass + "' );");
                out.println("INSERTED SUCCESSFUL"); 
                out.println(" <a href='LoginUserForm.html'> Go To Login   ");
              
          }
                %>






    </body>
</html>
