<%-- 
    Document   : RecentOrderByType
    Created on : May 1, 2016, 5:06:56 PM
    Author     : Leo
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
        SELECT s.Stocksymbol, s.CompanyName ,COUNT(*) as Numorders FROM Stock s WHERE s.stocktype = "${stocktype}" GROUP BY s.StockSymbol 
        </sql:query>
        
        
        
        <h1>Most Recent Order of ${stocktype} stock</h1>
        <table class = "table">
            <tr>
                <th> Stock Symbol</th>
                <th> Company Name</th>
                <th> Num of Order</th>
            </tr>
            <c:forEach var = "row" items ="${result.rows}">
                <tr>
                <th>${row.stocksymbol}</th>
                <th>${row.companyName}</th>
                <th>${row.Numorders}</th>
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
