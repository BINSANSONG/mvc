package web.component;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hanriver.HanRiverBiz;
import com.product.ProductBiz;
import com.vo.HanRiver;
import com.vo.Product;


@WebServlet({ "/ChartServlet", "/chart" })
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	HanRiverBiz<HanRiver, Integer> biz; //수정 필요

    public ChartServlet() {
        super();
        biz = new HanRiverBiz<>();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<HanRiver> list = null; //수정필요
		ArrayList<String> rg = null;
		try {
			list = biz.get();
			JSONArray ja = new JSONArray();
			
			
			for(HanRiver p : list) {
				JSONObject jo = new JSONObject();
				jo.put("region", p.getRegion());
				jo.put("total", p.getTotal());
				jo.put("people", p.getPeople());
				jo.put("gym", p.getGym());
				jo.put("bicycle", p.getBicycle());
				jo.put("event", p.getEvent());
				jo.put("park", p.getPark());
				ja.add(jo);
				
			}
			
			
			
			
			response.setContentType("text/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(ja.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
