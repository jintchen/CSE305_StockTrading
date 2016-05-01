<%-- 
    Document   : OrderHistory
    Created on : May 1, 2016, 4:36:52 PM
    Author     : Leo
    need to save user name in seesion  when client login, arribute name is email
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <c:import url="header.html"/>
    <body>
        <c:import url="clientNav.jsp"/>
        <c:import url="banner.html"/>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url ="jdbc:mysql://mysql2.cs.stonybrook.edu:3306/qixchen"
                           user = "qixchen" password="108605598" />
        <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * FROM orderinfo WHERE Email = "${email}"
        </sql:query>
        
        <h1>Order History</h1>
        <p></p>
        <table class = "table">
                
            <tr>
                <th>OrderID</th>
                <th>NumShares</th>
                <th>Dates</th>
                <th>Times</th>
                <th>PriceType</th>
                <th>OrderType</th>
                <th>Email</th>
                <th>StockSymbol</th>
            </tr>
            <c:forEach var = "row" items ="${result.rows}">
                <tr>
                    <td> <c:out value="${row.OrderID}"/></td>
                    <td> <c:out value="${row.NumShares}"/></td>
                    <td> <c:out value="${row.Dates}"/></td>
                    <td> <c:out value="${row.Times}"/></td>
                    <td> <c:out value="${row.PriceType}"/></td>
                    <td> <c:out value="${row.OrderType}"/></td>
                    <td> <c:out value="${row.Email}"/></td>
                    <td> <c:out value="${row.StockSymbol}"/></td>
                    
                </tr>
            </c:forEach>
                
            </table>
       
        <c:import url="footer.html"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <!-- Customized js files -->

        <script src="bootstrap-3.3.6-dist/js/script.js"></script>
    </body>
</html>
