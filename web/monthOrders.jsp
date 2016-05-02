<%-- 
    Document   : monthOrderS
    Created on : May 1, 2016, 8:32:52 PM
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
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT StockId, O.Dates, NumShares,PricePerShare
            From trade T, orderinfo O, transactioninfo R
            where T.OrderId=O.OrderId and T.TraxId=R.TraxId AND MONTH(O.Dates)= ${param.month} and YEAR(O.Dates)=${param.year}
        </sql:query>
        <div class="container">
            <h2>Stocks traded in ${param.month}/${param.year}</h2>
            <br>
            <table class = "table">
                <thead>
                    <tr>
                        <th>Stock Symbol</th>
                        <th>Date</th>
                        <th>Number of Shares</th>
                        <th>Price per Share</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row" items ="${result.rows}">
                        <tr>
                            <th>${row.StockId}</th>
                            <th>${row.Dates}</th>
                            <th>${row.NumShares}</th>
                            <th>${row.PricePerShare}</th>

                        </tr>
                    </tbody>
                </c:forEach>

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
