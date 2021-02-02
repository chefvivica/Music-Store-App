<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin index page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
	integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
	integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
	crossorigin="anonymous"></script>

<style>
body {
	background-color: #eef5e4;
}

.container {
	margin: auto;
	margin-top: 100px;
	width: 50%;
	padding: 10px;
}

h3 {
	color: #2f3775;
	font-weight: 500;
	margin-bottom: 30px;
}

h6 {
	color: #f5cb11;
	margin-bottom: 30px;
}

</style>

</head>

<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div
			class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
			<ul class="navbar-nav me-auto">
				<li class="nav-item disabled"><a class="nav-link" href="#">Chefviv
						Music Store</a></li>
				<li class="nav-item"><a class="nav-link" href="/chefviv-music">Home</a></li>
				
				<%
				if (session.getAttribute("username") == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="/admin">Manage
						Products & Customers</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="/admin-index">Manage
						Products & Customers</a></li>
				<%
				}
				;
				%>

			</ul>
		</div>
		<div class="navbar-collapse collapse w-100 order-1 dual-collapse2">
			<ul class="navbar-nav ms-auto">
				<%
				if (session.getAttribute("username") != null) {
				%>
				<li class="nav-item"><a class="nav-link disabled" href="#">
						<%
						}
						;
						%> welcome ${username}
				</a></li>
				<%
				if (session.getAttribute("username") == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="/admin">login</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="/admin-logout">logout</a>
				</li>
				<%
				}
				;
				%>

			</ul>
		</div>
	</nav>
	<div class="container">
		<h3>Chefviv Music Store Management System</h3>
		<%
		session.getAttribute("username");
		%>
		<br>
		<br>
		<hr>
		<a href="/admin/product-inventory"><button
				class="btn  btn-warning btn-sm" type="button">Product
				Inventory</button></a>
		<p>Here you can view, check and modify the product inventory!</p>
		<br>
		<br>
		<hr>
		<a href="/admin/customer-management"><button
				class="btn btn-dark btn-sm" type="button">Customer
				Management</button></a>
		<p>Here you can manage customer information</p>

	</div>

</body>

</html>