


<!DOCTYPE html>
<html lang="en">
<head>
<style>
.contents {
	margin-left: 100px;
}

#title {
	width: 94%;
	font-size: 23px;
	color: white;
	padding: 5px;
	background-color: black;
	font-weight: bold;
	border: 3px solid green;
}

#notes {
	width: 94%;
	height: 300px;
	font-size: 22px;
	color: white;
	background-color: black;
	border: 3px green solid;
	border-radius: 5px;
	padding: 3px;
	font-style: italic;
}

#submit {
	width: 94%;
	font-size: 22px;
	color: white;
	background-color: rgb(255, 0, 60);
	padding: 5px;
	border-radius: 5px;
	margin-top: 10px;
	border: 4px solid white;
}

#submit:hover {
	background-color: rgb(32, 201, 201);
	color: white;
}

.title-text {
	margin-top: 20px;
	color: grey;
	font-size: 18px;
}
</style>
<title>Add Notes</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: white;">
	<%@ include file="all_component/navbar.jsp"%>

	<%
	UserDetails user1 = (UserDetails) session.getAttribute("userD");
	%>
	<form method="POST" action="./AddNotesServlet">
		<div class="contents">

			<div class="title-input">

              
				<%
				UserDetails us = (UserDetails) session.getAttribute("userD");
				if (us == null) {
					session.setAttribute("login-error", "Please Login...");
					response.sendRedirect("./login.jsp");

				} else {
				%>

				<input type="hidden" name="uid" value="<%=us.getId()%>" />
				<h2 class="title-text">Enter The Title</h2>
				<input type="text" name="title" id="title" required />
			</div>

			<div class="notes-input">
				<h2 class="title-text">Enter Your Notes</h2>
				<textarea name="notes" id="notes" required></textarea>

			</div>

			<input type="submit" value="Add Notes" id="submit" />
		</div>
		<%
		}
		%>
	</form>
	
	
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>