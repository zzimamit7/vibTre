<%-- 
    Document   : Signup
    Created on : 05-Feb-2024, 1:37:13 pm
    Author     : rahul
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    int temp=1;
    int temp1=1;
    int temp2=1;
    int temp3=1;
    int temp4=1;
    String check="0123456789";
    String check1="abcdefghinklmnopqustuvwxyz";
    String emailCheck="@gmail.com";
    String check2=check1.toUpperCase();
            String name=request.getParameter("name");
            request.getSession();
session.setAttribute("name",name);
            String PhNumber=request.getParameter("PhNumber");
            String day=request.getParameter("day");
            String month=request.getParameter("month");
            String year=request.getParameter("year");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            for(int i=0;i<name.length();i++){
               if(check.trim().length()==0 || check.contains(Character.toString(name.charAt(i)))){
               temp=0;
               
                }
                
            }
            for(int i=0;i<PhNumber.length();i++){
            if(PhNumber.length()<10 ||PhNumber.length()>10 ||check1.contains(Character.toString(PhNumber.charAt(i))) || check2.contains(Character.toString(PhNumber.charAt(i)))){
            temp1=0;
    }
    }
    if(Integer.parseInt(day)<1 || Integer.parseInt(day)>31 || Integer.parseInt(month)<1 || Integer.parseInt(month)>12 || Integer.parseInt(year)<1990 || Integer.parseInt(year)<2024){
    temp2=0;
    }
    if(check.contains(Character.toString(email.charAt(0))) ){
    temp3=0;
    
    }
       int pick=0;
       for(int i=0;i<email.length();i++){
       if(email.charAt(i)=='@'){
       pick=i;
       break;
       
    }
    }
    String prep=email.substring(pick,email.length());
    if(!prep.equals(emailCheck)){
    temp3=0;
    }
    if(password.length()<8){
    temp4=0;
    }
    if(temp==1 &&temp1==1 && temp2==1 && temp3==1 && temp4==1 ){
     RequestDispatcher dispatcher=null;
         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Vibtre","root","Tomrancho@1");
                PreparedStatement pst=con.prepareStatement("insert into Vibtre(name,PhNumber,day,month,year,email,password)values(?,?,?,?,?,?,?)");
                pst.setString(1,name);
                pst.setString(2,PhNumber);
                pst.setString(3,day);
                pst.setString(4,month);
                pst.setString(5,year);
                pst.setString(6,email);
                pst.setString(7,password);
                int rowCount=pst.executeUpdate();
                if(rowCount>0){
                   
                    response.sendRedirect("output.jsp");
                }
                else{
                    response.sendRedirect("signup.html");
                    
                }
                
                        }
            catch(Exception e){
                e.printStackTrace();
            }
    }
    else{
    response.sendRedirect("signup.html");
    }
            
            
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VibTree</title>
    </head>
    <body>
        
    </body>
</html>
