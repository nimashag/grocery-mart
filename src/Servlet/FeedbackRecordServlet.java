package Servlet;
import dao.FeedbackRecordDao;
import model.FeedbackRecord;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;


@WebServlet("/feedback/*")
public class FeedbackRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FeedbackRecordDao feedbackRecordDao;
	
	public void init() {
		feedbackRecordDao = new FeedbackRecordDao();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		System.out.println("************ Invoked::FeedbackRecordServlet::doPost()");
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		System.out.println("************ Invoked::FeedbackRecordServlet::doGet()");
		
		String contextPath = request.getContextPath();
		String servletPath = request.getServletPath();
		String pathInfo = request.getPathInfo();
		String action = request.getPathInfo().substring(1); // select path without '/' mark
		System.out.println("Invoked::FeedbackRecordServlet::doGet() contextPath: " + contextPath + " | servletPath: " + servletPath + " | pathInfo: " + pathInfo + " | action: " + action);

        try {
            switch (action) {
                case "new":    // Display new feedback form
                    showNewForm(request, response);
                    break;
                case "insert": // Insert feedback on button click
                    insertFeedbackRecord(request, response);
                    break;
                case "delete": // Delete feedback on button click
                    deleteFeedbackRecord(request, response);
                    break;
                case "edit":   // Display update form
                    showEditForm(request, response);
                    break;
                case "update": // Update on button click
                    updateFeedbackRecord(request, response);
                    break;
                default:		// List all feedback records
                    listFeedbackRecords(request, response);
                    break;
            }
        } 
        catch (Exception e) {
        	// e.printStackTrace();
        	System.out.println(e.getMessage());
        }
    }
	
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		System.out.println("Invoked::FeedbackRecordServlet::showNewForm()");
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedback-form.jsp");
        dispatcher.forward(request, response);
    }
	
	private void insertFeedbackRecord(HttpServletRequest request, HttpServletResponse response)
		    throws IOException {
		System.out.println("Invoked::FeedbackRecordServlet::insertFeedbackRecord()");
		String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String Address = request.getParameter("address");
        String feedback = request.getParameter("feedback");
		
        FeedbackRecord feedbackRecord = new FeedbackRecord();
        feedbackRecord.setFirstname(firstname);
        feedbackRecord.setLastname(lastname);
        feedbackRecord.setEmail(email);
        feedbackRecord.setAddress(Address);
        feedbackRecord.setFeedback(feedback);
  
        try {
        	feedbackRecordDao.insertFeedbackRecord(feedbackRecord);
        } 
        catch(Exception e)
        {
        	// e.printStackTrace();
        	System.out.println(e.getMessage());
        }
     
        response.sendRedirect("list");
    }
	
    private void deleteFeedbackRecord(HttpServletRequest request, HttpServletResponse response)
    throws IOException {
    	int f_id = Integer.parseInt(request.getParameter("f_id"));
    	System.out.println("Invoked::FeedbackRecordServlet::deleteFeedbackRecord() f_id: " + f_id);
        try {
        	feedbackRecordDao.deleteFeedbackRecord(f_id);
        } 
        catch(Exception e)
        {
        	// e.printStackTrace();
        	System.out.println(e.getMessage());
        }
        response.sendRedirect("list");

    }
    
  
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	int f_id = Integer.parseInt(request.getParameter("f_id"));
    	System.out.println("Invoked::FeedbackRecordServlet::showEditForm() f_id: " + f_id);
    	response.sendRedirect("../feedback-form.jsp?f_id=" + f_id);
    }
    
    private void updateFeedbackRecord(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
    	int f_id = Integer.parseInt(request.getParameter("f_id"));
    	System.out.println("Invoked::FeedbackRecordServlet::updateFeedbackRecord() f_id: " + f_id);
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String feedback = request.getParameter("feedback");
        
        FeedbackRecord feedbackRecord = new FeedbackRecord(f_id, firstname, lastname, email, address, feedback);
        try {
        	feedbackRecordDao.updateFeedbackRecord(feedbackRecord);
        }
        catch(Exception e)
        {
        	// e.printStackTrace();
        	System.out.println(e.getMessage());
        }
        response.sendRedirect("list");
    }
	
	private void listFeedbackRecords(HttpServletRequest request, HttpServletResponse response)
		    throws IOException, ServletException {
		System.out.println("Invoked::FeedbackRecordServlet::listFeedbackRecords()");
		response.sendRedirect("../feedback-list.jsp");
    }

}
