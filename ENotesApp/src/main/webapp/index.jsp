<%@ page import="java.sql.*,com.db.DBConnect"%>
<html>
<head>
<%@ include file="all_component/allcss.jsp"%>
<link rel="stylesheet" href="css/style.css"></link>
<meta charset="UTF-8">
<title>User Page</title>
<style>
#home-img {
	width: 100%;
	height: 660px;
	margin-top: -30px;
}

.heading {
	margin-top: 30px;
	margin-left: -80px;
}

.login {
	margin-left: 450px;
	margin-top: 20px;
	width: 100px;
}

.register {
	margin-left: 20px;
	margin-top: 20px;
	width: 100px;
}
</style>
</head>
<body>

	<%@ include file="all_component/navbar.jsp"%>

	

	<div style="background: url('img/home2.jpg')" id="home-img">
		<h1 class="heading text-center text-white">E Notes-Save Your
			Notes</h1>
		<a href="./login.jsp" class="btn btn-light login"><i
			class="fa fa-user-circle-o"></i> Login</a> <a href="./register.jsp"
			class="btn btn-light register"><i class="fa fa-user-plus"></i>
			Register</a>
	</div>




	<%@ include file="all_component/footer.jsp"%>

</body>
</html>