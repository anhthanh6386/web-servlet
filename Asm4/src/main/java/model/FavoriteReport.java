package model;

import java.util.Date;

public class FavoriteReport {
	private String videoTitle;
	private Long favoriteCoount;
	private Date newesdate;
	private Date oldesdate;

	public FavoriteReport() {
	}

	public FavoriteReport(String videoTitle, Long favoriteCoount, Date newesdate, Date oldesdate) {
		super();
		this.videoTitle = videoTitle;
		this.favoriteCoount = favoriteCoount;
		this.newesdate = newesdate;
		this.oldesdate = oldesdate;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public Long getFavoriteCoount() {
		return favoriteCoount;
	}

	public void setFavoriteCoount(Long favoriteCoount) {
		this.favoriteCoount = favoriteCoount;
	}

	public Date getNewesdate() {
		return newesdate;
	}

	public void setNewesdate(Date newesdate) {
		this.newesdate = newesdate;
	}

	public Date getOldesdate() {
		return oldesdate;
	}

	public void setOldesdate(Date oldesdate) {
		this.oldesdate = oldesdate;
	}

	@Override
	public String toString() {
		return "FavoriteReport [videoTitle=" + videoTitle + "]";
	}
	

}
