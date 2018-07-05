package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.UserBiz;
import com.vo.User;


@WebServlet({ "/UserServlet", "/user" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserBiz<User, String> biz;
    
    public UserServlet() {
        super();
        biz = new UserBiz<>();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cmd = request.getParameter("cmd");
		String next = "main.jsp";//뒷단에서는 그냥 바로 간다
		
		if(cmd.equals("list")) {
			ArrayList<User> list = null;
			try {
				list = biz.get();
				request.setAttribute("navi", "");
				request.setAttribute("userlist", list);
				request.setAttribute("center", "user/list");
			} catch (Exception e) {
				request.setAttribute("center", "user/list");
				e.printStackTrace();
			}
		}else if(cmd.equals("detail")) {
			String id = request.getParameter("id");
			User user = null;
			try {
				user = biz.get(id);
				request.setAttribute("navi", "detail");
				request.setAttribute("userdetail", user);
				request.setAttribute("center", "user/detail");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(cmd.equals("delete")) {
			String id = request.getParameter("id");
			ArrayList<User> list = null;
			try {
				biz.remove(id);
				response.sendRedirect("user.kakao?cmd=list");
				return;
			} catch (Exception e) {
				request.setAttribute("center", "user/list");
				e.printStackTrace();
			}
			
		}else if(cmd.equals("update")) {
			String id = request.getParameter("id");
			User user = null;
			try {
				user = biz.get(id);
				request.setAttribute("navi", "udpate");
				request.setAttribute("userupdate", user);
				request.setAttribute("center", "user/update");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(cmd.equals("updateimpl")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			User user = null;
			try {
//				user = biz.get(id);
//				user.setName(pwd);
//				user.setName(name);
//				위 같이 하면 DB에 한번 접속하게 되므로 
				user = new User(id,pwd,name);
//				이렇게 하면 db 접속없이도 가져온다
				biz.modify(user);
				response.sendRedirect("user.kakao?cmd=detail&id="+id);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(cmd.equals("add")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			try {
				biz.register(new User(id, pwd, name));

				
				request.setAttribute("id", id);

				RequestDispatcher rd = request.getRequestDispatcher("main.kakao?page=registerok");
				rd.forward(request, response);
			} catch (Exception e) {
				response.sendRedirect("main.kakao?page=registerfail");
				e.printStackTrace();
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
