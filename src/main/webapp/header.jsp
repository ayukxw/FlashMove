<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.DriverDetails" %>
<%-- <%
boolean isLogin = false;
if(session.getAttribute("isUserLogin") != null)
	isLogin = (boolean) session.getAttribute("isUserLogin");

%> --%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--     <link rel="stylesheet" href="css/assets/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/assets/owl.theme.default.css"/> --> 
	<link rel="stylesheet" href="css/header.css"/> 
  </head>
  <body>
  	<div class="header">
  		<div class="container">
  			<div class="header_content ">
  				FLASH MOVE
  			</div>
  			 <div class="main_nav">
  				<ul class="nav nav-pills pull-left">
  					<li  class="nav-item"><a href="http://localhost:8080/FlashMove/transportation" class="nav-link">Place Order</a></li>
					<li  class="nav-item"><a href="records.jsp" class="nav-link">Records</a></li>
					<li  class="nav-item"><a href="driverInfo.jsp" class="nav-link">Drivers</a></li>						
  				</ul>
  			</div> 
  		</div>
  	</div>
  	<section class="main_contents">
  		<div class="container">
  		<div class="main_contents_inner" >
