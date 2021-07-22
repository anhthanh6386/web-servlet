package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import DAO.UserDAO;
import model.User;

/**
 * Servlet implementation class userservlet
 */
@WebServlet({ "/userservlet", "/cu", "/ru", "/du", "/uu", "/up" })
public class UserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("do post userservlet");
		String uri = request.getRequestURI();
		// CREATE
		if (uri.contains("cu")) {
			System.out.println("CREATE");
			try {
				String checknull = request.getParameter("id");
				if (checknull.length() != 0) {
					User user = new User();
					user.setAdmins(true);
					BeanUtils.populate(user, request.getParameterMap());

					boolean admin = true;
					if (request.getParameter("admin").equalsIgnoreCase("false")) {
						admin = false;
					}
					user.setAdmins(admin);
					userDAO.insert(user);
				} else {
				}
				response.sendRedirect("qlus");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("else");
		}

		// UPDATE
		if (uri.contains("uu")) {
			System.out.println("UPDATE");
			try {

				User user = new User();
				user.setAdmins(true);
				BeanUtils.populate(user, request.getParameterMap());
				boolean admin = true;
				if (request.getParameter("admin").equalsIgnoreCase("false")) {
					admin = false;
				}
				user.setAdmins(admin);

				if (user.getId().length() != 0) {
					userDAO.update(user);
				}
				response.sendRedirect("qlus");

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		if (uri.contains("up")) {
			try {

				User user = new User();
				BeanUtils.populate(user, request.getParameterMap());
				String username = request.getSession().getAttribute("usernametk") + "";
				user.setId(username);
				System.out.println(user.toString());
				System.out.println(request.getAttribute("admin"));

				if (user.getId().length() != 0) {
					userDAO.update(user);
					System.out.println("update");
				}
				response.sendRedirect("TTCN");

			} catch (Exception e) {
				e.printStackTrace();

			}
		}

		if (uri.contains("du")) {
			try {
				User user = new User();
				user.setDeleteUS(true);
				BeanUtils.populate(user, request.getParameterMap());
				boolean admin = true;
				if (request.getParameter("admin").equalsIgnoreCase("false")) {
					admin = false;
				}
				user.setAdmins(admin);

				if (user.getId().length() != 0) {
					userDAO.update(user);
				}
				response.sendRedirect("qlus");

			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		if (uri.contains("ru")) {
			System.out.println("Reset VIDEO");
			try {
				User video = new User();
				request.setAttribute("userOject", video);
				response.sendRedirect("qlus");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
