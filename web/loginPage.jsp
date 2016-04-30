
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
        <div class="tab-pane" id="search" >

            <div class="container" style = "margin-top:40px">
                <div class="content-container clearfix">

                    <div class="col-md-12">
                        <div  style="font-size:150%;">
                            <form action="LoginServlet" method="POST" id="loginForm" >
                                <div class="modal-body">
                                    <div style="font-size:20px;">
                                        <Span><Strong>Sign in as:</Strong></Span>
                                        <select style="margin-right: 40%" id="selectSign" onchange="selectSignIn();" name="role">
                                            <option value="Client">Client</option>
                                            <option value="Employee">Employee</option>
                                            <option value="Manager">Manager</option>
                                        </select>
                                    </div> 
                                    </br>


                                    <input type="text" placeholder="Username" name= "username" class="form-control"/>

                                    <input type="password" id="register_password" placeholder="Password" name= "password" class="form-control"/> 

                                  
                                </div>
                                <div class="modal-footer">

                                    <div>
                                        <button type="submit" value = "Submit" class="btn btn-primary btn-lg btn-block" >Sign in</button>
                                    </div>

                                </div>

                                <!-- End | Register Form -->

                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <!-- Customized js files -->

        <script src="bootstrap-3.3.6-dist/js/script.js"></script>
</html>

