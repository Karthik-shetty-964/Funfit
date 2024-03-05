package funfit.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funfit.models.Participant;
import funfit.repository.BatchDao;
import funfit.repository.BatchParticipantsDao;
import funfit.repository.ParticipantDao;

/**
 * Servlet implementation class BatchParticipantsServlet
 */
public class BatchParticipantsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchParticipantsServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("delete".equals(action)) {
			doDelete(request, response);
		}
		
		if("add".equals(action)) {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BatchParticipantsDao dao = new BatchParticipantsDao();
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		int batchId = Integer.parseInt(request.getParameter("bId")); 

//		add Participant to a particular batch
		try {
			if (dao.addParticipantToBatch(pId, batchId)) {
				request.setAttribute("msg", "Participant added successully");
			} else {
				request.setAttribute("msg", "Failed to add new participant");
			}
			response.sendRedirect("oneBatch.jsp?bId="+batchId);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		int batchId = Integer.parseInt(request.getParameter("bId"));
		
		BatchParticipantsDao dao = new BatchParticipantsDao();
		if (dao.removeParticipantFromBatch(pId, batchId)) {
			request.setAttribute("msg", "Participant removed from the batch");
		} else {
			request.setAttribute("msg", "Failed to remove participant");
		}
		response.sendRedirect("oneBatch.jsp?bId="+batchId);
	}

}
