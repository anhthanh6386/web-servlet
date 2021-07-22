package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import model.Comment;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DAO.CommentDAO cmDAO=new CommentDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Comment entity=new Comment();
		String username=req.getParameter("usernametk");
		String comment=req.getParameter("comment");
		String vidId=req.getParameter("idVid");
		entity.setUsername(username);
		entity.setComment(comment);
		entity.setIdVideo(vidId);
		cmDAO.insert(entity);
		
		resp.sendRedirect("http://localhost:8080/Asm4/video?videoId=" + vidId);
	}
	
}
