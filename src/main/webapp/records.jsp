<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="database.RecordDetails"%>
<%@ page import="database.RecordDBAO"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/driver.css">
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.0.0.js"></script>
<title>Record Page</title>
</head>
<body>
<%
RecordDBAO recordDBAO = new RecordDBAO();
List recordDetails = null;
recordDetails = recordDBAO.getRecords();
%>
	<div class="dashboard">
		<div class="box favorite_driver">
			<h2 class="box_title">Records</h2>
			<table class="table table-bordered">
				<tr>
					<td>Status</td>
					<td>Deliver Date</td>
					<td>Route</td>
					<td>Driver</td>
					<td>Type</td>
					<td>Price</td>
				</tr>
				<%
				List<RecordDetails> list = (List<RecordDetails>) recordDetails;
				for (RecordDetails t : list) {
				%>
				<tr>
	<%-- 				<td><%=t.getId()%></td> --%>
					<td><%=t.getStatusName()%></td>
					<td><%=t.getDelivery_date()%></td>
					<td><%=t.getRoute()%></td>
					<td><%=t.getDriver()%></td>
					<td><%=t.getTypeName()%></td>
					<td><%=t.getPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>