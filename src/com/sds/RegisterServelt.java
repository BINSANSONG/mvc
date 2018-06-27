package com.sds;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServelt
 */
@WebServlet({ "/RegisterServelt", "/register" })
public class RegisterServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		System.out.println("[id : "+id+"]");
		System.out.println("[email : "+email+"]");
		System.out.println("[password : "+password+"]");
		System.out.println("[fname : "+fname+"]");
		System.out.println("[lname : "+lname+"]");
		response.sendRedirect("index.html");
	}

}
