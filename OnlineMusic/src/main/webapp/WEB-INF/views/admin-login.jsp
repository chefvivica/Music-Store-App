<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login page</title>
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

h4 {
	text-decoration: double;
	margin-top: 20px;
}

h5 {
	color: #2f3775;
	font-weight: 900;
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
		<h5>${headerMessage}</h5>
		<h4>Login in as an administrator</h4>
		<form method="post" modelAttribute="user">
			<div class="mb-3 row">
				<label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="manager" name="username">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword"
						name="password">
				</div>
			</div>
			<button type="submit" class="btn btn-success btn-sm">Login</button>
		</form>
	</div>

</body>

</html>