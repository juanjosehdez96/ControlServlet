<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ejercicio2</title>

<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">



</head>
<body>
	<%
		HttpSession sesion = request.getSession();
		String nombreUsuario = (String) sesion.getAttribute("nombreUsuario");

		if (nombreUsuario != null) {
	%>
	<h1 style="margin-top: 7%;">Sesión Iniciada con exito</h1>
	<h2 style="text-align: center">Bienvenido:	<%=nombreUsuario.toUpperCase()%></h2>
	
	<form action="Hola?action=cerrarSesion" method="post">
		<button class="button button-block" name="cerrarSesion" style="width: 30%; margin: auto; margin-top: 5%;"> Cerrar
			Sesión</button>
	</form>
	
	<%
		} else {
	%>
	
	<div class="form">

		<ul class="tab-group">
			<li class="tab active"><a href="#login"
				style="margin-left: 24%;">Iniciar Sesión</a></li>
		</ul>

		<div class="tab-content">

			<div id="login">
				<h1>Bienvenido/a!</h1>

				<form action="Hola?action=InicioSesion" method="post">

					<div class="field-wrap">
						<label> Nombre Usuario<span class="req">*</span>
						</label> <input type="text" name="nombre" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Contraseña<span class="req">*</span>
						</label> <input type="password" name="contrasena" required
							autocomplete="off" />
					</div>

					<p class="forgot">
						<a href="#">¿Olvidaste tu contraseña?</a>
					</p>

					<button class="button button-block" name="enviar">Iniciar
						Sesión</button>

				</form>

			</div>

		</div>
		<!-- tab-content -->

	</div>
	<%
		}
	%>
	<!-- /form -->
	<script src="js/index.js"></script>



</body>
</html>
