<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
	integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
	integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
	crossorigin="anonymous">
	
</script>

<title>product form</title>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #eef5e4;
}

img {
	width: 150px;
	heigh: 40px;
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
	<div class="container-xl">
		<div class="card">
			<div class="card-header">Add a new product</div>
			<div class="card-body">
				<form method="post" modelAttribute="product">
					<div class="mb-3">
						<label for="name" class="form-label">Product Name</label> <input
							type="text" class="form-control" name="name" required="required">
					</div>

					<div class="mb-3">
						<label for="condition_status" class="form-label">Condition</label>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								name="conditionStatus" value="new" id="flexCheckDefault"
								autofocus> <label class="form-check-label"
								for="flexCheckDefault"> New </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								name="conditionStatus" value="used" id="flexCheckChecked">
							<label class="form-check-label" for="flexCheckChecked">
								Used </label>
						</div>

					</div>
					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="number" class="form-control" name="price" min="0.01"
							step="0.01" max="2500" required="required">USD
					</div>
					<div class="mb-3">
						<label for="image" class="form-label">Photo Url</label> <input
							type="url" class="form-control" name="image" required="required">
					</div>

					<div class="mb-3">
						<label for="genre" class="form-label">Genre</label> <select
							class="form-select" aria-label="Default select example"
							name="genre" required="required">
							<option selected>Select music genre</option>
							<option value="Hip-pop">Hip-pop</option>
							<option value="Pop">Pop</option>
							<option value="Rock">Rock</option>
							<option value="Jazz">Jazz</option>
							<option value="Country music">Country Music</option>
							<option value="Soul music">Soul Music</option>
							<option value="Unknown">Unknown</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="" class="form-label">Category</label> <input
							type="text" class="form-control" name="categoryName"
							required="required">
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>
</body>

</html>