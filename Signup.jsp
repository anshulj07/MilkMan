<%-- 
    Document   : Signup
    Created on : Apr 10, 2019, 11:02:34 AM
    Author     : Anshul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet, java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String first= request.getParameter("first");
        String last=request.getParameter("last");
        String email= request.getParameter("email");
        String password=request.getParameter("password");
        try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from signup where Email=? and Password=?");
            st.setString(1,first);
            st.setString(2,last);
            st.setString(3,email);
            st.setString(2,password);
            st.executeUpdate();
        }
        catch(Exception ex)
        {
            System.out.println("Error in "+ex);
        }
        %>
        
    </body>
</html>
