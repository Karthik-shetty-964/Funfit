<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./styles/index.css" />
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-dark bg-body-tertiary p-3"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href=""> <img src="./images/logo.png"
				alt="Bootstrap" height="40">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5 gap-4 fs-5">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="index.jsp">Home</a></li>
					<%
					if (session.getAttribute("isUserLoggedIn") == null || (boolean)session.getAttribute("isUserLoggedIn") == false) {
						
					%>
					<li class="nav-item"><a class="nav-link"
						href="participant.jsp">Participants</a></li>
					<li class="nav-item"><a class="nav-link" href="batch.jsp">Batches</a>
					</li>
					<%}else if(session.getAttribute("isUserLoggedIn") != null){
						int userId = (int)session.getAttribute("userId");
					%>
					<li class="nav-item"><a class="nav-link" href="oneParticipant.jsp?pId=<%=userId%>">Profile</a>
					</li>
					<%} %>
					<!-- <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Dropdown
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Action</a></li>q
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li> -->
				</ul>
				<%
				boolean isLoggedIn = false;
				if (session.getAttribute("isAdminLoggedIn") != null && (boolean) session.getAttribute("isAdminLoggedIn") == true || session.getAttribute("isUserLoggedIn") != null && (boolean) session.getAttribute("isUserLoggedIn") == true) {
					isLoggedIn = true;
				}
				if (isLoggedIn == false) {
				%>
				<a href="login.jsp" class="btn btn-info">Login</a>
				<%
				} else {
				%>
				<a href="login.jsp" class="btn btn-danger">Logout</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>
</body>
</html>