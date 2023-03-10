<%@ include file="allcss.jsp"%>
<%@ page import='com.user.UserDetails'%>
<html>
<head>

</head>

<body>


	<nav
		class="navbar navbar-expand-lg navbar-dark  bg-custom navbar-custom">
		<a class="navbar-brand" href="#"><i class="fa fa-book"></i> ENotes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-custom-link"
					href="./home.jsp"><i class="fa fa-home"></i> Home</a></li>
				<li class="nav-item active"><a class="nav-custom-link" href="./addnotes.jsp"><i
						class="fa fa-plus-circle"></i> Add Notes</a></li>

				<li class="nav-item active"><a class="nav-custom-link" href="./shownotes.jsp"><i
						class="fa fa-address-book-o"></i> Show Notes</a></li>
			</ul>

			<%!private UserDetails user = null;%>
			<% 
    
       user =(UserDetails) session.getAttribute("userD");
       
    if(user != null) { 
    %>
			<a class="btn btn-light my-2 my-sm-0 mr-3" data-toggle="modal"
				data-target="#exampleModal" type="submit" href=""><i
				class="fa fa-user-circle-o"></i><%= user.getName() %></a> <a
				class="btn btn-light my-2 my-sm-0 mr-2" type="submit" href="./LogoutServlet"><i
				class="fa fa-user-plus"></i> Logout</a>

			<%
    
    } else {
    %>

			<a class="btn btn-light my-2 my-sm-0 mr-3" type="submit"
				href="./login.jsp"><i class="fa fa-user-circle-o"></i> Login</a> <a
				class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
				href="./register.jsp"><i class="fa fa-user-plus"></i> Register</a>
	<% }%>






		</div>



		<!-- Button trigger modal -->


		<!-- Modal -->
		<%if(user != null) { %>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>


					<div class="modal-body">

		
						<div class="container text-center">
							<i class="fa fa-user fa-3x"></i>
							<h5></h5>
                
							<table class="table">
								<tbody>
								 <tr>
										<th>Id</th>
										<td>
											<%=user.getId() %>
										</td>
									</tr>
									<tr>
										<th>Full Name</th>
										<td>
											<%=user.getName() %>
										</td>
									</tr>

									<tr>
										<th>Email Id</th>
										<td><%=user.getEmail() %></td>
									</tr>
								</tbody>
							</table>

							<div>

								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		<%} %>
	</nav>
</body>
</html>
