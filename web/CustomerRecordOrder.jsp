<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE HTML>
<html>
    <c:import url="header.html"/>
    <c:import url="employeeNav.jsp"/>
    <c:import url="banner.html"/>
    <body>
        <div class="tab-pane" id="search" >

            <div class="container" style = "margin-top:40px">
                <div class="content-container clearfix">

                    <div class="col-md-12">
                        <div  style="font-size:150%;">
                            <h1>Record an order</h1>
                            <form action= "CustomerServlet" method="POST" id="loginForm" >
                                <div class="modal-body">
                                    
                                    <input type="hidden" name ="action" value ="record_order" >
                                    <%         
                                        Date date = new Date();
                                        String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
                                        String modifiedTime = new SimpleDateFormat("hh:mm:ss").format(date);
                                    %>                                 
                                    <label for="email">Client Email: </label>
                                    <input type="text" placeholder="Email" name= "email" class="form-control"/>
                                    
                                    <label for="numShares">Share Number: </label>
                                    <input type="text" placeholder="Number of Share" name= "numShares" class="form-control"/>
                                    
                                    <label for="date">Date: </label>
                                    <input type="text" value ="<%= modifiedDate%>" name= "date" class="form-control" readonly/>
                                    
                                    <label for="time">Time: </label>
                                    <input type="text" value ="<%= modifiedTime%>" name= "time" class="form-control" readonly/>
                                                 
                                    <label for="stcokSymbol">Stock: </label>
                                    <input type="text" placeholder="Stock Symbol" name= "stockSymbol" class="form-control"/> 
                                    <div style="font-size:20px;">
                                        <Span>Price Type</Span>
                                        <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="priceType" >
                                                 <option value="Market" selected="selected">Market</option>
                                                 <option value="MarketOnClose">Market On Close</option>
                                                 <option value="TrailingStop">Trailing Stop</option>
                                                 <option value="HiddenStop">Hidden Stop</option>
                                        </select>
                                    </div>
                 
                                    <div style="font-size:20px;">
                                        <Span>Order Type</Span>
                                        <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="orderType">
                                            <option value="Buy" selected="selected">Buy</option>
                                                <option value="Sell">Sell</option>
                                        </select>
                                    </div> 
                 
                                </div>
                                <div class="modal-footer">

                                    <div>
                                        <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >Confirm</button>
                                    </div>

                                </div>
                            </form> 
                                <!-- End | Register Form -->

                               
                            </div>

                        
                    </div>
                </div>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <!-- Customized js files -->

        <script src="bootstrap-3.3.6-dist/js/script.js"></script>
        </body>
        
</html>
