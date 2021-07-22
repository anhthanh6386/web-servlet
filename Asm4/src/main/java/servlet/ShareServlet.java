package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ShareDAO;
import DAO.UserDAO;
import DAO.VideoDAO;
import Utils.Email;
import model.Share;
import model.User;
import model.Video;

/**
 * Servlet implementation class shareservlet
 */
@WebServlet("/S")
public class ShareServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();
	VideoDAO videoDAO = new VideoDAO();
	ShareDAO shareDAO = new ShareDAO();
	String idVideo;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(new HomeServlet().idVideo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Share share = new Share();
			String idvideo = request.getSession().getAttribute("videoIdShare")+"";
			String iduder = request.getSession().getAttribute("usernametk")+"";
			
			Video video = videoDAO.findById(idvideo);
			User user = userDAO.findById(iduder);
			System.out.println(video.toString());
			System.out.println(user.toString());
			share.setUser(user);
			share.setVideo(video);
			share.setSharedate(new Date());
			share.setEmail(request.getParameter("emailshare"));
			share.setEmailgui(user.getEmail());
			
			shareDAO.insert(share);
			request.getSession().removeAttribute("videoIdShare");
			response.sendRedirect("home");
			new Email().sendEmail(request.getParameter("emailshare"), "Share Video","Địa chỉ email "+user.getEmail()+" đã yêu cầu chia sẻ video này cho bạn"
			+video.getTiTile()+"\n http://localhost:8080/Asm4/video?videoId="+video.getId());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
