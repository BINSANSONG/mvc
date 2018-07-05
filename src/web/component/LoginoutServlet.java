package web.component;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.UserBiz;
import com.vo.User;


@WebServlet({ "/LoginoutServlet", "/loginout" })
public class LoginoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserBiz<User, String> biz;   

    public LoginoutServlet() {
        super();
        biz = new UserBiz<>();
    }

    //LOGOUT
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		request.setAttribute("center", "center");
		RequestDispatcher  rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);
	
	}
	//LOGIN
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		// id, pwd verify
		User user = null;
		String center = "center";
		
		try {
			user = biz.get(id);
			if(user.getPwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", user);
				center = "center";
			}else {
				center = "loginerror";
			}
		} catch (Exception e) {
			center = "loginerror";
			e.printStackTrace();
		}
		// main.jsp
		request.setAttribute("center", center);
		RequestDispatcher  rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);

	
	}

}
