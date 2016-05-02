<%-- 
    Document   : selectMonth
    Created on : May 1, 2016, 8:21:21 PM
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

        <div class="container" style = "margin-top:20px">
            <div class="content-container clearfix">

                <div class="col-md-12">
                    <div  style="font-size:150%;">
                        <form action="monthOrders.jsp" method="GET"  >
                            <div class="modal-body">
                                <div style="font-size:20px;">
                                    <Span><Strong>Month:</Strong></Span>
                                    <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="month">
                                        <option value="1" selected="selected">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>
                                <br>
                                <div style="font-size:20px;">
                                    <Span><Strong>Year:</Strong></Span>
                                    <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="year">
                                        <option value="2016" selected="selected">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                        <option value="2010">2010</option>
                                        <option value="2009">2009</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                    </select>
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