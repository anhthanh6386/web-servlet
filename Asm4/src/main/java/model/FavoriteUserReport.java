package model;

import java.util.Date;

public class FavoriteUserReport {
	private String username;
	private String fullname;
	private String email;
	private Date likedate;
	
	public FavoriteUserReport() {}

	public FavoriteUserReport(String username, String fullname, String email, Date likedate) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.likedate = likedate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLikedate() {
		return likedate;
	}

	public void setLikedate(Date likedate) {
		this.likedate = likedate;
	}

	@Override
	public String toString() {
		return "FavoriteUserReport [username=" + username + ", fullname=" + fullname + ", email=" + email
				+ ", likedate=" + likedate + "]";
	}
	
	
	
}
