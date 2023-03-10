<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.user.UserDetails, com.dao.PostDAO, com.db.DBConnect
    , com.user.Posting" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
<%@ include file="all_component/allcss.jsp" %>
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
</head>
<body>

<%

  UserDetails user = (UserDetails) session.getAttribute("userD");
  if(user == null) {
	  response.sendRedirect("./login.jsp");
  } 
%>
<%@ include file="all_component/navbar.jsp" %>

<%
     Integer id = Integer.parseInt(request.getParameter("note_id"));
     
     PostDAO post = new PostDAO(DBConnect.getConn());
     Posting posting  = post.getDataById(id);
     
     String title = posting.getTitle();
     String content = posting.getContent();

     
%>

<h1 class="text-center">Edit Your Notes</h1>



<div class="container">

<div class="row">

  <div class="col-md-12">
  
    <form action="./NotesEditServlet">
    
    <input type="hidden" value="<%= id %>" name="note_id" />
    <div class="form-group">
    
      <%
         UserDetails us = (UserDetails) session.getAttribute("userD");
      if(us!=null) {
      
      %>
       <input type="hidden" value="<%= us.getId() %>"  name="uid"/>
    
    <%
      }
    %>
    
    
    		<h2 class="title-text">Enter The Title</h2>
				<input type="text" name="title" id="title" 
				value="<%=title %>"
				required /><br>
				
			<div class="notes-input">
				<h2 class="title-text">Enter Your Notes</h2>
				<textarea name="notes" id="notes" 
				required>
				<%= content %>
				</textarea>

			</div>

			<input type="submit" value="Edit Notes" id="submit" />
				
				
				
    </div>
    
    </form>
   
  </div>
</div>


</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>