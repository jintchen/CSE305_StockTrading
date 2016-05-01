<%-- 
    Document   : editEmployee
    Created on : May 1, 2016, 3:33:14 PM
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
                            <form action="EditEmployeeServlet" method="POST" >
                                <div class="modal-body">
                                    </br>


                                    <input type="text" placeholder="SSN" name= "SSN" class="form-control" value="${e.SSN}" readonly/>
                                    <input type="text" placeholder="Last name" name= "lastName" class="form-control" value="${e.lname}"/> 
                                    <input type="text" placeholder="First name" name= "firstName" class="form-control" value="${e.fname}"/> 
                                    <input type="text" placeholder="Address" name= "address" class="form-control" value="${e.address}"/> 
                                    <input type="text" placeholder="City" name= "city" class="form-control" value="${e.city}"/> 
                                    <input type="text" placeholder="State" name= "state" class="form-control" value="${e.state}"/> 
                                    <input type="text" placeholder="ZipCode" name= "zipCode" class="form-control" value="${e.zipCode}"/> 
                                    <input type="text" placeholder="Telephone" name= "telephone" class="form-control" value="${e.telephone}"/> 
                                    <input type="text" placeholder="Start date" name= "startDate" class="form-control" value="${e.startDate}"/> 
                                    <input type="text" placeholder="Houely rate" name= "hourlyRate" class="form-control" value="${e.hourlyRate}"/> 

                                  
                                </div>
                                <div class="modal-footer">

                                    <div>
                                        <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >Edit</button>
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