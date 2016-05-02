<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <h1>Add Customers</h1>
                            <form action= "CustomerServlet" method="POST" id="loginForm" >
                                <div class="modal-body">
                                    
                                    <input type="hidden" name ="action" value ="Add_Customer" >
                              
                                    <label for="ssn">SSN: </label>
                                    <input type="text" placeholder="SSN" name= "ssn" class="form-control"/>
                                    
                                    <label for="fname">Last Name: </label>
                                    <input type="text" placeholder="Last Name" name= "lname" class="form-control"/>
                                    
                                    <label for="date">First Name: </label>
                                    <input type="text" placeholder= "First Name" name= "fname" class="form-control"/>
                                    
                                    <label for="addr">Address: </label>
                                    <input type="text" placeholder="Address" name= "addr" class="form-control"/> 
                                    
                                    <label for="city">City: </label>
                                    <input type="text" placeholder="City" name= "city" class="form-control"/> 
                                    
                                    <label for="state">State: </label>
                                    <input type="text" placeholder="State" name= "state" class="form-control"/> 
                                    
                                    <label for="zip">Zip Code: </label>
                                    <input type="text" placeholder="Zip Code" name= "zip" class="form-control"/>
                                    
                                    <label for="telephone">Telephone Number: </label>
                                    <input type="text" placeholder="Phone Number(format:xxxxxxxxxx)" name= "telephone" class="form-control"/> 
                                    
                                    <label for="email">Email: </label>
                                    <input type="text" placeholder="Email" name= "email" class="form-control"/> 
                                    
                                    <label for="pass">Password: </label>
                                    <input type="password" placeholder="Passwrod" name= "pass" class="form-control"/> 
                                    
                                    
                                    <label for="credit">Credit Card#: </label>
                                    <input type="text" placeholder="################" name= "credit" class="form-control"/> 
                                    <%         
                                        Date date = new Date();
                                        String CDate= new SimpleDateFormat("yyyy-MM-dd").format(date);   
                                    %>    
                                    
                                    <label for="CDate">Created Date: </label>
                                    <input type="text" value ="<%= CDate%>" name= "CDate" class="form-control" readonly/>
                                                                        
                                    <div style="font-size:20px;">
                                        <Span>Rating</Span>
                                        <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="rate" >
                                                 <option value="1" selected="selected">1</option>
                                                 <option value="2">2</option>
                                                 <option value="3">3</option>
                                                 <option value="4">4</option>
                                                 <option value="5">5</option>
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