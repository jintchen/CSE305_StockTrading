/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Beans.Employee;
import Connector.JdbcConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tian
 */
public class GetEmployeeServlet extends HttpServlet {

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
        String ssn = request.getParameter("SSN");
        String query = "Select p.firstname,p.lastname, p.address, p.zipcode,p.city,p.states, p.telephone, e.hourlyrate, e.startdate From employees e,person p WHERE e.SSN=p.SSN and e.SSN = '" + ssn + "'";
        try {
            ResultSet rs=JdbcConnector.excuteQuery(query);
            if (rs.first()) {
                Employee e=new Employee();
                e.setAddress(rs.getString("address"));
                e.setCity(rs.getString("city"));
                e.setFname(rs.getString("firstName"));
                e.setHourlyRate(rs.getFloat("hourlyrate"));
                e.setLname(rs.getString("lastname"));
                e.setSSN(ssn);
                e.setStartDate(rs.getDate("startdate"));
                e.setState(rs.getString("states"));
                e.setTelephone(rs.getString("telephone"));
                e.setZipCode(rs.getInt("zipcode"));
                request.getSession().setAttribute("e", e);
                request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcConnector.close();
            } catch (Exception e){
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("adminFail.jsp").forward(request, response);
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
