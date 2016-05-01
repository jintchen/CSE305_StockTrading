<%-- 
    Document   : CustomerCurrentStock
    Created on : Apr 30, 2016, 9:34:09 PM
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
        
        <h1> The Current Stock </h1>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url ="jdbc:mysql://mysql2.cs.stonybrook.edu:3306/qixchen"
                           user = "qixchen" password="108605598" />
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT p.email ,p.stocksymbol,p.numbershare from portfolio p where p.email = "${email}"
           </sql:query>
            <table class = "table">
                
            <tr>
                <th>Account</th>
                <th>Stock</th>
                <th># of Share</th>
            </tr>
            <c:forEach var = "row" items ="${result.rows}">
                <tr>
                    <td> <c:out value="${row.email}"/></td>
                    <td> <c:out value="${row.stocksymbol}"/></td>
                    <td> <c:out value="${row.numbershare}"/></td>
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
