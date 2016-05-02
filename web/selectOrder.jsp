<%-- 
    Document   : selectOrder
    Created on : May 1, 2016, 9:09:25 PM
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

        <div class="container" style = "margin-top:20px">
            <div class="content-container clearfix">

                <div class="col-md-12">
                    <div  style="font-size:150%;">
                        <form action="ViewOrdersServlet" method="GET"  >
                            <h2><strong>View Orders by Stock Symbol:</strong></h2>
                            <div class="modal-body">
                                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                                                   url ="jdbc:mysql://mysql2.cs.stonybrook.edu:3306/qixchen"
                                                   user = "qixchen" password="108605598" />
                                <sql:query dataSource = "${snapshot}" var = "result">
                                    SELECT s.StockSymbol from Stock s Group by s.StockSymbol
                                </sql:query>
                                <div style="font-size:20px;">
                                    <Span><Strong>Stock Symbol:</Strong></Span>
                                    <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="stockSymbol">
                                        <c:forEach var = "row" items ="${result.rows}">
                                            <option> <c:out value="${row.StockSymbol}"/> </option>
                                        </c:forEach>
                                    </select>
                                </div> 
                                </br>
                            </div>
                            <div class="modal-footer">

                                <div>
                                    <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >View Orders</button>
                                </div>

                            </div>

                        </form>
                        <!-- End | Register Form -->

                        <br>
                        <form action="ViewOrdersServlet" method="GET"  >
                            <h2><strong>View Orders by customer name:</strong></h2>
                            <div class="modal-body">
                                <div style="font-size:20px;">
                                    <input type="text" placeholder="Last name" name= "lastName" class="form-control" /> 
                                    <input type="text" placeholder="First name" name= "firstName" class="form-control" /> 
                                </div> 
                                </br>
                            </div>
                            <div class="modal-footer">

                                <div>
                                    <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >View Orders</button>
                                </div>

                            </div>

                            <!-- End | Register Form -->


                        </form>
                    </div>
                </div>
            </div>

            <c:import url="footer.html"/>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
            <!-- Customized js files -->

            <script src="bootstrap-3.3.6-dist/js/script.js"></script>
    </body>
</html>