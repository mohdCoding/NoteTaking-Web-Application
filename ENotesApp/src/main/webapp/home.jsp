<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.user.UserDetails" %>
<%@ include file="all_component/allcss.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<style>


.image-div {
  width:1000px;
  height:400px;
  margin:0 auto;
  
}

#note-img {
   width:90%;
   height:90%;
   margin-top:50px;
}
</style>
</head>
<body>
 <%
   UserDetails user = (UserDetails) session.getAttribute("userD");
   
   if(user == null) {
	   
	   response.sendRedirect("./login.jsp");
	   session.setAttribute("login-error", "Please Login...");
   }
 %>
 <%@ include file="all_component/navbar.jsp" %>
 
 <div class="image-div">
    <img src="img/notes3.jpg" id="note-img"/>
 </div>
 <h1 style="text-align:center; margin-top:20px; color:green;">Start Taking Your Notes</h1>
 <center><a href="./addnotes.jsp" class="btn btn-outline-primary mt-2">Start Here</a></center>
 
 <%@ include file="all_component/footer.jsp" %>
 
</body>
</html>