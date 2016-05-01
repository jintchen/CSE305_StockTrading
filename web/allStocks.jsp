<%-- 
    Document   : allStocks
    Created on : May 1, 2016, 5:43:20 PM
    Author     : Tian
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Stock"%>
<%@page import="java.util.List"%>
<%@page import="Connector.JdbcConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <c:import url="header.html"/>

    <body>
        <c:import url="adminNav.jsp"/>

        <c:import url="banner.html"/>
        <%
            try {
                ResultSet rs = JdbcConnector.excuteQuery("SELECT * FROM stock");
                List<Stock> s = new ArrayList();
                while (rs.next()) {
                    Stock stock = new Stock();
                    stock.setCompanyName(rs.getString("CompanyName"));
                    stock.setNumShares(rs.getInt("NumberShare"));
                    stock.setPricePerShare(rs.getFloat("PricePerShare"));
                    stock.setStockSymbol(rs.getString("StockSymbol"));
                    stock.setType(rs.getString("StockType"));
                    s.add(stock);
                }
                pageContext.setAttribute("s", s);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    JdbcConnector.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        %>
        <div class="container">
            <h2>All Stocks</h2>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Stock Symbol</th>
                        <th>Company Name</th>
                        <th>Stock Type</th>
                        <th>Price per Share</th>
                        <th>Number of Shares</th>>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stock" items="${s}">
                        <tr>
                            <td>${stock.stockSymbol}</td>
                            <td>${stock.companyName}</td>
                            <td>${stock.type}</td>
                            <td>${stock.pricePerShare}</td>
                            <td>${stock.numShares}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:import url="footer.html"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <!-- Customized js files -->

        <script src="bootstrap-3.3.6-dist/js/script.js"></script>
    </body>
</html>