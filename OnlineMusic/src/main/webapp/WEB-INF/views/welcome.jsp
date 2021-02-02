
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome page</title>
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

h1 {
	color: #a16662;
	font-weight: 900;
}

.card .card-title {
	text-align: right;
	margin-top: 230px;
}

.card .card-text {
	text-align: right;
}

img {
	width: 150px;
	heigh: 20px;
}

#card-text {
	color: #9e9190;
	font-weight: 900;
}

.card-img {
	height: 550px;
}

.card-body {
	margin: 50px;
}

.card-img-top{
	max-height: 240px;
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
			</ul>
		</div>
		<div class="navbar-collapse collapse w-100 order-1 dual-collapse2">
			<ul class="navbar-nav ms-auto">

				<li class="nav-item"><a class="nav-link" href="/registration">Register</a></li>
				<li class="nav-item"><a class="nav-link" href="/usercart">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="/admin">Admin</a>
				</li>
			</ul>

		</div>
	</nav>


	<div class="card  text-black text-center">

		<div id="gallery-view" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://i.pinimg.com/originals/e6/0e/53/e60e531bb26f15c5f69c2cb35633bf46.jpg"
						class="card-img" alt="...">

				</div>
				<div class="carousel-item">
					<img src="https://wallpapercave.com/wp/wp4131588.jpg"
						class="card-img" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://i.pinimg.com/originals/35/cb/7b/35cb7b0ea2cb8a498e6ddcf433b002e1.jpg"
						class="card-img" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#gallery-view" role="button"
				data-bs-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#gallery-view" role="button"
				data-bs-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Next</span>

			</a>
		</div>

		<div class="card-img-overlay">
			<h1 class="card-title">It's A Jazz Affair</h1>
			<p id="card-text" class="card-text">Through ups and downs,
				somehow I manage to survive in life.</p>
		</div>

		<div class="card-body">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="card">
						<img
							src="https://images.all-free-download.com/images/graphicthumb/abstract_cd_cover_vector_background_520679.jpg"
							class="card-img-top" alt="...">
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img
							src="https://www.popsci.com/resizer/rOsfYqQjmtR8AFbvd1yuJ28ypTE=/760x570/filters:focal(500x375:501x376)/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/QDDBI4F3Z2RK7MSDAL6BM73I2U.jpg"
							class="card-img-top" alt="...">
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img
							src="https://nairametrics.com/wp-content/uploads/2016/11/music-shows-in-lagos.jpg"
							class="card-img-top" alt="...">
					</div>
				</div>

			</div>
		</div>

	</div>

</body>

</html>