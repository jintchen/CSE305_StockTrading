<%-- 
    Document   : employeeRevenue
    Created on : May 1, 2016, 6:54:28 PM
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
            SELECT LastName, FirstName, p.SSN, Sum(Fee) AS TotalRevenue
            FROM transactioninfo T, orderinfo O, trade R, person P
            WHERE T.TraxID= R.TraxId AND O.OrderId=R.OrderId And P.SSN=R.SSN
            GROUP BY p.SSN 
            ORDER BY TotalRevenue DESC
            LIMIT 1

        </sql:query>
        <div class="container">
            <h2>Employee generating the most revenue</h2>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>SSN</th>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Total Revenue</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${s.rows}">
                        <tr>
                            <td>${row.SSN}</td>
                            <td>${row.LastName}</td>
                            <td>${row.FirstName}</td>
                            <td>${row.TotalRevenue}</td>
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
