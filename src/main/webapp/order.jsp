<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="database.TransDetail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/order.css">
		<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.0.0.js"></script>
		<title>Order Page</title>
	</head>
<body>
	
	<div id="header">
		<div id="selected_type">
			<img src="images/car3.png">
			<p id="selected_type_name">Transportation Type: MPV</p>
			<p id="selected_price">Starting Price: 100</p>
			<p id="selected_volume">Volume: 10*10*10 cm</p>
		</div>
		<div id="option_type">
		<% List<TransDetail> list = (List<TransDetail>)request.getAttribute("list"); %>
			<% if(null != list) { %>
			<ul>
			<% for(TransDetail t : list) { %>
				<li class="car_type" price=<%=t.getPrice() %> type=<%=t.getTypeName() %> volume=<%=t.getVolume() %>>
					<img src=<%=t.getImage() %>>
				</li>
			<% }%>
			</ul>
		<% } else {%>
			<ul>
				<li><img src="images/car1.jpg"></li>
				<li><img src="images/car2.jpg"></li>
				<li><img src="images/car3.jpg"></li>
			</ul>
		<% } %>
		</div>
	</div>
	
	
	<div id="content">
		<form action="RegisterServlet" method="GET" style="text-align:center">
			<div style="height:10%">
				<%-- <span style="text-align:right;width:5%;margin-left:20%">User ID  : </span> --%>
				<input type="text" name="userName" size="20" class="input" placeholder="PICK UP LOCATION">
			</div>
			<div style="height:10%">
				<%-- <span style="text-align:right;width:5%;margin-left:17%">Password : </span> --%>
				<input type="password" name="password" size="20" class="input" placeholder="DROP OFF LOCATION">
			</div>
			<div><input type="submit" value="Confirm" class="submit"></div>
		</form>
	</div>
	
	<script type="text/javascript">
		/*
		window.onload = function(){
	        $.ajax({
	        	type:"get",
	        	url:"/FlashMove/transportation",
	        	success:function(data) {
	        		$.each(data, function(index, ele) {
	        			$("#types").append("<li>" + ele.price + "</li>");
	        		})
	        	}
	        })
	    }
		*/
	
		$(".car_type").click(function(){
			$(this).find('img').each(function(index,img) {
				var path = $(img).attr('src');
				console.log(path);
				$("#selected_type img").attr('src',path);
			})
			console.log($(this).attr('type'));
			console.log($(this).attr('price'));
			console.log($(this).attr('volume'));
			var type = $(this).attr("type");
			var price = $(this).attr("price");
			var volume = $(this).attr("volume");
			$("#selected_type_name").text("Transportation Type: " + type);
			$("#selected_price").text("Starting Price: " + price);
			$("#selected_volume").text("Volume: " + volume + " cm");
		});
	</script>
</body>
</html>