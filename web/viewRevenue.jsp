<%-- 
    Document   : viewRevenue
    Created on : May 2, 2016, 2:59:47 AM
    Author     : Tian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <c:import url="header.html"/>

    <body>
        <c:import url="adminNav.jsp"/>

        <c:import url="banner.html"/>
        <div class="container">
            <c:choose>
                <c:when test="${not empty byCustomer}">
                    <h2>Revenue by ${byCustomer}</h2>
                </c:when>
                <c:when test="${not empty byStockSymbol}">
                    <h2>Revenue of ${byStockSymbol}</h2>
                </c:when>
                <c:when test="${not empty byStockType}">
                    <h2>Revenue of ${byStockType} Type Stock</h2>
                </c:when>
                    
            </c:choose>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Transaction Id</th>
                        <th>Date</th>
                        <th>Revenue (transaction fee)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="trade" items="${t}">
                        <tr>
                            <td>${trade.transactionId}</td>
                            <td>${trade.date}</td>
                            <td>${trade.fee}</td>
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