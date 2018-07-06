package web.component;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.product.ProductBiz;
import com.vo.Product;
import com.vo.User;


@WebServlet({ "/ProductServlet", "/product" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProductBiz<Product, Integer> biz;

    public ProductServlet() {
        super();
        biz = new ProductBiz<>();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		String next = "main.jsp";
		MultipartRequest mRequest = null; //cos.jar 라이브러리 class
		String dir = "C:\\Users\\student\\git\\mvc2\\web\\img";
		int size = 1024*1024*1024;
		System.out.println(cmd);
		if(cmd.equals("add")) {
			mRequest = new MultipartRequest(request, dir,size,"utf-8");
			String name = mRequest.getParameter("name");
			String price = mRequest.getParameter("price");
			String imgname = mRequest.getOriginalFileName("imgname");
			System.out.println(imgname);
			Product p = new Product(name,Integer.parseInt(price),imgname);

			try {
				biz.register(p);
				request.setAttribute("center", "product/ok");
			} catch (Exception e) {
				request.setAttribute("center", "product/fail");
				e.printStackTrace();
			}
		}else if(cmd.equals("list")) {
			try {
				ArrayList<Product> list = biz.get();
				request.setAttribute("list", list);
				request.setAttribute("center", "product/list");

			} catch (Exception e) {
				response.sendRedirect("main.kakao?page=productlistfail");
				e.printStackTrace();
				return;
			}
		}else if(cmd.equals("detail")) {
			String id = request.getParameter("id");
			Product product = null;
			try {
				product = biz.get(Integer.parseInt(id));
				request.setAttribute("navi", "detail");
				request.setAttribute("pdetail", product);
				request.setAttribute("center", "product/detail");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(cmd.equals("delete")) {
			String id = request.getParameter("id");
			try {
				biz.remove(Integer.parseInt(id));
				response.sendRedirect("product.kakao?cmd=list");
				return;
			} catch (Exception e) {
				request.setAttribute("center", "product/list");
				e.printStackTrace();
			}
			
		}else if(cmd.equals("update")) {
			String id = request.getParameter("id");
			Product product = null;
			try {
				product = biz.get(Integer.parseInt(id));
				request.setAttribute("navi", "udpate");
				request.setAttribute("pupdate", product);
				request.setAttribute("center", "product/update");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(cmd.equals("updateimpl")) {
			mRequest = new MultipartRequest(
					request,dir,size,
					"utf-8"
					);
			String id = 
					mRequest.getParameter("id");
			String name = 
					mRequest.getParameter("name");
			String price = 
					mRequest.getParameter("price");
			String imgname = 
					mRequest.getParameter("imgname");
			String newimgname = 
			mRequest.getOriginalFileName("newimgname");
			Product p = null;
			if(newimgname == null ||
					newimgname.equals("")) {
				p = new Product(
						Integer.parseInt(id),
						name, 
						Integer.parseInt(price), 
						imgname);
			}else {
				p = new Product(
						Integer.parseInt(id),
						name, 
						Integer.parseInt(price), 
						newimgname);
			}
			try {
				biz.modify(p);
				response.sendRedirect("product.kakao?cmd=detail&id="+id);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
