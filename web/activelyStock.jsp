<%-- 
    Document   : activelyStock
    Created on : May 1, 2016, 7:40:36 PM
    Author     : Tian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <c:import url="header.html"/>

    <body>
        <c:import url="adminNav.jsp"/>

        <c:import url="banner.html"/>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url ="jdbc:mysql://mysql2.cs.stonybrook.edu:3306/qixchen"
                           user = "qixchen" password="108605598" />
        <sql:query dataSource = "${snapshot}" var = "s">
            SELECT O.stockSymbol, O.companyName, O.stockType,Count(T.StockId)as tradeCount
            FROM trade T, stock O
            WHERE T.StockId=O.StockSymbol
            GROUP BY StockId
            ORDER BY tradeCount DESC
            LIMIT 10

        </sql:query>
        <div class="container">
            <h2>Actively Stocks</h2>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Stock Symbol</th>
                        <th>Company Name</th>
                        <th>Stock Type</th>
                        <th>Number of Trades</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stock" items="${s.rows}">
                        <tr>
                            <td>${stock.stockSymbol}</td>
                            <td>${stock.companyName}</td>
                            <td>${stock.stockType}</td>
                            <td>${stock.tradeCount}</td>
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