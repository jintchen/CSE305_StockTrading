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
                            <h1>Get Customer</h1>
                            <form action= "CustomerServlet" method="POST" id="loginForm" >
                                <div class="modal-body">
                                    
                                    <input type="hidden" name ="action" value ="Get_Customer" >                               
                                    <label for="ssn">Client SSN: </label>
                                    <input type="text" placeholder="SSN" name= "ssn" class="form-control"/>
  
                                    
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