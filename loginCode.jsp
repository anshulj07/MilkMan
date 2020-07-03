<%@page import="java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet, java.sql.Connection" %>

<%
    
    
         String id=request.getParameter("emailid");
        String pass=request.getParameter("passwordid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from signup where Email=? and Password=?");
            st.setString(1,id);
            st.setString(2,pass);
            ResultSet  rs=st.executeQuery();//select query
          if(rs.next())
            {
                out.println("welcome");
                response.sendRedirect("Home.html");
            }
            else
            {
                out.println("invalid id/password");
            }


%>
