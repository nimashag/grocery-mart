package model;

public class FeedbackRecord {
	
	private int f_id;
	private String firstname;
	private String lastname;
	private String email;
	private String address;
	private String feedback;
	
	public FeedbackRecord(int f_id, String firstname, String lastname, String email, String address, String feedback) {
		this.f_id = f_id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.address = address;
		this.feedback = feedback;
	}
	
	public FeedbackRecord() {
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

}
