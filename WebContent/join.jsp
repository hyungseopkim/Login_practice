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
	#minsu{
		margin : auto;
	}
	
	body{
		background-color: #e3f4be;
	}
</style>
<script>
	window.onload = function() {
		document.getElementById("bt1").onclick = function() {
			if (document.getElementById("id").value == "") {
				alert("아이디를 입력해주세요.");
			} else {
				window.open("idCheck.jsp?id="
						+ document.getElementById("id").value, "_blank",
						"width=300px,height=200px");
			}
		}
		document.getElementById("pwcheck").onkeyup = function() {
			pwcheck();
		}

		document.getElementById("pw").onkeyup = function() {
			pwcheck();
		}

		function pwcheck() {
			var pw1 = document.getElementById("pw").value;
			var pw2 = document.getElementById("pwcheck").value;

			if (pw1 == pw2) {
				document.getElementById("msg2").innerHTML = "패스워드가 일치합니다.";
			} else {
				document.getElementById("msg2").innerHTML = "패스워드가 일치하지 않습니다."
			}
		}

		document.getElementById("name").onkeyup = function() {
			var name1 = document.getElementById("name").value
			var regex = /[^가-힣]{1,}/;

			if (regex.test(name1)) {
				// document.getElementById("name1").value = "";
				var rp = name1.replace(regex, '');
				document.getElementById("name").value = rp;
				alert("한글만 입력가능합니다.");
			}
		}
	}
</script>
</head>

<body>
	<form action="login.jsp" method="get">
		<div class="py-5" id="AllWrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-4" id="minsu">
						<form action="Login.do" method="post">
							<label>Id</label>
							<div class="input-group">
								<input type="text" class="form-control mr-1"
									placeholder="Id"
									aria-describedby="basic-addon2" id="id"> 
								<input type="text" id="bt1" class="btn btn-primary" size="1"; value="Check">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" id="pw" name=password
									placeholder="Password">
							</div>
							<div class="form-group">
								<label>PasswordCheck</label> <input type="password" id="pwcheck"
									class="form-control" placeholder="PasswordCheck">
								<smallclass ="form-texttext-muted" id="msg2"> </small>
							</div>
							<div class="form-group">
								<label>Name</label> <input type="text" class="form-control"
									name=name id="name" placeholder="Name">
							</div>
							<input type="submit" class="btn btn-primary" value="Sign up">
						</form>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>