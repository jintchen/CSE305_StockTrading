/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Beans.Order;
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
public class ViewOrdersServlet extends HttpServlet {

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
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        if (stockSymbol != null) {
            String query = "SELECT * "
                    + "FROM orderinfo "
                    + "WHERE StockSymbol='" + stockSymbol + "';";
            try {
                ResultSet rs = JdbcConnector.excuteQuery(query);
                ArrayList<Order> o = new ArrayList();
                while (rs.next()) {
                    Order order = new Order();
                    order.setDate(rs.getDate("Dates"));
                    order.setNumShares(rs.getInt("NumShares"));
                    order.setOrderId(rs.getInt("OrderId"));
                    order.setOrderType(rs.getString("OrderType"));
                    order.setPriceType(rs.getString("PriceType"));
                    order.setStockSymbol(rs.getString("StockSymbol"));
                    o.add(order);
                }
                request.setAttribute("o", o);
                request.setAttribute("byStock", stockSymbol);
                request.getRequestDispatcher("viewOrders.jsp").forward(request, response);
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
            String query = " select O.* "
                    + "FROM orderinfo O,person P, clients c "
                    + "WHERE O.Email=c.Email AND c.SSN=P.SSN AND LastName='" + lastName + "' AND FirstName='" + firstName + "';";
            try {
                ResultSet rs = JdbcConnector.excuteQuery(query);
                ArrayList<Order> o = new ArrayList();
                while (rs.next()) {
                    Order order = new Order();
                    order.setDate(rs.getDate("Dates"));
                    order.setNumShares(rs.getInt("NumShares"));
                    order.setOrderId(rs.getInt("OrderId"));
                    order.setOrderType(rs.getString("OrderType"));
                    order.setPriceType(rs.getString("PriceType"));
                    order.setStockSymbol(rs.getString("StockSymbol"));
                    o.add(order);
                }
                request.setAttribute("o", o);
                request.setAttribute("byCustomer", firstName + " " + lastName);
                request.getRequestDispatcher("viewOrders.jsp").forward(request, response);
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
