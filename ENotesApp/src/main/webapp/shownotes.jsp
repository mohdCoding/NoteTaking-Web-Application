<%@ include file="all_component/imports.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>

	<%
	UserDetails user = (UserDetails) session.getAttribute("userD");
	System.out.println(user);

	if (user == null) {
		session.setAttribute("login-error", "Please Login...");
		response.sendRedirect("./login.jsp");
	} else {
	%>


	<%@ include file="all_component/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("updateMSg");

	if (updateMsg != null) {
	%>

	<div class="alert alert-success" role="alert"><%=updateMsg%></div>

	<%
	session.removeAttribute("updateMSg");
	}
	%>

	<%
	String deleteMsg = (String) session.getAttribute("deleteMsg");

	if (deleteMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deleteMsg%>
	</div>
	<%
	session.removeAttribute("deleteMsg");
	}
	%>
	<div class="container">

		<h2>All Notes</h2>


		<div class="row">
			<div class="col-md-12">

				<%
				if (user != null) {
					PostDAO dao = new PostDAO(DBConnect.getConn());
					ArrayList<Posting> posts = dao.getData(user.getId());
					
					for (Posting post : posts) {
				%>
				<div class="card mt-3">

					<img src="img/notes2.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;" />



					<div class="card-body p-4">




						<h5 class="card-title"><%=post.getTitle()%></h5>
						<p><%=post.getContent()%></p>


						<p>

							<%
							java.util.Date date = post.getPdate();

							java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy-hh:mm:ss");
							String strDate = sdf.format(date);
							%>
							<b class="text-success">Published by: <%=user.getName()%></b> <br>
							<b class="text-primary">Published Date: <%=strDate%>
							</b>
						</p>



						<div class="container text-center mt-2">
							<a href="./DeleteServlet?note_id=<%=post.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=post.getId()%>"
								class="btn btn-primary">Edit</a>
						</div>

					</div>


				</div>
				<%
				}
				}
				}
				%>



			</div>

		</div>
	</div>
</body>
</html>