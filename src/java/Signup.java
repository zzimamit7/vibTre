/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rahul
 */
public class Signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Signup</title>");            
            out.println("</head>");
            out.println("<body>");
            String name=request.getParameter("name");
            String PhNumber=request.getParameter("PhNumber");
            String day=request.getParameter("day");
            String month=request.getParameter("month");
            String year=request.getParameter("year");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
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
                   
                    response.sendRedirect("login.html");
                }
                else{
                    response.sendRedirect("signup.html");
                    
                }
                
                        }
            catch(Exception e){
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
