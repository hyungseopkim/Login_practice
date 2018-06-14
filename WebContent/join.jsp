<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<style>
	#container{
		width : 60%;
		margin : auto;
	}
	
</style>
<script>
        window.onload = function() {
            document.getElementById("bt1").onclick = function() {
            	if(document.getElementById("id").value == ""){
            		alert("아이디를 입력해주세요.");
            	}
            	else{
                	window.open("idCheck.jsp?id="+document.getElementById("id").value, "_blank","width=300px,height=200px");
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
<form action="SignUp.do" method="get">
		<div id="container">
			<div class="form-row col-md-12">
					<div class="form-row col-md-6">
						<input type="text" class="form-control" id="id" name=id placeholder="ID">
					</div>
					<div class="form-row col-md-3 ml-3">
						<input type="button" id="bt1" class="btn btn-primary" value="IdCheck">
					</div>
			</div>
			<div class="form-row col-md-6">
				<input type="password" class="form-control" id="pw" name=password maxlength="10" placeholder="Password">
				<input type="password" class="form-control" id="pwcheck" maxlength="10" placeholder="PasswordCheck">
				<h7 id="msg2"></h7>
			</div>
			<div class="form-row col-md-4">
					<input type="text" class="form-control" id="name" name=name placeholder="Name">
			</div>
			
			<div class="form-row col-md-4">
					<button type="submit" class="btn btn-primary">Sign in</button>
			</div>
		</div>
	</form>
</body>
</html>