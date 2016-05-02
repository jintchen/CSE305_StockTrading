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
                            <form action="CustomerServlet" method="POST" >
                                <div class="modal-body">
                                    </br>
                                    <jsp:useBean id= "c" class="Beans.Client" scope="session"/>
                                    
                                    <input type="hidden" name ="action" value ="Edit_Customer"/>       
                                    <input type="text" placeholder="SSN" name= "SSN" class="form-control" value="<%=c.getSSN()%>" readonly/>
                                    <input type="text" placeholder="Last name" name= "lastName" class="form-control" value="<%=c.getLname()%>"/> 
                                    <input type="text" placeholder="First name" name= "firstName" class="form-control" value="<%=c.getFname()%>"/> 
                                    <input type="text" placeholder="Address" name= "address" class="form-control" value="<%=c.getAddress()%>"/> 
                                    <input type="text" placeholder="City" name= "city" class="form-control" value="<%=c.getCity()%>"/> 
                                    <input type="text" placeholder="State" name= "state" class="form-control" value="<%=c.getState()%>"/> 
                                    <input type="text" placeholder="ZipCode" name= "zipCode" class="form-control" value="<%=c.getZipCode()%>"/> 
                                    <input type="text" placeholder="Telephone" name= "telephone" class="form-control" value="<%=c.getTelephone()%>"/> 
                                    <input type="text" placeholder="Credit Card Number" name= "credit" class="form-control" value="<%=c.getCCN()%>"/> 
                                    <input type="text" placeholder="Rating" name= "rating" class="form-control" value="<%=c.getRating()%>"/> 
                           
                                </div>
                                <div class="modal-footer">

                                    <div>
                                        <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >Edit</button>
                                    </div>

                                </div>

                                <!-- End | Register Form -->
                            </form>
                          </div>

                        
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