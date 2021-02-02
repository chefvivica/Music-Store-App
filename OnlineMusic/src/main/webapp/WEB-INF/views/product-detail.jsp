<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product detail page</title>
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
				<li class="nav-item"><a class="nav-link" href="/login">login</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="/logout">logout</a>
				</li>
				<%
				} ;
				%>
				<li class="nav-item"><a class="nav-link" href="/registration">Register</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-xl">

		<div class="card">
			<div class="card-header"></div>
			<div class="card-body">
				<h5 class="card-title">Product Detail</h5>
				<p class="card-text">Here is the detail information of the
					product!</p>
				<hr>
				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<img src="${product.image}" />
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Product Name: ${product.getName()}</h4>
								<p class="card-text ">
									<strong>Category:</strong> ${product.getCategoryName()}
								</p>
								<p class="card-text">
									<strong>Condition:</strong> ${product.conditionStatus}
								</p>
								<p class="card-text">
									<strong>Price:</strong> ${product.price}
								</p>
								<div class="row text-center">
									<div class="col-sm-4">
										<a href="/products" class="btn btn-primary">Back</a>
									</div>

									<%
									if (session.getAttribute("username") == null) {
									%>
									<div class="col-sm-4">
										<a href="/login" type="button" class="btn btn-success btn-sm">
											Order Now <i class='fas fa-shopping-cart'></i>
										</a>
									</div>
									<%
									} else {
									%>
									<div class="col-sm-4">
										<button onclick="orderProduct()" class="btn btn-success btn-sm">
											Order Now <i class='fas fa-shopping-cart'></i>
										</button>
									</div>
									<%
									} ;
									%>

								</div>
							</div>
						</div>
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
	</div>

	<script>
		function orderProduct() {
			let message = window
					.confirm("Are you sure you want to add this product into your cart?")
			if (message) {
				window
						.alert("This product has been added into your cart successfully");
				window.location
						.replace("http://localhost:8080/order/${product.id}")
			}

		}
	</script>
</body>

</html>
