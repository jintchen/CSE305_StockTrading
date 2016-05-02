<%-- 
    Document   : viewOrders
    Created on : May 2, 2016, 1:30:08 AM
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
                    <h2>Orders by ${byCustomer}</h2>
                </c:when>
                <c:when test="${not empty byStock}">
                    <h2>Orders of ${byStock}</h2>
                </c:when>
            </c:choose>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Number of Shares</th>
                        <th>Date</th>
                        <th>Price Type</th>
                        <th>Order Type</th>
                        <th>Stock Symbol</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${o}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.numShares}</td>
                            <td>${order.date}</td>
                            <td>${order.priceType}</td>
                            <td>${order.orderType}</td>
                            <td>${order.stockSymbol}</td>
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
