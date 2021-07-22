package Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class historyStep {
	public String getHistoryStep(HttpServletRequest request, HttpServletResponse response) {
		String  url =request.getServletPath();
		System.out.println("url "+url);
		return url;
	}
}
