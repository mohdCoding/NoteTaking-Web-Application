<%@ page%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@ include file="all_component/allcss.jsp"%>

<style>
#custom-header {
	background: #8e24aa;
	color: white;
}

body {
	background-image: linear-gradient(to right top, #d6d53c, #ddbf21, #e3a803, #e69000,
		#e87700);
}

.container-fluid {
	height: 480px;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 mt-5 offset-md-4">
				<div class="card">
					<div class="card-header text-center" id="custom-header">
						<i class="fa fa-user-plus"></i>
						<h4>Login</h4>
					</div>

					<%
					String failedMsg = (String) session.getAttribute("login-failed");

					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg %>
					 <a href="./register.jsp">--click here to register</a>
					</div>

					<%
					session.removeAttribute("login-failed");
					}
					%>

					<%
					String withoutLogin = (String) session.getAttribute("login-error");

					if (withoutLogin != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<%
					session.removeAttribute("login-error");
					}
					%>
					
					<%
					  String lgMsg = (String) session.getAttribute("logoutMsg");
					
					  if(lgMsg != null) {
					%>
					 <div class="alert alert-success" role="alert" ><%=lgMsg %></div>
					<%} 
					 session.removeAttribute("logoutMsg");
					%>
					<div class="card-body">
						<form method="POST" action="./loginServlet">
							<div class="form-group">
								<label>Email address</label> <input type="email"
									class="form-control" name="uemail" required />
							</div>
							<div class="form-group">

								<label>Password</label> <input type="password"
									class="form-control" name="pwd" required />
							</div>

							<input type="submit" class="btn btn-primary badge-pill btn-block"
								value="Login">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>