
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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

                                    <input type="text" placeholder="Password" name= "password" class="form-control"/> 

                                  
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

</html>

