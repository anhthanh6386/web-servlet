package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DAO.FacoriteDAO;
import DAO.ShareDAO;
import DAO.VideoDAO;
import model.Favorite;
import model.FavoriteUserReport;
import model.Share;
import model.User;
import model.Video;

@WebServlet({ "/admin", "/user", "/home", "/qlvd", "/qlus", "/edit", "/video", "/editvideo", "/dang-nhap", "/dang-ki",
		"/yeu-thich", "/L", "/UL", "/Sh", "/TTCN", "/bao-cao", "/find" })
public class HomeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DAO.UserDAO userDAO = new DAO.UserDAO();
	private DAO.VideoDAO videoDAO = new VideoDAO();
	private FacoriteDAO favoriteDAO = new FacoriteDAO();
	private DAO.CommentDAO cmDAO=new CommentDAO();
	ShareDAO shareDAO = new ShareDAO();
	public String idVideo;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		request.setAttribute("lienKet", action);
		System.out.println(action);
		try {
			switch (action) {
			case "/admin": {
				if (request.getSession().getAttribute("username") != null) {
					String pageStr = request.getParameter("page");
					String limitStr = request.getParameter("limit");
					int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
							limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
					request.setAttribute("page", page);
					request.setAttribute("limit", limit);
					request.setAttribute("listUser", resetListUser1("", page, limit));
					showForm2(request, response, "/views/user.jsp");
				} else {
					response.sendRedirect("dang-nhap");
				}
				break;
			}
			case "/user": {
				showHome(request, response);
				break;
			}
			case "/home": {
				showHome(request, response);
				break;
			}
			case "/find": {
				showHome(request, response);
				break;
			}

			case "/qlvd": {
				User user = (User) request.getSession(false).getAttribute("username");
				if (request.getSession().getAttribute("username") != null) {
					if (!user.getAdmins()) {
						response.sendRedirect("home");
					} else {
						String pageStr = request.getParameter("page");
						String limitStr = request.getParameter("limit");
						int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
								limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
						request.setAttribute("page", page);
						request.setAttribute("limit", limit);
						request.setAttribute("listVideo", showPage("", page, limit));
//						request.setAttribute("listVideo", resetListVideo());
						showForm2(request, response, "/views/QLVD.jsp");
					}
				} else {
					response.sendRedirect("dang-nhap");
				}

				break;
			}

			case "/qlus": {
				User user = (User) request.getSession(false).getAttribute("username");
				if (request.getSession().getAttribute("username") != null) {
					if (!user.getAdmins()) {
						response.sendRedirect("home");
					} else {
						String pageStr = request.getParameter("page");
						String limitStr = request.getParameter("limit");
						int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
								limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
						request.setAttribute("page", page);
						request.setAttribute("limit", limit);
						request.setAttribute("listUser", resetListUser1("", page, limit));
						showForm2(request, response, "/views/user.jsp");
					}
				} else {
					response.sendRedirect("dang-nhap");
				}

				break;
			}
			case "/edit": {
				if (request.getSession().getAttribute("username") != null) {
					String id = request.getParameter("userId");
					request.setAttribute("userOject", showFormUser(request, response, id));
					String pageStr = request.getParameter("page");
					String limitStr = request.getParameter("limit");
					int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
							limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
					request.setAttribute("page", page);
					request.setAttribute("limit", limit);
					request.setAttribute("listUser", resetListUser1("", page, limit));
					showForm2(request, response, "/views/user.jsp");
				} else {
					response.sendRedirect("dang-nhap");
				}

				break;
			}
			case "/video": {
				String id = request.getParameter("videoId");
				request.setAttribute("listFavorite",
						resetListFavorite(request.getSession().getAttribute("usernametk") + ""));
				request.setAttribute("listVideo", videoDAO.findByPageAndTitle("", 1, 6));
				request.setAttribute("videoOject", getVideoById(id));
				request.setAttribute("listComment", cmDAO.findByIdVideo(id));
				Video video = getVideoById(id);
				video.setViews(video.getViews() + 1);
				videoDAO.update(video);
				showForm(request, response, "/user/video.jsp");
				break;
			}
			case "/editvideo": {
				if (request.getSession().getAttribute("username") != null) {
					String id = request.getParameter("videoId");
					request.setAttribute("videoOject", showFormVideo(request, response, id));
					request.setAttribute("listVideo", resetListVideo());
					showForm2(request, response, "/views/QLVD.jsp");
				} else {
					response.sendRedirect("dang-nhap");
				}

				break;
			}
			case "/dang-nhap": {
				if (request.getSession().getAttribute("username") == null) {
					request.setAttribute("title", "Asm4");
					request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
					break;
				} else {
					response.sendRedirect("home");
				}
			}
			case "/dang-ki": {
				request.setAttribute("title", "Asm4");
				request.getRequestDispatcher("/views/dangki.jsp").forward(request, response);
				break;
			}

			case "/yeu-thich": {
				if (request.getSession().getAttribute("username") != null) {

					request.setAttribute("listFavorite", resetListFavorite());
					showForm(request, response, "/views/like.jsp");
					break;
				} else {
					response.sendRedirect("dang-nhap");
				}
			}
			case "/L": {
				if (request.getSession().getAttribute("username") != null) {
					String id = request.getParameter("LId");
					insertLike(request, response, id);
					response.sendRedirect("http://localhost:8080/Asm4/video?videoId=" + id);
//					User userlogin = userDAO.findById(request.getParameter("taiKhoan"));
//					User entity=userDAO.findById(userlogin.getId());
//					entity.setCountLogin(userlogin.getCountLogin()+1);
//					userDAO.update(entity);
				} else {
					response.sendRedirect("dang-nhap");
				}
				break;
			}
			case "/UL": {
				if (request.getSession().getAttribute("username") != null) {
					String idvideo = request.getParameter("ULId");
					String iduser = (String) request.getSession().getAttribute("usernametk");
					deleteLike(request, response, idvideo, iduser);
					response.sendRedirect("http://localhost:8080/Asm4/video?videoId=" + idvideo);
					break;
				} else {
					response.sendRedirect("dang-nhap");
				}
			}

			case "/Sh": {
				new LoginServlet();
				if (!LoginServlet.isLogin(request)) {
					response.sendRedirect("home");
					return;
				}
				idVideo = request.getParameter("SId");
				request.getSession(false).setAttribute("videoIdShare", idVideo);
				showForm(request, response, "/views/chiase.jsp");
				break;
			}

			case "/TTCN": {
				if (request.getSession().getAttribute("username") != null) {
					String id = request.getSession(false).getAttribute("usernametk") + "";
					request.setAttribute("userTTCN", userDAO.findById(id));
					showForm(request, response, "/views/thongtincanhan.jsp");
					break;
				} else {
					response.sendRedirect("dang-nhap");
				}
			}

			case "/bao-cao": {
				User user = (User) request.getSession(false).getAttribute("username");
				if (request.getSession().getAttribute("username") != null) {
					if (!user.getAdmins()) {
						response.sendRedirect("home");
					} else {
						reportuser(request, response);
						request.setAttribute("listVideoTitle", videoDAO.findAllVideo());
						request.setAttribute("listFavoriteReport", favoriteDAO.reportFavoriteByVideo());
						request.setAttribute("vlist", shareDAO.findAll());
						request.setAttribute("listF", userDAO.findByDeleteUS());
						showForm2(request, response, "/views/report.jsp");
					}
				} else {
					response.sendRedirect("dang-nhap");
				}
				break;
			}

			default:
				System.out.println("default");
				request.setAttribute("title", "Asm4");
				request.getRequestDispatcher("/views/ERRO.jsp").forward(request, response);
				break;
			}

		} catch (

		Exception e) {
			e.printStackTrace();
			System.out.println("ERRO HOME");
		}

	}

	// Hiển thị các video theo điều kiện lên form
	private void showHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "Asm4");
		request.setAttribute("view", "/user/listvideo.jsp");
		String action = request.getServletPath();
		request.setAttribute("duongdan", action);
		if (action.equals("/find")) {
			String title = request.getParameter("ten");
			request.setAttribute("ten", title);
			String pageStr = request.getParameter("page");
			String limitStr = request.getParameter("limit");
			int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
					limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
			request.setAttribute("page", page);
			request.setAttribute("limit", limit);
			request.setAttribute("listVideo", showPage(title, page, limit));
		} else {
			String pageStr = request.getParameter("page");
			String limitStr = request.getParameter("limit");
			int page = (pageStr == null || Integer.parseInt(pageStr) < 1) ? 1 : Integer.parseInt(pageStr),
					limit = limitStr == null ? 8 : Integer.parseInt(limitStr);
			request.setAttribute("page", page);
			request.setAttribute("limit", limit);
			request.setAttribute("listVideo", showPage("", page, limit));
		}
		request.setAttribute("listFavoreti", resetListFavorite(request.getSession().getAttribute("usernametk") + ""));
		request.getRequestDispatcher("/user/body.jsp").forward(request, response);
	}

	public void showForm(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		request.setAttribute("title", "Asm4");
		request.setAttribute("view", url);
		request.getRequestDispatcher("/user/body.jsp").forward(request, response);
	}

	public void showForm2(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		request.setAttribute("title", "Asm4");
		request.setAttribute("view", url);
		request.getRequestDispatcher("/views/tk.jsp").forward(request, response);
	}

	public List<User> resetListUser() {
		List<User> listUser = userDAO.findByDeleteUS();
		return listUser;
	}
	
	public List<User> resetListUser1(String username,int page, int limit) {
		List<User> listUser = userDAO.findByPageAndUserName(username, page, limit);
		return listUser;
	}
	
	private User showFormUser(HttpServletRequest request, HttpServletResponse response, String id) {
		User user = userDAO.findById(id);
		return user;
	}
	
	/////////////////
	public List<Video> resetListVideo() {
		
		List<Video> listVideo = videoDAO.findAllVideo();
	    
		return listVideo;
	}

	public List<Favorite> resetListFavorite(String id) {
		List<Favorite> listFavorites = favoriteDAO.findByUser(id);
		return listFavorites;
	}

	private Video getVideoById(String id) {
		Video video = videoDAO.findById(id);
		return video;
	}

	private Video showFormVideo(HttpServletRequest request, HttpServletResponse response, String id) {
		Video video = videoDAO.findById(id);
		return video;
	}

	private void insertLike(HttpServletRequest request, HttpServletResponse response, String id) {
		User user = (User) request.getSession().getAttribute("username");
		Favorite fa = new Favorite();
		Video video = videoDAO.findById(id);
//		video.setActives(false);
		fa.setVideo(video);
		fa.setUser(userDAO.findById(user.getId()));
		fa.setLikeDate(new Date());
		favoriteDAO.insert(fa);
	}

	private void deleteLike(HttpServletRequest request, HttpServletResponse response, String idvideo, String iduser) {
		new FacoriteDAO().deleteFavoriteByvideoId(idvideo, iduser);
	}

	private List<Favorite> resetListFavorite() {
		List<Favorite> listFavorite = favoriteDAO.findAll();
		return listFavorite;
	}

	private List<Video> showPage(String title, int page, int limit) {

		List<Video> list = videoDAO.findByPageAndTitle(title, page, limit);
		for (Video video : list) {
			System.out.println(video.getTiTile());
		}
		System.out.println("Tim Kiem");
		return list;
	}

	private void reportuser(HttpServletRequest request, HttpServletResponse response) {

		try {
			String id = request.getParameter("videoUserId");
			List<Share> vList = shareDAO.findAll();
			List<FavoriteUserReport> list = favoriteDAO.reportUser(id);
			System.out.println(list.toString());
			request.setAttribute("videoUserId", id);
			request.setAttribute("vList", vList);
			request.setAttribute("listF", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
