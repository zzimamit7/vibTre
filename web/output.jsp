<%-- 
    Document   : output
    Created on : 05-Feb-2024, 2:57:13 pm
    Author     : rahul
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="output.css">
                <!--<link rel="stylesheet" href="index.css">-->
        <link rel="stylesheet" href="responsive_Design.css">

    </head>
    <body>
         <header>
              <div class="upper">
                  <div class="logo">
                      <a href="#">Vibtree Project</a>
                  </div>
                  <ul class="links">
                      <li><a href="#">Home</a></li>
                      <li><a href="#">about</a></li>
                      <li><a href="#">Service</a></li>
                      <li><a href="#">Contact</a></li>
                      
                  </ul>
                   <div class="bar"><i class="fa-solid fa-bars"></i></div>
              </div>
              
              <!--responsive-->
              <div class="dropdown open">
                  <ul>
                      <li><a href="#">Home</a></li>
                      <li><a href="#">about</a></li>
                      <li><a href="#">Service</a></li>
                      <li><a href="#">Contact</a></li>
                  </ul>
              </div>
             
          </header>
        <div class="card-container">
            
            
            
               
                <%
        
                Connection con = null;

ResultSet resultSet = null;
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Vibtre","root","Tomrancho@1");
            PreparedStatement pst=con.prepareStatement("select * from Vibtre");
            
            
            ResultSet rs=pst.executeQuery();
            int i=1;
            while(rs.next()){
            %>
            <div class="card">
                <img src="newcard.jpg">
                <div class="card-content">
                    <h3>Information<%=i%></h3>
                    <table>
                        <tr>
                            <td>Name</td>
                            <td><%=rs.getString("name") %></td>
                        </tr>
                         <tr>
                            <td>Phone Number</td>
                            <td><%=rs.getString("PhNumber") %></td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td><%=rs.getString("day") %>/<%=rs.getString("month")%>/<%=rs.getString("year")%></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><%=rs.getString("email") %></td>
                        </tr>
                    </table>
                </div>
            </div>
                        <%
                            i++;
            }
            }catch(Exception e){
                   e.printStackTrace();
               }
        %>
            
            
        </div>
    </body>
</html>
