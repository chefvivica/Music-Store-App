<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart page</title>
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
<script src="https://kit.fontawesome.com/yourcode.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #eef5e4;
}

.card-footer {
	margin-top: 40px;
}

h1 {
	margin-top: 30px;
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
						}
						;
						%> welcome ${username}
				</a></li>
				<%
				if (session.getAttribute("username") == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="/login">login</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="/logout">logout</a>
				</li>
				<%
				}
				;
				%>
				<li class="nav-item"><a class="nav-link" href="/registration">Register</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-xl">
		<div class="card ">
			<div class="card-header">
				<h1>Cart:</h1>
				<p>All the selected products in your shopping cart</p>
			</div>
			<div class="card-body">
				<div class="d-grid gap-3">
					<div class="row">
						<div class="col-md-4 ">
							<a href="/clear-cart"><button class="btn btn-primary">
									Clear Cart <i class="fas fa-trash-alt"></i>
								</button></a>
						</div>
						<div class="col-md-4 offset-md-4 ">
							<%
							if (session.getAttribute("username") == null) {
							%>
							<a href="/login"><button class="btn btn-success ">
									Checkout<i class='fas fa-shopping-cart'></i>
								</button></a>
							<%
							} else {
							%>
							<a href="/checkout"><button class="btn btn-success ">
									Checkout<i class='fas fa-shopping-cart'></i>
								</button></a>
							<%
							}
							;
							%>


						</div>
					</div>
				</div>
				<hr>
				<div class="container-lg">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th>Product</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cart}" var="entry">
								<tr>

									<td>${entry.key.name}</td>
									<td>${entry.key.price}</td>
									<td>${entry.value}</td>
									<td><fmt:parseNumber var="i" type="number"
											value="${entry.key.price}" /> <fmt:parseNumber var="h"
											type="number" value="${entry.value}" /> <c:out
											value="${i*h}" /></td>
									<td><a href="/remove-item/${entry.key.id}" type="button"
										class="btn btn-danger btn-sm">remove <i class="fas fa-times"></i></a></td>
								</tr>


							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><h5>Grand Total</h5></td>
								<td><c:out value="${sum}" /></td>
							</tr>
						</tbody>
					</table>
					<a href="/products" type=button class="btn btn-secondary">Continue
						Shopping</a>
				</div>
				<div class="card-footer text-muted">
					<h6>
						&copy; copyright @ 2020 by HCL Technologies Inc. <span>
							Developer: chefviv</span>
					</h6>
				</div>

			</div>
		</div>
	</div>



</body>

</html>