<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="funfit.repository.BatchDao"%>
<%@ page import="java.util.*"%>
<%@ page import="funfit.models.Batch"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Batches</title>
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
	if (session.getAttribute("isAdminLoggedIn") == null) {
		request.setAttribute("msg", "You need to login..");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	BatchDao bDao = new BatchDao();
	List<Batch> allBatches = bDao.allBatches();
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="overlay"></div>


	<div class="container row d-flex m-auto gap-4 justify-content-between">
		<!-- Modal to add clients to the db -->
		<div class="card p-2 mt-4 col-3"
			style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<div class="card-body">
				<div class="text-center fw-bolder">
					<h2>Add Batch</h2>
				</div>
				<hr />
				<form method="post" action="BatchServlet">
					<div class="mb-4">
						<label for="batchId" class="mb-1">Batch Id:</label>
						<!-- <span class="studId text-secondary">(Id is auto generated)</span></label> -->
						<input type="number" id="batchId" name="batchId"
							class="form-control" placeholder="Enter batch Id " required />
					</div>
					<div class="mb-4">
						<label for="batchName" class="mb-1">Batch Type:</label> <select
							id="batchName" name="batchName" class="form-control" required>
							<option value="" disabled selected>Choose a batch type</option>
							<option value="Classic zumba">Classic zumba</option>
							<option value="Aqua zumba">Aqua zumba</option>
							<option value="Zumba toning">Zumba toning</option>
							<option value="Zumba step">Zumba step</option>
						</select>
					</div>
					<div class="mb-4">
						<label for="batchSchedule" class="mb-1">Batch Schedule:</label> <select
							id="batchSchedule" name="batchSchedule" class="form-control"
							required>
							<option value="" disabled selected>Choose an option</option>
							<option value="morning">Morning</option>
							<option value="evening">Evening</option>
						</select>
					</div>
					<div class="mb-4">
						<label for="startDate" class="mb-1">Date & Time:</label> <input
							type="datetime-local" id="startDate" name="dateTime"
							class="form-control" required />
					</div>

					<div class="mb-4">
						<label for="trainerName" class="mb-1">Trainer :</label> <select
							id="trainerName" name="trainerName" class="form-control" required>
							<option value="" disabled selected>Choose a trainer</option>
							<option value="Yamin">Yamin</option>
							<option value="Rachel smith">Rachel smith</option>
							<option value="Larry underwood">Larry underwood</option>
						</select>
					</div>

					<div class="d-flex gap-3 modal-footer">
						<input type="submit" value="Add Batch" class="btn btn-success" />
						<input type="reset" value="Reset" class="btn btn-danger" />
					</div>
				</form>
				<span
					class="text-success d-flex justify-content-center fs-6 fw-bolder mt-2">${msg}</span>
			</div>
		</div>

		<div class="col-8 flex-fill mt-4 card p-0 clientDiv"
			style="background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1);">
			<div class="card-header fw-bolder text-center fs-4 fw-bolder">
				All Batches</div>
			<div class="card-body clientCards">
				<%
				for (Batch b : allBatches) {
				%>
				<div class="card singleCard"
					style="width: 31%; height: fit-content; background: rgba(0, 0, 0, 0.4); color: white; -webkit-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); -moz-box-shadow: 0px 0px 5px 2px rgba(104, 99, 255, 1); box-shadow: 0px 0px 5px 2px #2aebff;">
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

					<div
						class="d-flex flex-column justify-content-center align-items-center gap-4 hoverBtns">
						<a href="BatchServlet?action=view&bId=<%=b.getBatchId()%>"
							class="btn btn-info me-2" style="width: 100px;">View</a> <a
							href="BatchServlet?action=delete&bId=<%=b.getBatchId()%>"
							class="btn btn-danger text-dark" style="width: 100px;">Delete</a>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>