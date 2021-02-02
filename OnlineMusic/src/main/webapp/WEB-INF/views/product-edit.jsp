<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>edit product form</title>
</head>

<body>
	<div class="container-xl">
		<div class="card">
			<div class="card-header"> Update a product</div>
			<div class="card-body">
				<form:form method="post" modelAttribute="product">
					<form:hidden path="id" />
					<fieldset class="form-group">
						<form:label path="name">Product Name</form:label>
						<form:input path="name" type="text" class="form-control"
							required="required" />
						<form:errors path="name" cssClass="text-warning" />
					</fieldset>
					<br>

					<fieldset class="form-group">
						<form:label path="conditionStatus">Condition</form:label>
						<form:input path="conditionStatus" type="text"
							class="form-control" required="required" />
						<form:errors path="conditionStatus" cssClass="text-warning" />
					</fieldset>
					<br>

					<fieldset class="form-group">
						<form:label path="price">Price</form:label>
						<form:input path="price" type="number" class="form-control" min="0.01" step="0.01" max="2500"
							required="required" />
						USD
						<form:errors path="price" cssClass="text-warning" />
					</fieldset>
					<br>
					<img alt="" src="${product.image}">
					<fieldset class="form-group">
						<form:label path="image">Photo</form:label>
						<form:input path="image" type="url" class="form-control"
							required="required" />
						<form:errors path="image" cssClass="text-warning" />
					</fieldset>
					<br>

					<fieldset class="form-group">
						<form:label path="genre">Genre</form:label>
						<form:select path="genre" class="form-select"
							aria-label="Default select example" required="required">
							<option value="Hip-pop">Hip-pop</option>
							<option value="Pop">Pop</option>
							<option value="Rock">Rock</option>
							<option value="Jazz">Jazz</option>
							<option value="Country music">Country music</option>
							<option value="Soul music">Soul music</option>
							<option value="Unknown">Unknown</option>F
        			</form:select>
					</fieldset>
					<br>
					<fieldset class="form-group">
						 <label for="categoryName" class="form-label">Category</label> 
						 <input type="text" class="form-control" name="categoryName" placeholder= "${product.getCategoryName()}"
							required="required">

					</fieldset>
					<br>

					<button type="submit" class="btn btn-primary">Submit</button>

				</form:form>
			</div>
		</div>
	</div>
</body>

</html>