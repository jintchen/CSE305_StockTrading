/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Beans.Trade;
import Connector.JdbcConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tian
 */
public class ViewRevenueServlet extends HttpServlet {

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
        String stockSymbol = request.getParameter("stockSymbol");
        String stockType = request.getParameter("stockType");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        if (stockSymbol != null) {
            String query = "SELECT T.* "
                    + "FROM transactioninfo T, orderinfo O, trade R "
                    + "WHERE T.TraxID= R.TraxId AND O.OrderId=R.OrderId AND StockSymbol='"+stockSymbol+"'";
            try {
                ResultSet rs = JdbcConnector.excuteQuery(query);
                ArrayList<Trade> t = new ArrayList();
                while (rs.next()) {
                    Trade trade = new Trade();
                    trade.setDate(rs.getDate("Date"));
                    trade.setTransacationId(rs.getInt("TraxId"));
                    trade.setFee(rs.getFloat("Fee"));
                    t.add(trade);
                }
                request.setAttribute("t", t);
                request.setAttribute("byStockSymbol", stockSymbol);
                request.getRequestDispatcher("viewRevenue.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    JdbcConnector.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (lastName != null || firstName != null) {
            String query = " SELECT T.* "
                    + "FROM transactioninfo T, orderinfo O, trade R, person P,clients c "
                    + "WHERE T.TraxID= R.TraxId AND O.OrderId=R.OrderId AND O.Email=c.Email AND c.SSN=P.SSN AND LastName='" + lastName + "' AND FirstName='" + firstName + "';";
            try {
                ResultSet rs = JdbcConnector.excuteQuery(query);
                ArrayList<Trade> t = new ArrayList();
                while (rs.next()) {
                    Trade trade = new Trade();
                    trade.setDate(rs.getDate("Date"));
                    trade.setTransacationId(rs.getInt("TraxId"));
                    trade.setFee(rs.getFloat("Fee"));
                    t.add(trade);
                }
                request.setAttribute("t", t);
                request.setAttribute("byCustomer", firstName + " " + lastName);
                request.getRequestDispatcher("viewRevenue.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    JdbcConnector.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (stockType != null) {
            String query = " SELECT T.* "
                    + "FROM transactioninfo T, orderinfo O, trade R, stock S "
                    + "WHERE T.TraxID = R.TraxId AND O.OrderId=R.OrderId And S.StockSymbol=O.StockSymbol AND StockType='"+stockType+"';";
            try {
                ResultSet rs = JdbcConnector.excuteQuery(query);
                ArrayList<Trade> t = new ArrayList();
                while (rs.next()) {
                    Trade trade = new Trade();
                    trade.setDate(rs.getDate("Date"));
                    trade.setTransacationId(rs.getInt("TraxId"));
                    trade.setFee(rs.getFloat("Fee"));
                    t.add(trade);
                }
                request.setAttribute("t", t);
                request.setAttribute("byStockType", stockType);
                request.getRequestDispatcher("viewRevenue.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    JdbcConnector.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
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
