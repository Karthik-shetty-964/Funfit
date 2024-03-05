<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="funfit.repository.ParticipantDao"%>
<%@ page import="java.util.*"%>
<%@ page import="funfit.models.Participant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Participants</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {
			min-height : 95vh;
			background : url("./images/hero.jpg")center/cover no-repeat;
			position:relative;
			z-index : -2;
		}
		.overlay {
			height:91.7vh;
			width:100%;
			position:absolute;
			background : rgba(0,0,0,0.8);
			z-index : -1	;
		}
	</style>
</head>
<body >
	<%	
	if (session.getAttribute("isAdminLoggedIn") == null) {
		request.setAttribute("msg", "You need to login..");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	ParticipantDao pDao = new ParticipantDao();
	List<Participant> allParticipants = pDao.allParticipants();
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="overlay"></div>
	<div class="container mt-3 main">
		<div class="card" style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<!-- Button trigger modal -->
			<div
				class="btns d-flex justify-content-between align-items-center me-5 py-2">
					<button type="button" class="btn btn-primary m-2 py-2 "
						data-bs-toggle="modal" data-bs-target="#addParticipantModal">
						Add Participant</button>
					<h2 class="me-5">All Participants</h2>
				<span class="text-success fs-5 fw-bolder text-center">${msg}</span>
			</div>	
			<hr class="m-0" />
			<div class="card-body p-0">
				<table class="table table-hover text-center m-0 tb" style="--bs-table-bg: rgba(0, 0, 0, 0.4); --bs-table-color: white;--bs-table-hover-color:#13fff4;">
					<thead class="p-4">
						<tr>
							<th>Participant Id</th>
							<th>Participant Name</th>
							<th>Age</th>
							<th>Participant Email</th>
							<th>Password</th>
							<th>Operations</th>
						</tr>
					</thead>
					<tbody>
						<%for(Participant p : allParticipants){ %>
							<tr >
								<td><%=p.getpId()%></td>
								<td><%=p.getpName()%></td>
								<td><%=p.getpAge()%></td>
								<td><%=p.getpEmail()%></td>
								<td><%=p.getPassword()%></td>
								<td>
									<a href="ParticipantServlet?action=view&id=<%=p.getpId() %>"   id="viewParticipant" class="btn btn-info" >View</a>							
									<a href="ParticipantServlet?action=delete&id=<%= p.getpId() %>"   id="deleteParticipant" class="btn btn-danger">Delete</a>
								</td>
							</tr>
						<%}%>
					</tbody>
				</table>



				<!-- Modal to add the user content -->
				<div class="modal fade" id="addParticipantModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content addModal" style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Add
									Participant</h1>
								<button type="button" class="btn-close bg-light"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form method="post" action="ParticipantServlet">
									<div class="mb-4">
										<label for="pId" class="mb-1">Participant Id:</label> <input
											type="number" id="pId"
											name="pId" class="form-control"
											placeholder="Enter Participant Id" oninput="validateForm()" required />
									</div>
									<div class="mb-4">
										<label for="pName" class="mb-1">Participant Name:</label> <input
											type="text" id="pName"
											name="pName" class="form-control"
											placeholder="Enter Participant Name" oninput="validateForm()" required />
									</div>
									<div class="mb-4">
										<label for="pAge" class="mb-1">Participant Age:</label> <input
											type="number" id="pAge"
											name="pAge" class="form-control"
											placeholder="Enter Participant Age" oninput="validateForm()" required />
									</div>
									<span class="text-danger" id="errMess"></span>
									<div class="mb-4">
										<label for="pEmail" class="mb-1">Participant Email:</label> <input
											type="email" id="pEmail"
											name="pEmail" class="form-control"
											placeholder="Enter Participant Email" oninput="validateForm()" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required />
									</div>
									<div class="mb-4">
										<label for="pName" class="mb-1">Participant Password:</label> <input
											type="password" id="password"
											name="password" class="form-control"
											placeholder="Enter Participant Password" oninput="validateForm()" required />
									</div>
									<div class="d-flex gap-3 modal-footer">
										<input type="submit" value="Add Participant"
											class="btn btn-success"
											data-bs-dismiss="modal" id="submitBtn" disabled/> <input type="button"
											value="Close" class="btn btn-danger" data-bs-dismiss="modal" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var id = document.getElementById("pId").value;
	        var name = document.getElementById("pName").value;
	        var age = document.getElementById("pAge").value;
	        var email = document.getElementById("pEmail").value;
	        var pass = document.getElementById("password").value;
			
	        if(parseInt(age ) < 1 || parseInt(age ) > 100) {
	        	document.getElementById("errMess").innerText = "Please enter a valid age";
	        } else {
	        	document.getElementById("errMess").innerText = "";
	        	
	        	if (id.trim()=== '' ||  name.trim() === '' || age.trim() === '' || email.trim() === '' || pass.trim() === '') {
		            document.getElementById("submitBtn").disabled = true;
		        } else {
		            document.getElementById("submitBtn").disabled = false;
		        }
	        }       
	    }
		
	</script>
</body>
</html>