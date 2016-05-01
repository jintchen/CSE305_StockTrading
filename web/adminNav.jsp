<%-- 
    Document   : adminNav
    Created on : Apr 25, 2016, 7:12:37 PM
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Manager <span class="glyphicon glyphicon-chevron-down"></span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row">
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header">Stock</li>

                                    <li><a href="/setStock.jsp">Set stock price</a></li>

                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header">Employee</li>

                                    <li><a href="/addEmployee.jsp">Add Employee</a></li>
                                    <li><a href="/getEmployee.jsp">Edit Employee information</a></li>
                                    <li><a href="/deleteEmployee.jsp">Delete Employee</a></li>

                                </ul>
                            </li>
                        </ul>

                    </li>
                </ul>
                        <ul class="nav navbar-nav navbar-right">                    
                            <li><a href="index.jsp">Log out</a></li>
                        </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</html>
