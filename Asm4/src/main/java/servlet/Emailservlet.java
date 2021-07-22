package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import Utils.Email;
import model.User;

/**
 * Servlet implementation class Email
 */
@WebServlet({"/Email","/OTP","/forgot"})
public class Emailservlet extends HttpServlet {
	UserDAO userDAO = new UserDAO();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Emailservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/forgotpassword.jsp").forward(request, response);
	}

	int x=0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if(uri.contains("OTP")) {
			x = (int) (Math.random() * 100000 + 9999);
			try {
				new Email().sendEmail(new UserDAO().findById(request.getParameter("taikhoan1")).getEmail(), "sentOTP", x+"");
				request.setAttribute("tk", request.getParameter("taikhoan1"));
				request.setAttribute("mk1", request.getParameter("matkhaumoi"));
				request.setAttribute("mk2", request.getParameter("nhaplai"));
				request.setAttribute("messengerOTP", "Một mã OTP đã được gửi tới email đăng kí tài khoản của bạn, vui lòng kiểm tra lại email!");
				request.setAttribute("title","Asm4");
				request.getRequestDispatcher("/views/forgotpassword.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("checkUsername", "Vui lòng nhập đúng tên tài khoản của bạn!");
				request.getRequestDispatcher("/views/forgotpassword.jsp").forward(request, response);
				return;
			}
			
		}
		if(uri.contains("forgot")) {
			int OTPform = Integer.parseInt(request.getParameter("otp").toString());
			String mk=request.getParameter("matkhaumoi");
			String mk1=request.getParameter("nhaplai");
			if(OTPform == x && x !=0&&mk.equals(mk1)) {
				doimatkhau(request, response, request.getParameter("taikhoan1"));
				request.getRequestDispatcher("/views/Messenger.jsp").forward(request, response);
				x=0;
				OTPform=0;
			}else if(!mk.equals(mk1)) {
				request.setAttribute("messengerMatkhau", "Mật khẩu xác nhận không khớp!");
				request.getRequestDispatcher("/views/forgotpassword.jsp").forward(request, response);
			}
			else {
				request.setAttribute("messengerOTP", "sai ma OTP");
				request.getRequestDispatcher("/views/forgotpassword.jsp").forward(request, response);
			}
		}
	}
	
	private void doimatkhau(HttpServletRequest request, HttpServletResponse response,String id) {
		User user = userDAO.findById(id);
		user.setPasswords(request.getParameter("matkhaumoi"));
		userDAO.update(user);
	}

}
