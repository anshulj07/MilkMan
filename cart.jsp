<%-- 
    Document   : cart
    Created on : May 22, 2019, 8:27:50 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
          .value-button {
    display: inline-block;
    border: 1px solid #ddd;
    margin: 0px;
    width: 40px;
    height: 25px;
    line-height: 23px;
    text-align: center;
    vertical-align: middle;
    background: #eee;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

.value-button:hover {
    cursor: pointer;
    color: black;
}

.myform .decrease {
    margin-right: -4px;
    border-radius: 8px 0 0 8px;
}

.myform .increase {
    margin-left: -4px;
    border-radius: 0 8px 8px 0;
}

.myform #input-wrap {
    margin: 0px;
    padding: 0px;
}

input.number {
    text-align: center;
    border: none;
    margin: 0px;
    width: 40px;
    height: 25px;
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
           .cartheading
           {
               font-family: cursive;
              
           }
           .cartlogo
           {
               margin-top: 5vw;
               width: 50px;
               height:39px;
           }
           .cartfield
           {
               width: 24%;
               font-family: sans-serif;
               font-size: 25px;
           }
         .submitbutton {
    border-radius: 2px;
            border-width: 1px;
            border-style: solid;
            border-color: transparent;
    color: #fff;
            background: red;
    background: #10609e;
            margin-top: 20px;
    font-size: 15px;
    width: 150px;
    padding: 12px 45px;
     margin-top: -1px;
    border: none;

}

   body {
           margin: 0;
           font-size: 14px;
        }
  
        * {
    box-sizing: border-box;
}
        .backtheme
        {
            width: 100%;
            background: url('sky2.jpg');
            height: 100vh;
            background-repeat: no-repeat;
        }
        .nav
        {
            width: 100%;
            height: 10vh;
            
            
        }
        .menu
        {
/*            width: 100%;*/
        }
        .menutheme
        {
            width: 25%;
            font-size: 20px;
            height: 15vh;
            text-align: center;
            color: white;
        }
        a
        {
            text-decoration: none;
        }
        .logo1 {
            padding-left: 50px;
        }



        </style>
        
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" media="all" href="css/product.css" />
        <title>cart</title>
     
        
        
    </head>
    <body>
       
          <div class="backtheme"> 
     <header class="menu">
              <div class="nav"> 
              <table width="100%">
                  <tr>
                      <td class="logo1" width="5%"><img src="milkandmore.png" width="150" height="50"></td>
                       
                  <td style="padding-left: 35vw;">
                  <table width="100%">
                      <tr>
                          <td class="menutheme"><a href="Product.html"><b>Product</b></a></td>
                          <td class="menutheme"><a href="Schedule.html"><b>Schedule</b></a></td>
                          <td class="menutheme"><a href="support.html"><b>Support</b></a></td>
                          <td class="menutheme"><a href="login1.html"><b>Login</b></a></td>
                      </tr>
                  </table>
                  </td>
                  </tr>
              </table>
                </div>
        
        
        <%
        System.out.println("hello");
        %>
        
         <%@page import="java.sql.*"%>
         <%@page import="db.*"%>
         <%! String query,id,name,price,query2,query3; int count;%>
         <%
         String s=request.getParameter("msg");
         System.out.println("check 1");
         try{
         SQLUtilities.connectDB();
         query="select * from dairy where id='"+s+"'";
         System.out.println("check 2");
         ResultSet rs=SQLUtilities.select(query);
         while(rs.next())
         {
             id=rs.getString("id");
             name=rs.getString("name");
             price=rs.getString("price");
             
         }
         query2="insert into cart values('"+s+"','"+name+"','"+price+"',1);";
         SQLUtilities.insert(query2);
         }
         catch(Exception ex)
         {
             System.out.println("Excep in "+ex);
         }
         
         
         %>
         
         <div class="col-md-2"></div>
         <div class="col-md-8">
             <h1 class="cartheading"><center>Here Is your Milk and More Cart <img src="cartlogo1.png" class="cartlogo"></center></h1>
            
             <table class="table" style="margin-top: 50px;">
  <thead>
    <tr class="carttable">
      <th scope="col" class="cartfield"><center>Product Id</center></th>
      <th scope="col" class="cartfield"><center>Product Name</center></th>
      <th scope="col" class="cartfield"><center>Price</center></th>
      <th scope="col" class="cartfield"><center>Quantity</center></th>	
      
    </tr>
  </thead>

  <tbody>
      
    <tr>
        <th scope="row"><center><%=id%></center></th>
        <td><center><%=name%></center></td>
        <td><center><%=price%></center></td>
         <td><center><div class="value-button decrease" value="Decrease Value">-</div>
                    <input type="number" class="number" value="0" />
                    <div class="value-button increase" value="Increase Value">+</div></center></td>
         <td class="buynow"><center><a style=""><input class="submitbutton" type="submit" value="Buy Now"></a></center></td>
       
    </tr>
    
    
  </tbody>
        
</table>
         </div>
         <div class="col-md-2">
         </div>
         
    </body>
</html>
