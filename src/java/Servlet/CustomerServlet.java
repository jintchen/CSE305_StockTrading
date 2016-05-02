/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Beans.Client;
import Connector.JdbcConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tian
 */
public class CustomerServlet extends HttpServlet {

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
            RequestDispatcher disp;
            String action = request.getParameter("action");
            if (action.equals("record_order")) {
                String numShares = request.getParameter("numShares");
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String priceType = request.getParameter("priceType");
                String orderType = request.getParameter("orderType");
                String email = request.getParameter("email");
                String stockSymbol = request.getParameter("stockSymbol");
                String query = "INSERT INTO orderinfo  VALUES (NULL,'" + numShares + "', '" + date + "', '" + time + "', '" + priceType + "', '" + orderType + "','" + email + "','" + stockSymbol + "')";
                try {
                    boolean rs = JdbcConnector.excuteUpdate(query);
                    if (rs) {
                        disp = request.getRequestDispatcher("employeePage.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>Record Order Successful!</font></center>");
                        query = "select OrderId from orderinfo where Dates = '" + date + "' and Times = '" + time + "'";
                        ResultSet result = JdbcConnector.excuteQuery(query);
                        result.first();
                        int orderId = result.getInt("OrderId");
                        out.println("<table class='table'>");
                        out.println("<tr><th>Order ID#:</th>");
                        out.println("<th>Client Email:</th>");
                        out.println("<th>Shares Number:</th>");
                        out.println("<th>Date:</th>");
                        out.println("<th>Time:</th>");
                        out.println("<th>Price Type:</th>");
                        out.println("<th>Order Type:</th>");
                        out.println("<th>Stock Symbol:</th></tr>");
                        out.println("<tr><td>" + orderId + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>" + numShares + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + time + "</td>");
                        out.println("<td>" + priceType + "</td>");
                        out.println("<td>" + orderType + "</td>");
                        out.println("<td>" + stockSymbol + "</td></tr>");
                        out.println("</table>");

                    } else {
                        disp = request.getRequestDispatcher("CustomerRecordOrder.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>At least one data entry is incorrect !</font></center>");
                        out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                    }
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
            if (action.equals("Add_Customer")) {
                String ssn = request.getParameter("ssn");
                String lname = request.getParameter("lname");
                String fname = request.getParameter("fname");
                String addr = request.getParameter("addr");
                String zip = request.getParameter("zip");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String telephone = request.getParameter("telephone");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String credit = request.getParameter("credit");
                String CDate = request.getParameter("CDate");
                String rate = request.getParameter("rate");
                boolean check = true;
                if (ssn.isEmpty() || lname.isEmpty() || fname.isEmpty() || email.isEmpty()) {
                    check = false;
                }
                boolean r1 = false;
                String query1 = "INSERT INTO person VALUES ('" + ssn + "', '" + lname + "','" + fname + "','" + addr + "','" + zip + "','" + city + "','" + state + "','" + telephone + "')";
                String query2 = "INSERT INTO clients  VALUES ('" + ssn + "', '" + email + "', '" + credit + "', " + rate + ",'" + pass + "','" + CDate + "')";
                try {
                    if (check) {
                        r1 = JdbcConnector.excuteUpdate(query1);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        JdbcConnector.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
                try {
                    if (check && r1) {
                        if (JdbcConnector.excuteUpdate(query2)) {
                            disp = request.getRequestDispatcher("employeePage.jsp");
                            disp.include(request, response);
                            out.println("<center style=\"font-size:300%;\"><font color=red>Add Customer Successful!</font></center>");
                            out.println("<table class='table'>");
                            out.println("<tr><th>SSN:</th>");
                            out.println("<th>Last Name:</th>");
                            out.println("<th>First Name:</th>");
                            out.println("<th>Email:</th>");
                            out.println("<th>Created Date:</th>");
                            out.println("<th>Address:</th>");
                            out.println("<th>City</th>");
                            out.println("<th>State</th>");
                            out.println("<th>Zip</th></tr>");
                            out.println("<tr><td>" + ssn + "</td>");
                            out.println("<td>" + lname + "</td>");
                            out.println("<td>" + fname + "</td>");
                            out.println("<td>" + email + "</td>");
                            out.println("<td>" + CDate + "</td>");
                            out.println("<td>" + addr + "</td>");
                            out.println("<td>" + city + "</td>");
                            out.println("<td>" + state + "</td>");
                            out.println("<td>" + zip + "</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        disp = request.getRequestDispatcher("CustomerAdd.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>At least one data entry is incorrect !</font></center>");
                        out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    disp = request.getRequestDispatcher("CustomerAdd.jsp");
                    disp.include(request, response);
                    out.println("<center style=\"font-size:300%;\"><font color=red>At least one data entry is incorrect !</font></center>");
                    out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                } finally {
                    try {
                        JdbcConnector.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }

            }
            if (action.equals("Delete_Customer")) {
                String email = request.getParameter("email");
                boolean check = true;
                if (email.isEmpty()) {
                    check = false;
                }
                String query1 = "DELETE FROM clients WHERE email = '" + email + "'";

                try {
                    if (check) {
                        boolean rs = JdbcConnector.excuteUpdate(query1);
                        if (rs) {
                            disp = request.getRequestDispatcher("employeePage.jsp");
                            disp.include(request, response);
                            out.println("<center style=\"font-size:300%;\"><font color=red>Delete Customer Successful!</font></center>");
                        } else {
                            disp = request.getRequestDispatcher("CustomerDelete.jsp");
                            disp.include(request, response);
                            out.println("<center style=\"font-size:300%;\"><font color=red>Email Address is invalid!</font></center>");
                            out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                        }
                    } else {
                        disp = request.getRequestDispatcher("CustomerDelete.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>Email Address is invalid!</font></center>");
                        out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                    }
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

            if (action.equals("Get_Customer")) {
                String ssn = request.getParameter("ssn");
                boolean check = true;
                if (ssn.isEmpty()) {
                    check = false;
                }
                String query1 = "Select p.firstname,p.lastname, p.address, p.zipcode,p.city,p.states, p.telephone, c.Rating, c.creditcardnumber From clients c,person p WHERE c.SSN=p.SSN and c.SSN = '" + ssn + "'";
                try {
                    if (check) {
                        ResultSet rs = JdbcConnector.excuteQuery(query1);
                        if (rs.first()) {
                            Client c = new Client();
                            c.setSSN(Integer.parseInt(ssn));
                            c.setAddress(rs.getString("address"));
                            c.setCity(rs.getString("city"));
                            c.setFname(rs.getString("firstname"));
                            c.setLname(rs.getString("lastname"));
                            c.setState(rs.getString("states"));
                            c.setZipCode(rs.getInt("zipcode"));
                            c.setTelephone(rs.getString("telephone"));
                            c.setRating(rs.getInt("rating"));
                            c.setCCN(rs.getString("creditcardnumber"));
                            request.getSession().setAttribute("c", c);
                            disp = request.getRequestDispatcher("CustomerEdit.jsp");
                            disp.include(request, response);

                        } else {
                            disp = request.getRequestDispatcher("CustomerUpdate.jsp");
                            disp.include(request, response);
                            out.println("<center style=\"font-size:300%;\"><font color=red>SSN is invalid!</font></center>");
                            out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                        }
                    } else {
                        disp = request.getRequestDispatcher("CustomerUpdate.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>SSN is invalid!</font></center>");
                        out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                    }
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

            //new action
            if (action.equals("Edit_Customer")) {
                String ssn = request.getParameter("SSN");
                String query = "update person p,clients c set lastname = '"
                        + request.getParameter("lastName") + "' ,"
                        + "firstname = '" + request.getParameter("firstName") + "' ,"
                        + "address = '" + request.getParameter("address") + "' ,"
                        + "city = '" + request.getParameter("city") + "' ,"
                        + "states = '" + request.getParameter("state") + "' ,"
                        + "zipcode ='" + request.getParameter("zipCode") + "',"
                        + "telephone = '" + request.getParameter("telephone") + "' ,"
                        + "creditcardnumber = '" + request.getParameter("credit") + "',"
                        + "rating = " + request.getParameter("rating") + " "
                        + "where p.ssn = '" + ssn + "' and p.ssn=c.ssn;";
                try {
                    if (JdbcConnector.excuteUpdate(query)) {
                        disp = request.getRequestDispatcher("employeePage.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>Update Customer Successful!</font></center>");
                    } else {
                        disp = request.getRequestDispatcher("CustomerEdit.jsp");
                        disp.include(request, response);
                        out.println("<center style=\"font-size:300%;\"><font color=red>At least one data entry is incorrect !</font></center>");
                        out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                    }

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

            if (action.equals("CustomerEmaiList")) {
                String query = "select email from clients";
                try {
                    ResultSet rs = JdbcConnector.excuteQuery(query);
                    disp = request.getRequestDispatcher("CustomerMailing.jsp");
                    disp.include(request, response);
                    out.println("<center style=\"font-size:250%;\"><font color=red>Customer Email List</font></center>");
                    out.println("<center style=\"font-size:150%;\"><table>");

                    if (rs.first()) {
                        out.println("<tr><th>");
                        out.println(rs.getString("email"));
                        out.println("</th></tr>");

                    }
                    while (rs.next()) {
                        out.println("<tr><th>");
                        out.println(rs.getString("email"));
                        out.println("</th></tr>");
                    }
                    out.println("</table></center>");
                } catch (Exception e) {
                    e.printStackTrace();
                }finally{
                    try{
                        JdbcConnector.close();
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }

            if (action.equals("CustomerStockSugg")) {
                String email = request.getParameter("email");
                String query = "select suggestion from sugginfo where email = '" + email + "'";
                try{
                ResultSet rs = JdbcConnector.excuteQuery(query);
                if (rs.first()) {
                    disp = request.getRequestDispatcher("CustomerStockSugg.jsp");
                    disp.include(request, response);
                    out.println("<h1>Client: " + email + "</h1>");
                    out.println("<center style=\"font-size:250%;\"><font color=red>Suggest Stock</font></center>");
                    out.println("<center style=\"font-size:150%;\"><table>");
                    out.println("<tr><th>");
                    out.println(rs.getString("suggestion"));
                    out.println("</th></tr>");
                    while (rs.next()) {
                        out.println("<tr><th>");
                        out.println(rs.getString("suggestion"));
                        out.println("</th></tr>");
                    }
                    out.println("</table></center>");
                } else {
                    disp = request.getRequestDispatcher("CustomerStockSugg.jsp");
                    disp.include(request, response);
                    out.println("<center style=\"font-size:300%;\"><font color=red>Email Address is invalid!</font></center>");
                    out.println("<center style=\"font-size:300%;\"><font color=red>Please Try Aagin!</font></center>");
                }}catch(Exception e){
                    e.printStackTrace();
                }finally{
                    try{
                        JdbcConnector.close();
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
                
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
