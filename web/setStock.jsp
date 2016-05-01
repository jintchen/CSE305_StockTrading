<%-- 
    Document   : setStock
    Created on : May 1, 2016, 12:21:29 AM
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
        <div class="container" style = "margin-top:40px">
                <div class="content-container clearfix">

                    <div class="col-md-12">
                        <div  style="font-size:150%;">
                            <form action="SetStockServlet" method="POST" >
                                <div class="modal-body">
                                    </br>


                                    <input type="text" placeholder="Stock Symbol" name= "stockSymbol" class="form-control"/>

                                    <input type="text" placeholder="Stock Price" name= "stockPrice" class="form-control"/> 

                                  
                                </div>
                                <div class="modal-footer">

                                    <div>
                                        <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >Set Stock</button>
                                    </div>

                                </div>

                                <!-- End | Register Form -->

                            </div>

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
