<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	<style>
	
		.outer-card {
			max-width : 800px;
			-webkit-box-shadow: 4px 4px 8px -3px rgba(0,0,0,1);
			-moz-box-shadow: 4px 4px 8px -3px rgba(0,0,0,1);
			box-shadow: 4px 4px 8px -3px rgba(0,0,0,1);
		}
	</style>
</head>
<body class="bg-dark d-flex justify-content-center mt-5">
	<%session = request.getSession(false); 
        
        // Invalidate the session if it exists
        if (session != null) {
            session.invalidate();
    }%>
	<div class="card mb-3 outer-card" style="--bs-card-border-color:none;">
		<div class="row g-0">
			<div class="col-md-4">
				<img src="./images/login.png" class="img-fluid rounded-start"
					alt="login">
			</div>
			<div class="col-md-8 bg-dark">
				<div class="card-body ">
					<div class="card p-2 bg-dark text-light" style="--bs-card-border-color:none;  ">
						<div class="card-body ">
							<div class="text-center fw-bolder">
								<h2>Login</h2>
							</div>
							<hr />
							<form method="post" action="login">
									<div class="mb-5 mt-3">
										<label for="userEmail" class="mb-1">Email:</label> <input
											type="email" id="userEmail" name="email" class="form-control"
											placeholder="Enter your email"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required />
									</div>
									<div class="mb-5 mt-3">
										<label for="password" class="mb-1">Password:</label> <input
											type="password" id="password" name="password"
											class="form-control" placeholder="Enter your password"
											required />
									</div>
								
								<span class="text-danger">${msg}</span>
								<hr />
								<div class="d-flex gap-3 ">
									<input type="submit" value="Login" class="btn btn-success" /> <input
										type="reset" value="Reset" class="btn btn-danger" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>