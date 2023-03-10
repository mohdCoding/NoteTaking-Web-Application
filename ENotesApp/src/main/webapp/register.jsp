<%@ page%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@ include file="./all_component/allcss.jsp"%>

<style>
#custom-header {
	background: #8e24aa;
	color: white;
}

body {
	background-image: linear-gradient(to right top, #f5ecc1, #e3e895, #c1e76e, #8ce84f,
		#00e83b);
}
/**
.container-fluid {
	height: 500px;
}

.card {
	height: 450px;
}
**/
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center" id="custom-header">
						<i class="fa fa-user-plus"></i>
						<h4>Registration</h4>
					</div>



					<%
					String regMsg = (String) session.getAttribute("reg-sucess");

					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%><a href="./login.jsp">Login - Click here</a></div>
					<%
					 session.removeAttribute("reg-sucess");
					}
					%>
					
					<%
					String failedMsg = (String) session.getAttribute("failed-msg");

					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>




					<div class="card-body">
						<form method="POST" action="./UserServlet">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" name="fname" required/>
							</div>
							<div class="form-group">
								<label>Email address</label> <input type="email"
									class="form-control" name="uemail" required/>
							</div>
							<div class="form-group">

								<label>Password</label> <input type="password"
									class="form-control" name="pwd" required/>
							</div>

							<input type="submit" class="btn btn-primary badge-pill btn-block"
								value="Register">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>