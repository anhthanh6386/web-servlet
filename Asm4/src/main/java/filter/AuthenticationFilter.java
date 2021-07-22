//package filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import model.User;
//
//@WebFilter("/admin/*")
//public class AuthenticationFilter implements Filter {
//
//    public AuthenticationFilter() {
//    }
//
//	public void destroy() {
//		System.out.println("AuthenticationFilter is destroyed!");
//	}
//
//	public void doFilter(
//		ServletRequest request,
//		ServletResponse response,
//		FilterChain chain
//	) throws IOException, ServletException {
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//
//		HttpSession session = httpRequest.getSession();
//
//		User authUser = (User) session.getAttribute("username");
//		if(authUser == null||authUser.getAdmins()==false) {
//			HttpServletResponse httpResponse = (HttpServletResponse) response;
//			httpResponse.sendRedirect("/Asm4/dang-nhap");
//		} else {
//			chain.doFilter(request, response);
//		}
//	}
//
//	public void init(FilterConfig fConfig) throws ServletException {
//		System.out.println("AuthenticationFilter is initializing...");
//	}
//
//}