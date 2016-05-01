/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connector.JdbcConnector;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tian
 */
public class AddEmployeeServlet extends HttpServlet {

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
        String query1 = "INSERT INTO `person` (`SSN`, `LastName`, `FirstName`, `Address`,`City`,`States`, `ZipCode`, `Telephone`) "
                + "VALUES ('"+ssn+"', '" + request.getParameter("lastName") + "', '" + request.getParameter("firstName") 
                + "', '" + request.getParameter("address") + "', '" + request.getParameter("city") + "', '" + request.getParameter("state") 
                + "','" + request.getParameter("zipCode") + "', '" + request.getParameter("telephone") + "');";
        String query2 = "INSERT INTO `employees` (`SSN`, `StartDate`, `HourlyRate`) VALUES ('"+ssn+"', '" + request.getParameter("startDate") + "', '" + request.getParameter("hourlyRate") + "');";
        try {
            JdbcConnector.excuteUpdate(query1);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("adminFail.jsp").forward(request, response);
        } finally {
            try {
                JdbcConnector.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        try {
            if (JdbcConnector.excuteUpdate(query2)) {
                request.getRequestDispatcher("adminSuccess.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("adminFail.jsp").forward(request, response);
        } finally {
            try {
                JdbcConnector.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

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