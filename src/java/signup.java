/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Anshul
 */
@WebServlet(urlPatterns = {"/signup"})
public class signup extends HttpServlet {
@Override
    public void init()
    {
        
    }
@Override
    public void service(HttpServletRequest req,HttpServletResponse res)
    {
        System.out.println("HELLO");
        String first= req.getParameter("first");
        String last=req.getParameter("last");
        String email= req.getParameter("email");
        String password=req.getParameter("password");
        System.out.println("Check 2");
        try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Milkman","root","root");
            PreparedStatement st=con.prepareStatement("insert into signup values(?,?,?,?)");
            st.setString(1,first);
            st.setString(2,last);
            st.setString(3,email);
            st.setString(4,password);
            st.executeUpdate();
        }
        catch(ClassNotFoundException | SQLException ex)
        {
            System.out.println("Error in "+ex);
        }
           
    }
    @Override
    public void destroy()
    {
        
    }
    
    
}
