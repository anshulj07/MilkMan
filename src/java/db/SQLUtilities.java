package db;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;

/**
 *
 * @author AAYUSH
 */
public class SQLUtilities {
    public static Connection conn;
    public static Statement stmt;
    public static String dbname="Milkman";
    public static final String dburl="jdbc:mysql://localhost:3306/"+dbname;
    public static final String dbusername="root";
    public static final String dbpassword="root";
    
    public static void connectDB() throws ClassNotFoundException,SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(dburl,dbusername,dbpassword);
        stmt=conn.createStatement();
    }
    
    public static int insert(String query) throws SQLException{
        int result=-1;
        if(!"".equals(query)){
            result=stmt.executeUpdate(query);
        }
        return result;
    }
    
    public static int update(String query) throws SQLException{
        int result=0;
        if(!"".equals(query)){
            result=stmt.executeUpdate(query);
        }
        return result;
    }
    
    public static ResultSet select(String query) throws SQLException{
        ResultSet result=null;
        if(!"".equals(query)){
            result=stmt.executeQuery(query);
        }
        return result;
    }
    
   public static int delete(String query) throws SQLException{
        int result=-1;
        if(!"".equals(query)){
            result=stmt.executeUpdate(query);
        }
        return result;
    }
    
    public static  void close() throws SQLException{
        if(conn!=null){
            conn.close();
        }
        if(stmt!=null){
            stmt.close();
        }
    }
}
