/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {
@Override
    public void init()
    {
        
    }
@Override
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
    {
        PrintWriter out=res.getWriter();
        String username=req.getParameter("username");
        String password=req.getParameter("pass");
        System.out.println("Servlet "+username+password);
        try{
            System.out.println("check");
          Class.forName("com.mysql.jdbc.Driver");
            System.out.println("check 1");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Milkman","root","root");
            System.out.println("Check 2");
            PreparedStatement st=con.prepareStatement("select * from login where Email='"+username+"' and Password='"+password+"'");
            
            ResultSet rs=st.executeQuery();
            if(rs.next())
            {
                out.print("<script>alert('Login Success');document.location.href='index.html';</script>");
            }
            else{
                out.print("<script>alert('Invalid Details Login again');document.location.href='login.html';<script>");
            }
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