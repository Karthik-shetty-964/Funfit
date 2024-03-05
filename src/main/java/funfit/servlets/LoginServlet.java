package funfit.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funfit.models.Participant;
import funfit.repository.ParticipantDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		ParticipantDao pDao = new ParticipantDao();
		HttpSession session = request.getSession();

		if (email.equalsIgnoreCase("yamin@gmail.com") && pass.equals("yamin123")) {
			session.setAttribute("isAdminLoggedIn", true);
			response.sendRedirect("index.jsp");

		} else if (pDao.checkUserCredentials(email, pass) != null) {
			Participant person = pDao.checkUserCredentials(email, pass);
			session.setAttribute("isUserLoggedIn", true);
			session.setAttribute("userId", person.getpId());
			response.sendRedirect("index.jsp");

		} else {
			request.setAttribute("msg", "Invalid username or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
