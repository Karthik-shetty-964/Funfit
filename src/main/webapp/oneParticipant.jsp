<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="funfit.repository.ParticipantDao"%>
<%@ page import="funfit.repository.BatchParticipantsDao"%>
<%@ page import="java.util.*"%>
<%@ page import="funfit.models.Participant"%>
<%@ page import="funfit.models.Batch"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One Participant</title>
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
<link rel="stylesheet" href="./styles/batch.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	min-height: 95vh;
	background: url("./images/hero.jpg") center/cover no-repeat;
	position: relative;
	z-index: -2;
}

.overlay {
	height: 91.7vh;
	width: 100%;
	position: absolute;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("isAdminLoggedIn") == null && session.getAttribute("isUserLoggedIn") == null) {
		request.setAttribute("msg", "You need to login..");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	ParticipantDao pDao = new ParticipantDao();
	int id = Integer.parseInt(request.getParameter("pId"));
	Participant p = pDao.searchParticipant(id);

	BatchParticipantsDao bpDao = new BatchParticipantsDao();
	List<Batch> allBatchesOfParticipant = bpDao.allBatchesOfParticipant(id);
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="overlay"></div>

	<div class="container d-flex gap-3 mt-5">
		<div class="card col-3" style="height: fit-content; background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<div
				class="card-body d-flex gap-2 justify-content-between align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					class="bi bi-person-circle" style="fill: gray" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                        <path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                      </svg>
				<span class=" fs-3"><%=p.getpName()%></span>
			</div>
			<hr class="p-0 mx-2 my-0" />
			<div
				class="d-flex justify-content-between mx-3 align-items-end py-2 text-left">
				<p class="text-secondary m-0">Id</p>
				<p class="m-0"><%=p.getpId()%></p>
			</div>
			<hr class="p-0 mx-2 my-0" />
			<div
				class="d-flex justify-content-between mx-3 align-items-center py-2">
				<p class=" text-secondary m-0">Name</p>
				<p class="m-0"><%=p.getpName()%></p>
			</div>
			<hr class="p-0 mx-2 my-0" />
			<div
				class="d-flex justify-content-between mx-3 align-items-center py-2">
				<p class=" text-secondary text-left m-0">Age</p>
				<p class="m-0"><%=p.getpAge()%></p>
			</div>
			<hr class="p-0 mx-2 my-0" />
			<div
				class="d-flex justify-content-between mx-3 align-items-center py-2">
				<p class=" text-secondary  m-0">Email</p>
				<p class="m-0"><%=p.getpEmail()%></p>
			</div>

			<div class="btns m-2 d-flex justify-content-center gap-4">
				<a class="btn btn-info" data-bs-toggle="modal"
					data-bs-target="#editParticipantModal">Edit</a> 
					<% if(session.getAttribute("isAdminLoggedIn") != null) { %>
						<a
						href="participant.jsp" class="btn btn-danger">Back</a>
					<%}else if(session.getAttribute("isUserLoggedIn") != null){ %>
						<a
						href="index.jsp" class="btn btn-danger">Back</a>
					<%} %>
			</div>
		</div>

		<div class="col-9 card p-0" style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<div
				class="card-header fw-bolder text-center fs-4 fw-bolder">
				Participant Batches</div>
			<div class="card-body clientCards">
				<%
				if (allBatchesOfParticipant.size() <= 0) {
				%>
				<h5 class="m-auto">This participant is not a part of any
					batch yet</h5>
				<%
				} else {
				%>
				<%
				for (Batch b : allBatchesOfParticipant) {
				%>
				<div class="card singleCard"
					style="width: 31%; height: fit-content;cursor:pointer; background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px #2aebff;<%if(session.getAttribute("isUserLoggedIn") != null){ %>pointer-events:none;<%} %>" onclick="redirectTo(<%=b.getBatchId()%>)">
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-end py-2 text-left">
						<p class="text-secondary m-0">Batch Id</p>
						<p class="m-0"><%=b.getBatchId()%></p>
					</div>
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-center py-2">
						<p class=" text-secondary m-0">Batch Type</p>
						<p class="m-0"><%=b.getBatchName()%></p>
					</div>
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-center py-2">
						<p class=" text-secondary text-left m-0">Batch Schedule</p>
						<p class="m-0"><%=b.getBatchSchedule()%></p>
					</div>
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-center py-2">
						<p class=" text-secondary  m-0">Date</p>
						<%
						Timestamp timestamp = b.getDateTime();
						String date = "";
						if (timestamp != null) {
							SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
							date = dateFormat.format(b.getDateTime());
						}
						%>
						<p class="m-0"><%=date%></p>
					</div>
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-center py-2">
						<p class=" text-secondary  m-0">Time</p>
						<%
						timestamp = b.getDateTime();
						String time = "";
						if (timestamp != null) {
							SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
							time = dateFormat.format(b.getDateTime());
						}
						%>
						<p class="m-0"><%=time%></p>
					</div>
					<hr class="p-0 mx-2 my-0" />
					<div
						class="d-flex justify-content-between mx-3 align-items-center py-2">
						<p class=" text-secondary  m-0">Trainer</p>
						<p class="m-0"><%=b.getTrainerName()%></p>
					</div>
				</div>
				<%
				}
				%>
				<%
				}
				%>
			</div>
		</div>

	</div>



	<!-- Modal to edit the participant content -->
	<div class="modal fade" id="editParticipantModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content addModal" style="background: rgba(0, 0, 0, 0.4);
    color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
						Participant</h1>
					<button type="button" class="btn-close bg-light"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post"
						action="ParticipantServlet?action=edit&pId=<%=p.getpId()%>">
						<div class="mb-4">
							<label for="pId" class="mb-1">Participant Id:</label> <input
								type="number" id="pId" name="pId" class="form-control"
								placeholder="Enter Participant Id" oninput="validateForm()"
								value=<%=p.getpId()%> disabled />
						</div>
						<div class="mb-4">
							<label for="pName" class="mb-1">Participant Name:</label> <input
								type="text" id="pName" name="pName" class="form-control"
								placeholder="Enter Participant Name" oninput="validateForm()"
								value=<%=p.getpName()%> required />
						</div>
						<div class="mb-4">
							<label for="pAge" class="mb-1">Participant Age:</label> <input
								type="number" id="pAge" name="pAge" class="form-control"
								placeholder="Enter Participant Age" value=<%=p.getpAge()%>
								oninput="validateForm()" required />
						</div>
						<span class="text-danger" id="errMess"></span>
						<div class="mb-4">
							<label for="pEmail" class="mb-1">Participant Email:</label> <input
								type="email" id="pEmail" name="pEmail" class="form-control"
								placeholder="Enter Participant Email" value=<%=p.getpEmail()%>
								oninput="validateForm()"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required />
						</div>
						<div class="mb-4">
							<label for="pName" class="mb-1">Participant Password:</label> <input
								type="password" id="password" name="password"
								class="form-control" value=<%=p.getPassword()%>
								placeholder="Enter Participant Password"
								oninput="validateForm()" required />
						</div>
						<div class="d-flex gap-3 modal-footer">
							<input type="submit" value="Edit Participant"
								class="btn btn-success" data-bs-dismiss="modal" id="submitBtn"
								disabled /> <input type="button" value="Close"
								class="btn btn-danger" data-bs-dismiss="modal" />
						</div>
					</form>
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

			if (parseInt(age) < 1 || parseInt(age) > 100) {
				document.getElementById("errMess").innerText = "Please enter a valid age";
			} else {
				document.getElementById("errMess").innerText = "";

				if (id.trim() === '' || name.trim() === '' || age.trim() === ''
						|| email.trim() === '' || pass.trim() === '') {
					document.getElementById("submitBtn").disabled = true;
				} else {
					document.getElementById("submitBtn").disabled = false;
				}
			}
		}
		
		function redirectTo(bId) {
			window.location.href = "oneBatch.jsp?bId="+bId;
		}
	</script>
</body>
</html>