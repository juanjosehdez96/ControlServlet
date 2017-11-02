package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;

/**
 * Servlet implementation class Servlet
 */
// @WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String base = "/jsp/";
		String url = base + "index.jsp";
		String action = request.getParameter("action");

		if (action != null) {
			switch (action) {

			case "InicioSesion":
				if (request.getParameter("enviar") != null) {
					try {
						iniciarSesion(request);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				url = base + "ejercicio2.jsp";
				break;

			case "cerrarSesion":
				cerrarSesion(request);
				url = base + "index.jsp";
				break;

			case "Ejercicios":
				if (request.getParameter("ejercicio1") != null) {
					url = base + "ejercicio1.jsp";
					break;

				} else if (request.getParameter("ejercicio2") != null) {
					url = base + "ejercicio2.jsp";
					break;
				}

				url = base + "index.jsp";
			}
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

	public boolean iniciarSesion(HttpServletRequest request) throws SQLException {

		Connection conexion = conexion("jdbc:mysql://localhost:3306/controlservlet", "root", "gugamida1");

		PreparedStatement stm = conexion.prepareStatement("SELECT * FROM usuarios where usuario=? and clave=?");

		stm.setString(1, request.getParameter("nombre"));
		stm.setString(2, request.getParameter("contrasena"));
		
		ResultSet resultado = stm.executeQuery();
		
		if (resultado.next()) {
			System.out.println("Usuario encontrado");
			HttpSession sesion = request.getSession();
			sesion.setAttribute("nombreUsuario", request.getParameter("nombre"));

			return true;

		} else {
			System.out.println("Usuario NO encontrado");
			return false;

		}

	}

	public void cerrarSesion(HttpServletRequest request) {
		HttpSession sesion = request.getSession();
		sesion.invalidate();

	}

	public Connection conexion(String URL_BD, String USUARIO, String PASS) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(URL_BD, USUARIO, PASS);
		} catch (Exception e) {
			e.printStackTrace();
			if (e instanceof ClassNotFoundException) {
				System.out.println("VERIFIQUE Si EL DRIVER DE LA BD ESTA EN  CLASSPATH");
			} else {
				System.out.println("ESTA ARRANCANDO MYSQL ?, lAS CREDENCIALES ESTÁN BIEN ?");
			}

			return null;
		}
	}

}
