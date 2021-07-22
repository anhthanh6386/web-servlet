package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.VideoDAO;

import model.Video;

/**
 * Servlet implementation class videoservlet
 */
@MultipartConfig
@WebServlet({ "/videoservlet", "/CV", "/UV", "/DV", "/RV" })

public class VideoServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VideoDAO videoDAO = new VideoDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("do get videoservlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		if (uri.contains("CV")) {
			try {
				getImage(request, response);
				Video video = new Video();
				BeanUtils.populate(video, request.getParameterMap());
				if (fileImage==null) {
					video.setPoster("ZiClJf-1920w.jpg");
				}else {
					video.setPoster(fileImage);
				}
				video.setDeleteVD(false);
				videoDAO.insert(video); 
				System.out.println("img  "+fileImage);
				System.out.println("them video thanh cong");
				request.setAttribute("messentge", "Thêm thành công");
				response.sendRedirect("qlvd");
			} catch (Exception e) {
				response.sendRedirect("qlvd");
				e.printStackTrace();
				return;
			}

		}
		if (uri.contains("UV")) {
			System.out.println("UPDATE VIDEO");
			try {
				System.out.println(fileImage);
				getImageUpdate(request, response);
				Video video = new Video();
				Video oldvideo = new Video();
				oldvideo = videoDAO.findById(request.getParameter("id"));
				BeanUtils.populate(video, request.getParameterMap());
				video.setPoster(fileImage);
				video.setShares(oldvideo.getShares());
				video.setFavorites(video.getFavorites()); 
				if (video.getId().length() != 0) {
					videoDAO.update(video); 
					System.out.println("file name "+fileImage);
				}
				response.sendRedirect("qlvd");

			} catch (Exception e) {
				e.printStackTrace();

			}

		}
		if (uri.contains("DV")) {
			System.out.println("DELETE VIDEO");
			try {
				String id = request.getParameter("id");
				if (id != null) {
					Video video = new Video();
					video = videoDAO.findById(id);
					video.setDeleteVD(true);
					videoDAO.update(video);
					System.out.println("DELETE SUCCESS");
					response.sendRedirect("qlvd");
				} else {
					System.out.println("ERRO delete");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			

		}
		if (uri.contains("RV")) {
			System.out.println("Reset VIDEO");
			try {
				Video video = new Video();
				request.setAttribute("videoOject", video);

				response.sendRedirect("qlvd");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	String fileImage;

	private void getImage(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		File dir = new File(request.getServletContext().getRealPath("/images"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part photo = request.getPart("image");
		System.out.println("img "+request.getPart("image"));
		File photoFile = new File(dir, photo.getSubmittedFileName());
//		System.out.println("photo "+photoFile.isFile());
		try {
			System.out.println("if");
			photo.write(photoFile.getAbsolutePath());
			fileImage = photoFile.getName();
		} catch (Exception e) {
			request.setAttribute("validateHinh", "Hình không được để trống!");
			response.sendRedirect("qlvd");
			return;
		}
	}

	private void getImageUpdate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		File dir = new File(request.getServletContext().getRealPath("/images"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part photo = request.getPart("image");
		File photoFile = new File(dir, photo.getSubmittedFileName());
		try {
			System.out.println("if");
			photo.write(photoFile.getAbsolutePath());
			fileImage = photoFile.getName();
		} catch (Exception e) {
			System.out.println("else");
			fileImage = videoDAO.findById(request.getParameter("id")).getPoster();
		}

	}

}
