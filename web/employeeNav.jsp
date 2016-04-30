<%-- 
    Document   : employeeNav
    Created on : Apr 30, 2016, 6:23:37 PM
    Author     : Tian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adminPage.jsp">Simple Trade</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">
                    <li class="dropdown mega-dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Employee <span class="glyphicon glyphicon-chevron-down"></span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row">
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header">Subject</li>

                                    <li><a href="display_page.html">Business</a></li>
                                    <li><a href="#">Fiction</a></li>
                                    <li><a href="#">Nonfiction</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Religion</a></li>
                                    <li><a href="#">Education</a></li>
                                    <li><a href="#">Science</a></li>
                                    <li><a href="#">Medic</a></li>
                                    <li><a href="#">More...</a></li>

                                </ul>
                            </li>
                        </ul>

                    </li>
                </ul>
                <c:choose>

                    <c:when test="${not empty account.userName}">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${account.userName}</a></li>                        
                            <li><a href="index">Log out</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#" onclick = "location.href = 'index.jsp'"><span class="glyphicon glyphicon-user login"></span> Login</a></li>                        
                        </ul>

                    </c:otherwise>
                </c:choose>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</html>