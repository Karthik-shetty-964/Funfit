<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Funfit - Where Fitness Meets Fun!</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="bg-dark text-light">
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Hero section -->
	<section class="hero">
		<div class="inner-hero-one"></div>
		<div
			class="text-light inner-hero-two d-flex flex-column justify-content-center align-items-center gap-2 text-center">
			<span class="fs-3">WELCOME TO</span>
			<h1>Funfit - Where fitness meets fun!</h1>
			<p>
				We are your ultimate destination for anything Zumba, regardless of
				which specific<br /> activity or a class is your favorite!
			</p>
			<div class="hero-btns gap-4 d-flex mt-5">
				<a href="#services" class="btn btn-outline-info btn-lg">Our
					Services</a> <a href="#trainers" class="btn btn-secondary btn-lg">Our
					Trainers</a>
			</div>
		</div>
	</section>

	<!-- services section -->
	<section id="services"
		class="services bg-light text-dark d-flex flex-column justify-content-center align-items-center">
		<h2 class="m-5">OUR SERVICES</h2>
		<div
			class="service-cards  mb-5 container d-flex gap-3 justify-content-center align-items-center">
			<div class="service-card">
				<img src="./images/service-1.jpg" alt="serive 1" />
				<div class="service-details text-center">
					<p class="service-name ">classic zumba</p>
					<p class="service-text">Dive into the rhythm of Latin beats with Classic Zumba! This high-energy dance workout combines Latin and international music with easy-to-follow dance moves, making fitness feel like a fiesta.</p>
				</div>			
			</div>
			<div class="service-card">
				<img src="./images/service-2.jpg" alt="serive 1" />
				<div class="service-details text-center">
					<p class="service-name text-center">aqua zumba</p>
					<p class="service-text">Make a splash with Aqua Zumba! Dive into the pool and groove to the beat while enjoying the low-impact, high-energy workout.</p>
				</div>
			</div>
			<div class="service-card">
				<img src="./images/service-3.jpg" alt="serive 1" />
				<div class="service-details text-center">
					<p class="service-name text-center">zumba toning</p>
					<p class="service-text">Sculpt and tone your body with Zumba Toning! This dynamic workout combines the fun of Zumba with targeted body-sculpting exercises using lightweight toning sticks.</p>
				</div>
			</div>
			<div class="service-card">
				<img src="./images/service-4.jpg" alt="serive 1" />
				<div class="service-details text-center">
					<p class="service-name text-center">zumba step</p>
					<p class="service-text">Take your Zumba workout to new heights with Zumba Step! This high-intensity cardio workout combines Zumba dance moves with step aerobics to boost calorie burn and tone muscles.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- trainers section -->
	<section id="trainers" class="container text-center">
		<h2 class="m-5">OUR TRAINERS</h2>
		<div id="carouselExampleIndicators" class="carousel slide mb-5">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="card mb-3 bg-dark text-light"
						style="width: 100%; --bs-card-border-color: none;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="./images/trainer-1.jpg"
									class="img-fluid rounded-start" alt="trainer 1">
							</div>
							<div class="col-md-8">
								<div class="card-body text-start d-flex flex-column gap-4">
									<h1 class="card-title text-info">Yamin</h1>
									<p class="card-text">A Juneau, Alaska native, Mr. Yamin has
										come a long way since his high school graduation all the way
										up to getting a Brown University Master's degree in gymnastics
										and specialization in zumba.</p>
									<div class="card-text">
										<h4 class="text-info">Experience</h4>
										<ul class="d-flex flex-column gap-2">
											<li>6 Years of experience as a Group Training Coach</li>
											<li>Zumba Step Certified Instructor</li>
											<li>Zumba Toning Certified Instructor</li>
											<li>Zumba for Kids Certified Instructor</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="card mb-3 bg-dark text-light"
						style="width: 100%; --bs-card-border-color: none;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="./images/trainer-2.jpg"
									class="img-fluid rounded-start" alt="trainer-2">
							</div>
							<div class="col-md-8">
								<div class="card-body text-start d-flex flex-column gap-4">
									<h1 class="card-title text-info">Rachel smith</h1>
									<p class="card-text">Born in New York City, Elisa always
										felt a strong urge for being an ambitious overachiever.
										Eventually, by the age of 25 she already had received her
										first Wall Street.</p>
									<div class="card-text">
										<h4 class="text-info">Experience</h4>
										<ul class="d-flex flex-column gap-2">
											<li>13 Years of experience as a Personal Trainer and
												Group Training Coach</li>
											<li>Classic Zumba Certified Instructor</li>
											<li>Zumba Sentao Certified Instructor</li>
											<li>Aqua Zumba Certified Instructor</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="card mb-3 bg-dark text-light"
						style="width: 100%; --bs-card-border-color: none;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="./images/trainer-3.jpg"
									class="img-fluid rounded-start" alt="trainer 3">
							</div>
							<div class="col-md-8">
								<div class="card-body text-start d-flex flex-column gap-4">
									<h1 class="card-title text-info">Larry Underwood</h1>
									<p class="card-text">Born in India, Larry always felt a
										strong urge for being a body builder. Eventually, by the age
										of 25 he already had received his olympiad title.</p>
									<div class="card-text">
										<h4 class="text-info">Experience</h4>
										<ul class="d-flex flex-column gap-2">
											<li>5 Years of experience as a strength training coach</li>
											<li>Gymnastics Certified Coach</li>
											<li>Strength training expert</li>
											<li>Personal body building trainer</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>