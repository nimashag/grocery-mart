package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.FeedbackRecord;

public class FeedbackRecordDao {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/grocery_db?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Root1234@";
    
    private static final String INSERT_FEEDBACK_SQL = "INSERT INTO feedback_records" + "  (firstname,lastname,email,address,feedback) VALUES " +
            " (? , ? , ? , ? , ?);";
    private static final String SELECT_ALL_FEEDBACK = "SELECT * from feedback_records ORDER BY f_id DESC";
    private static final String SELECT_FEEDBACK_BY_ID = "SELECT * from feedback_records where f_id =?";
    private static final String DELETE_FEEDBACK_SQL = "DELETE from feedback_records where f_id = ?;";
    private static final String UPDATE_FEEDBACK_SQL = "UPDATE feedback_records set firstname=?,lastname=?,email=?,address=?,feedback=? where f_id = ?;";
    
    public FeedbackRecordDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
	
	public void insertFeedbackRecord(FeedbackRecord feedbackRecord) throws ClassNotFoundException //get all records
	{
		System.out.println("Invoked::insertFeedbackRecord()");
		
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FEEDBACK_SQL)) {
        	preparedStatement.setString(1, feedbackRecord.getFirstname());
        	preparedStatement.setString(2, feedbackRecord.getLastname());
        	preparedStatement.setString(3,feedbackRecord.getEmail());
        	preparedStatement.setString(4, feedbackRecord.getAddress());
        	preparedStatement.setString(5, feedbackRecord.getFeedback());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        	System.out.println(e.getMessage());
        }
	}
	
	// Get all records
	public List < FeedbackRecord > selectAllFeedbackRecords() {

        List < FeedbackRecord > records = new ArrayList < > ();
        // Establishing a Connection
        try (Connection connection = getConnection();

            // Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FEEDBACK);) {
            System.out.println(preparedStatement);
            
            // Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet object.
            while (rs.next()) {
                int f_id = rs.getInt("f_id");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String feedback = rs.getString("feedback");
                records.add(new FeedbackRecord(f_id, firstname, lastname, email, address, feedback));
            }
        } catch (SQLException e) {
        	System.out.println(e.getMessage());
        }
        return records;
    }
	
	// Get one record
	public FeedbackRecord selectFeedbackRecord(int f_id) {
		FeedbackRecord feedbackRecord = null;
        // Establishing a Connection
        try (Connection connection = getConnection();
            // Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEEDBACK_BY_ID);) {
            preparedStatement.setInt(1, f_id);
            System.out.println(preparedStatement);
            // Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet object.
            while (rs.next()) {
            	String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String feedback = rs.getString("feedback");
                feedbackRecord = new FeedbackRecord(f_id, firstname, lastname, email, address, feedback);
            }
        } catch (SQLException e) {
        	System.out.println(e.getMessage());
        }
        return feedbackRecord;
    }
	
	
	
	public boolean deleteFeedbackRecord(int f_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_FEEDBACK_SQL);) {
            statement.setInt(1, f_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
	
    public boolean updateFeedbackRecord(FeedbackRecord feedbackRecord) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_FEEDBACK_SQL);) {
            
        	statement.setString(1, feedbackRecord.getFirstname());
        	statement.setString(2, feedbackRecord.getLastname());
        	statement.setString(3, feedbackRecord.getEmail());
        	statement.setString(4, feedbackRecord.getAddress());
        	statement.setString(5, feedbackRecord.getFeedback());
            statement.setInt(6, feedbackRecord.getF_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
