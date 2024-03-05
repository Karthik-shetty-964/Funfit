package funfit.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funfit.models.Batch;
import funfit.repository.BatchDao;

/**
 * Servlet implementation class BatchServlet
 */
public class BatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BatchServlet() {
		super();
	}

//  doGet method to view the batch details
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			doDelete(request, response);
		}
		
		String bId = request.getParameter("bId");
		if ("view".equals(action)) {
			response.sendRedirect("oneBatch.jsp?bId=" + bId);
		}
	}

//	doPost method to add new batch
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Batch batch = new Batch();
		BatchDao dao = new BatchDao();
		RequestDispatcher dispatcher = null;

		batch.setBatchId(Integer.parseInt(request.getParameter("batchId")));
		batch.setBatchName(request.getParameter("batchName"));
		batch.setBatchSchedule(request.getParameter("batchSchedule"));

		String dateTimeString = request.getParameter("dateTime");
		Timestamp timestamp = null;
		if (dateTimeString != null && !dateTimeString.isEmpty()) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
				java.util.Date utilDate = sdf.parse(dateTimeString);
				timestamp = new Timestamp(utilDate.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		batch.setDateTime(timestamp);
		batch.setTrainerName(request.getParameter("trainerName"));

////	update batch
		String action = request.getParameter("action");
		if ("edit".equals(action)) {
			doPut(request, response, batch);
		}

//		add batch
		try {
			if (dao.addBatch(batch)) {
				request.setAttribute("msg", "Batch inserted successully");
			} else {
				request.setAttribute("msg", "Failed to insert new batch");
			}
			dispatcher = request.getRequestDispatcher("batch.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

//	doPut method to update a batch
	protected void doPut(HttpServletRequest request, HttpServletResponse response, Batch batch) throws IOException {
		BatchDao dao = new BatchDao();
		try {
			if (dao.deleteBatch(batch.getBatchId())) {
				if(dao.addBatch(batch)) {					
					response.sendRedirect("oneBatch.jsp?bId=" + batch.getBatchId());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
//	doDelete method to delete a batch
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		String bId = request.getParameter("bId");
		
		BatchDao dao = new BatchDao();
		if (dao.deleteBatch(Integer.parseInt(bId))) {
			request.setAttribute("msg", "Batch deleted successully");
		} else {
			request.setAttribute("msg", "Batch failed to delete");
		}

		dispatcher = request.getRequestDispatcher("batch.jsp");
		dispatcher.forward(request, response);
	}
}
