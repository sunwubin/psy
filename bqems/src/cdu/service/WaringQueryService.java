package cdu.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import cdu.dao.SendMessageDao;
import cdu.dao.WaringDao;

/**
 * Servlet implementation class WaringQueryService
 */
@WebServlet("/WaringQueryService")
public class WaringQueryService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaringQueryService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WaringDao dao=new WaringDao();
		response.setContentType("text/html;charset=UTF-8");
		List<HashMap<String,Object>> list=dao.queryWaring();
		JSONArray array = new JSONArray(list);
		System.out.println(list);
		response.getWriter().print(array.toString());
	}

}
