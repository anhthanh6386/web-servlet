package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the shares database table.
 * 
 */
@Entity
@Table(name="shares")
@NamedQuery(name="Share.findAll", query="SELECT s FROM Share s")
public class Share implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String email;

	private String emailgui;
	public String getEmailgui() {
		return emailgui;
	}

	public void setEmailgui(String emailgui) {
		this.emailgui = emailgui;
	}

	@Temporal(TemporalType.DATE)
	private Date sharedate;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Userid")
	private User user;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="Videoid")
	private Video video;

	public Share() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSharedate() {
		return this.sharedate;
	}

	public void setSharedate(Date sharedate) {
		this.sharedate = sharedate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	@Override
	public String toString() {
		return "Share [id=" + id + ", email=" + email + ", sharedate=" + sharedate + ", user=" + user + ", video="
				+ video + "]";
	}
	

}