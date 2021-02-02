<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt page</title>
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

.card-footer {
	margin-top: 30px
}

.card-body {
	width: 70%;
	margin-left: 130px;
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
		<div>
			<h3>Order</h3>
			<p>Order Confirmation</p>
		</div>
		<div class="card">

			<div class="card-header text-center">
				<h1>Receipt</h1>
			</div>


			<div class="card-body">
				<div class="d-grid gap-3">
					<div class="row">
						<!-- col -->
						<div class="col">

							<%
							session.getAttribute("ship");
							%>
							<!-- container -->
							<div class="container-sm">

								<!-- row 1 -->
								<div class="row">
									<div class="col align-self-start">
										<h6>Shipping Address</h6>
									</div>

									<div class="col align-self-end">
										<h6>
											<jsp:useBean id="now" class="java.util.Date" />
											Shipping Date :
											<fmt:formatDate value="${now}"
												pattern="MM-dd-yyyy HH:mm:ss a z" />
										</h6>
									</div>
								</div>
								<!-- row 1 -->
								<div class="row">
									<p>${ship.getStreet()}</p>
									<p>${ship.getApt()},${ship.getCity()}</p>
									<p>${ship.getState()},${ship.getZipcode()}</p>
								</div>
							</div>
							<!-- container -->
						</div>
						<!-- col -->
					</div>
				</div>
				<form method="post">

					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th>Product</th>
								<th>#</th>
								<th>Price</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cart}" var="entry">
								<tr>
									<td>${entry.key.name}</td>
									<td>${entry.value}</td>
									<td>${entry.key.price}</td>
									<td><fmt:parseNumber var="i" type="number"
											value="${entry.key.price}" /> <fmt:parseNumber var="h"
											type="number" value="${entry.value}" /> <c:out
											value="${i*h}" /></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<%
								session.getAttribute("sum");
								%>
								<td>Grand Total:</td>
								<td>$${sum}</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-2 .col-sm-3">
							<a href="/checkout" type="button" class="btn btn-light btn-sm">Back</a>
						</div>

						<div class="col-2 .col-sm-3">
							<button type="submit" class="btn btn-success btn-sm">Submit
								Order</button>
						</div>

						<div class="col-2 .col-sm-3">
							<a href="/usercart" type="button" class="btn btn-light btn-sm">Cancel</a>
						</div>
					</div>
				</form>
			</div>

			<div class="card-footer text-muted">
				<h6>
					&copy; copyright @ 2020 by HCL Technologies Inc. <span>
						Developer: chefviv</span>
				</h6>
			</div>
		</div>
	</div>

</body>
</html>





















