package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import DAO.UserDAO;

/**
 * Servlet implementation class dangkiservlet
 */
@WebServlet("/dangkiservlet")
public class RegisterServlet extends HttpServlet {
	private UserDAO userDAO = new UserDAO();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		try {		
			User user = new User();
			user.setId(request.getParameter("taikhoan"));
			user.setFullname(request.getParameter("ho")+" "+request.getParameter("ten"));
			user.setEmail(request.getParameter("email"));
			user.setPasswords(request.getParameter("matkhau"));
			user.setDeleteUS(false);
			user.setAdmins(false);
			userDAO.insert(user);	
			response.sendRedirect("dang-nhap");	
		} catch (Exception e) {		
			System.out.println("loi tao tai khoan !");
			request.setAttribute("loiTaiKhoan", "Tài khoản này đã tồn tại !");
			request.getRequestDispatcher("/views/dangki.jsp").forward(request, response);
			return;
		}
		
	}

}
