package funfit.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funfit.models.Participant;
import funfit.repository.ParticipantDao;

/**
 * Servlet implementation class ParticipantServlet
 */
public class ParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParticipantServlet() {
		super();
	}

//	doGet method to get particular participant data
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// delete a participant
		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			doDelete(request, response);
		}

		// view a participant
		String pId = request.getParameter("id");
		if ("view".equals(action)) {
			response.sendRedirect("oneParticipant.jsp?pId=" + pId);
		}

	}

//	doPost method to add new participant
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		update participant
		String action = request.getParameter("action");
		if ("edit".equals(action)) {
			doPut(request, response);
		}

		Participant person = new Participant();
		ParticipantDao dao = new ParticipantDao();
		RequestDispatcher dispatcher = null;

		person.setpId(Integer.parseInt(request.getParameter("pId")));
		person.setpName(request.getParameter("pName"));
		person.setpAge(Integer.parseInt(request.getParameter("pAge")));
		person.setpEmail(request.getParameter("pEmail"));
		person.setPassword(request.getParameter("password"));

//		add Participant
		try {
			if (dao.addParticipant(person)) {
				request.setAttribute("msg", "Record inserted successully");
			} else {
				request.setAttribute("msg", "Failed to insert new record");
			}
			dispatcher = request.getRequestDispatcher("participant.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

//	doPut method to update a participant
	protected void doPut(HttpServletRequest request, HttpServletResponse response) {
		Participant person = new Participant();
		ParticipantDao dao = new ParticipantDao();

		person.setpId(Integer.parseInt(request.getParameter("pId")));
		person.setpName(request.getParameter("pName"));
		person.setpAge(Integer.parseInt(request.getParameter("pAge")));
		person.setpEmail(request.getParameter("pEmail"));
		person.setPassword(request.getParameter("password"));

		try {
			if (dao.deleteParticipant(person.getpId())) {
				if (dao.addParticipant(person)) {
					response.sendRedirect("oneParticipant.jsp?pId=" + person.getpId());
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

//	doDelete Method to delete a participant
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = null;

		String pId = request.getParameter("id");
		ParticipantDao dao = new ParticipantDao();

		if (dao.deleteParticipant(Integer.parseInt(pId))) {
			request.setAttribute("msg", "Record deleted successully");
		} else {
			request.setAttribute("msg", "Record failed to delete");
		}

		dispatcher = request.getRequestDispatcher("participant.jsp");
		dispatcher.forward(request, response);
	}

}
