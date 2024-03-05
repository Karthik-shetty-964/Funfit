<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="funfit.repository.ParticipantDao"%>
<%@ page import="funfit.repository.BatchDao"%>
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
<title>One Batch</title>
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
	if (session.getAttribute("isAdminLoggedIn") == null) {
		request.setAttribute("msg", "You need to login..");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	BatchDao bDao = new BatchDao();
	int id = Integer.parseInt(request.getParameter("bId"));
	Batch b = bDao.searchBatch(id);

	BatchParticipantsDao bpDao = new BatchParticipantsDao();
	List<Participant> allParticipantsOfBatch = bpDao.allParticipantsOfBatch(id);
	List<Participant> allParticipantsNotOfBatch = bpDao.allParticipantsNotOfBatch(id);
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="overlay"></div>

	<div class="container d-flex gap-3 mt-5">
		<div class="card col-3"
			style="height: fit-content; background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px #2aebff;">
			<div class="card-body text-center">
				<span class=" fs-3">Batch details</span>
			</div>
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
					date = dateFormat.format(timestamp);
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
					time = dateFormat.format(timestamp);
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

			<div class="btns m-2 d-flex justify-content-center gap-4">
				<a class="btn btn-info" data-bs-toggle="modal"
					data-bs-target="#editBatchModal">Edit</a> <a href="batch.jsp"
					class="btn btn-danger">Back</a>
			</div>
		</div>

		<div class="col-9 card p-0"
			style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<div class="card-header d-flex justify-content-between">
				<h3>Batch Participants</h3>
				<button class="btn btn-primary"
					data-bs-target="#unregisteredParticipants" data-bs-toggle="modal">Add
					Participant</button>
			</div>
			<div class="card-body">
				<%
				if (allParticipantsOfBatch.size() <= 0) {
				%>
				<h5 class="text-center">No participant is registered for this
					batch</h5>
				<%
				} else {
				%>
				<table class="table table-hover text-center m-0"
					style="--bs-table-bg: rgba(0, 0, 0, 0.4); --bs-table-color: white;--bs-table-hover-color:#f51e05;">
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
						<%
						for (Participant p : allParticipantsOfBatch) {
						%>
						<tr>
							<td><%=p.getpId()%></td>
							<td><%=p.getpName()%></td>
							<td><%=p.getpAge()%></td>
							<td><%=p.getpEmail()%></td>
							<td><%=p.getPassword()%></td>
							<td><a
								href="BatchParticipants?action=delete&pId=<%=p.getpId()%>&bId=<%=id%>"
								id="removeParticipant" class="btn btn-danger">Remove</a></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
				<%
				}
				%>
			</div>
		</div>

	</div>



	<!-- Modal to edit the batch content -->
	<div class="modal fade" id="editBatchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content addModal" style="background: rgba(0, 0, 0, 0.4);
    color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px #2aebff;">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Edit Batch</h1>
					<button type="button" class="btn-close bg-light"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post"
						action="BatchServlet?action=edit&batchId=<%=b.getBatchId()%>">
						<div class="mb-4">
							<label for="batchId" class="mb-1">Batch Id:</label> <input
								type="number" id="batchId" name="batchId" class="form-control"
								placeholder="Enter Batch Id" value=<%=b.getBatchId()%> disabled />
						</div>
						<div class="mb-4">
							<label for="batchName" class="mb-1">Batch Type:</label> <select
								id="batchName" name="batchName" class="form-control"
								onchange="validateForm()" required>
								<option value=<%=b.getBatchName()%> selected><%=b.getBatchName()%></option>
								<option value="Classic zumba">Classic zumba</option>
								<option value="Aqua zumba">Aqua zumba</option>
								<option value="Zumba toning">Zumba toning</option>
								<option value="Zumba step">Zumba step</option>
							</select>
						</div>
						<div class="mb-4">
							<label for="batchSchedule" class="mb-1">Batch Schedule:</label> <select
								id="batchSchedule" name="batchSchedule" class="form-control"
								onchange="validateForm()" required>
								<option value=<%=b.getBatchSchedule()%> selected><%=b.getBatchSchedule()%></option>
								<option value="morning">Morning</option>
								<option value="evening">Evening</option>
							</select>
						</div>
						<div class="mb-4">
							<%
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
							String dateTime = sdf.format(b.getDateTime());
							%>
							<label for="startDate" class="mb-1">Date & Time:</label> <input
								type="datetime-local" id="startDate" name="dateTime"
								onchange="validateForm()" value=<%=dateTime%>
								class="form-control" required />
						</div>
						<div class="mb-4">
							<label for="trainerName" class="mb-1">Trainer :</label> <select
								id="trainerName" name="trainerName" class="form-control"
								onchange="validateForm()" required>
								<option value=<%=b.getTrainerName()%> selected><%=b.getTrainerName()%></option>
								<option value="Yamin">Yamin</option>
								<option value="Rachel smith">Rachel smith</option>
								<option value="Larry underwood">Larry underwood</option>
							</select>
						</div>
						<div class="d-flex gap-3 modal-footer">
							<input type="submit" value="Edit Batch" class="btn btn-success"
								data-bs-dismiss="modal" id="editBtn" disabled /> <input
								type="button" value="Close" class="btn btn-danger"
								data-bs-dismiss="modal" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal to display all the participants who are not present in the batch -->
	<div class="modal fade" id="unregisteredParticipants" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 60%;">
			<div class="modal-content addModal" style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Unregistered
						Participants</h1>
					<button type="button" class="btn-close bg-light"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
					if (allParticipantsNotOfBatch.size() <= 0) {
					%>
					<h5 class="text-center">All the participants have been
						registered for this batch</h5>
					<%
					} else {
					%>
					<table class="table table-hover text-center m-0" style="--bs-table-bg: rgba(0, 0, 0, 0.4); --bs-table-color: white;--bs-table-hover-color:#16f2ff;">
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
							<%
							for (Participant p : allParticipantsNotOfBatch) {
							%>
							<tr>
								<td><%=p.getpId()%></td>
								<td><%=p.getpName()%></td>
								<td><%=p.getpAge()%></td>
								<td><%=p.getpEmail()%></td>
								<td><%=p.getPassword()%></td>
								<td><a
									href="BatchParticipants?action=add&pId=<%=p.getpId()%>&bId=<%=id%>"
									id="addParticipant" class="btn btn-info">Add</a>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			document.getElementById("editBtn").disabled = false;
		}
	</script>
</body>
</html>