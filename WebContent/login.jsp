<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/login.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body{
	background-color: #e3f4be;
}
</style>

</head>

<body>
	<c:choose>
		<c:when test="${loginId == null}">
			<div class="py-5" id="AllWrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<form action="Login.do" method="post">
								<div class="form-group">
									<label>ID Enter</label> <input type="text" class="form-control"
										name="id" placeholder="Enter id">
									<smallclass="form-texttext-muted">We'll never
									share your id with anyone else.</small>
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control" name="password" placeholder="Password">
								</div>
								<button class="btn btn-primary">Login</button>
								<a class="btn btn-primary" href="join.jsp">Sign up</a>
							</form>
						</div>
					</div>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<div class="py-5" id="AllWrapper">
				<div class="container">
					<div class="row">
						<p class="ml-3">${loginId } 님 환영합니다.</p>
						<div class="col-md-12">
							<div class="btn-group">
								<a href="BoardList.do" class="btn btn-primary">Go Board</a> <a href="#"
									class="btn btn-primary">No Name</a> <a href="#"
									class="btn btn-primary">No Name</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:otherwise>
	</c:choose>


</body>
</html>