<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory page</title>
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
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

.container-xl {
	margin-top: 30px;
}

img {
	width: 150px;
	heigh: 40px;
}
</style>
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
		<div class="d-grid gap-3">
			<div class="container-xl">
				<div class="row">
					<div class="col">
						<h3>All products:</h3>
					</div>
					<div class="col">
						<a href="/admin/add-product"><button
								class="btn btn-success btn-sm">Add Product</button></a>
					</div>

				</div>
				<hr>
				<div class="container-lg">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th>Photo Thumb</th>
								<th>Product Name</th>
								<th>Category</th>
								<th>Condition</th>
								<th>Price</th>
								<th></th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${products}" var="product">
								<tr>
									<td><img src="${product.image}"></td>
									<td>${product.name}</td>
									<td>${product.getCategoryName()}</td>
									<td>${product.conditionStatus}</td>
									<td>${product.price}</td>
									<td><a href="/admin/product-detail/${product.id}" type="button"
										class="btn btn-secondary btn-sm"><i
											class="fas fa-info-circle"></i></a> <a
										href="/remove-product/${product.id}" type="button"
										class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a>
										<a href="/edit-product/${product.id}" type="button"
										class="btn btn-warning btn-sm"><i
											class="fas fa-pencil-alt"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>

	</div>

</body>

</html>