package web.dispatcher;

import javax.servlet.http.HttpServletRequest;

public class MakeUi {
	public static void build(HttpServletRequest request,
			String view){
		if(view.equals("useradd")) {
			request.setAttribute("center", "user/add");
		}else if(view.equals("productadd")) {
			request.setAttribute("center", "product/add");
		}else if(view.equals("registerok")) {
			request.setAttribute("center", "registerok");
		}else if(view.equals("registerfail")) {
			request.setAttribute("center", "registerfail");
		}else if(view.equals("center")) {
			request.setAttribute("center", "center");
		}else if(view.equals("login")) {
			request.setAttribute("center", "login");
		}else if(view.equals("weatherweather")) {
			request.setAttribute("center", "weather/weather");
		}else if(view.equals("chart")) {
			request.setAttribute("center", "chart");
		}
	
	}
}
