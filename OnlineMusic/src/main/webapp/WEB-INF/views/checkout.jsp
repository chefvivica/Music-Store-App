
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>billing address page</title>
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
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #eef5e4;
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
				<li class="nav-item"><a class="nav-link" href="/products">Products</a></li>
				<li class="nav-item"><a class="nav-link" href="/usercart">Cart</a></li>

			</ul>
		</div>
		<div class="navbar-collapse collapse w-100 order-1 dual-collapse2">
			<ul class="navbar-nav ms-auto">
				<%
				if (session.getAttribute("username") != null) {
				%>
				<li class="nav-item"><a class="nav-link disabled" href="#">
						<%
						} ;
						%> welcome ${username}
				</a></li>
				<%
				if (session.getAttribute("username") == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="login">login</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="logout">logout</a>
				</li>
				<%
				} ;
				%>
				<li class="nav-item"><a class="nav-link" href="registration">Register</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">

		<div class="container-md">
			<form method="post" modelAttribute="ship">
				<div class="mb-3">
					<h2>Shipping address</h2>
				</div>

				<div class="mb-3">
					<label for="firstName" class="form-label">Name</label> <input
						type="text" class="form-control" name="name" required="required">
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email address</label> <input
						type="email" class="form-control" name="email" required="required">
				</div>

				<div class="mb-3">
					<label for="phone" class="form-label">Phone Number</label> <input
						type="text" class="form-control" name="phone" required="required">
				</div>

				<div class="mb-3">
					<label for="streetName" class="form-label">Street Name</label> <input
						type="text" class="form-control" name="street" required="required">
				</div>
				<div class="mb-3">
					<label for="aptNumber" class="form-label">Apartment No.</label> <input
						type="text" class="form-control" name="apt" required="required">
				</div>

				<div class="mb-3">
					<label for="city" class="form-label">City</label> <input
						type="text" class="form-control" name="city" required="required">
				</div>

				<div class="mb-3">
					<label for="state" class="form-label">State</label> <input
						type="text" class="form-control" name="state" required="required">
				</div>
				<div class="mb-3">
					<label for="zipcode" class="form-label">zip code</label> <input
						type="number" class="form-control" name="zipcode"
						required="required">
				</div>
				<input type="hidden" name="role" value="user">
				<button type="submit" class="btn btn-primary">Next</button>
				<a href="/usercart" type="button" class="btn btn-dark">Cancel</a>
			</form>
		</div>
	</div>
</body>

</html>
