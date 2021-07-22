package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.FacoriteDAO;
import DAO.UserDAO;
import Utils.CookieUtils;
import model.User;

/**
 * Servlet implementation class dangnhap
 */
@WebServlet("/dangnhap")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();
	FacoriteDAO favoriteDAO = new FacoriteDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get cookie
		request.setAttribute("taiKhoan", CookieUtils.get("taiKhoan", request));
		request.setAttribute("matKhau", CookieUtils.get("matKhau", request));
	}

	public static boolean checkLog = false;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("do post");

		User userlogin = userDAO.findById(request.getParameter("taiKhoan"));

		System.out.println(userlogin);
		if (userlogin != null) {
			if (userlogin.getPasswords().equals(request.getParameter("matKhau"))) {
				if (userlogin.getAdmins()) {
					String action = request.getServletPath();
					request.getSession().setAttribute("uri",action );
					request.getSession().setAttribute("usernametk", userlogin.getId());
					request.getSession().setAttribute("username", userlogin);
					response.sendRedirect("/Asm4/admin");
					
				} else {
					request.getSession().setAttribute("usernametk", userlogin.getId());
					request.getSession().setAttribute("username", userlogin);
					response.sendRedirect("/Asm4/user");
				}
				User entity=userDAO.findById(userlogin.getId());
				entity.setCountLogin(userlogin.getCountLogin()+1);
				userDAO.update(entity);
			} else {
				request.setAttribute("taiKhoan", userlogin.getId());
				request.setAttribute("messageErro", "Sai tài khoản hoặc mật khẩu !");

				request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("messageErro", "Tài khoản này không tồn tại !");
			request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		}

//		add cookie
		int hours = (request.getParameter("remember") == null) ? 0 : 30 * 24;
		CookieUtils.add("taiKhoan", request.getParameter("taiKhoan"), hours, response);
		CookieUtils.add("matKhau", request.getParameter("matKhau"), hours, response);
	}

	public String getusername(HttpServletRequest request) {
		return request.getSession().getAttribute("usernametk") + "";

	}

	public static boolean isLogin(HttpServletRequest request) {
		return request.getSession().getAttribute("username") != null;
	}

}
