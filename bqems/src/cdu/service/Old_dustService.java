package cdu.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;

import cdu.dao.DustDao;

/**
 * Servlet implementation class old_dustService
 */
@WebServlet("/old_dustService")
public class Old_dustService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Old_dustService() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DustDao dustDao = new DustDao();
		PrintWriter pw = response.getWriter();
		//System.out.println("Œ“¿¥¡À");
		String sql = "select collectionData  from  t_dust order by COLLECTIONTIME asc ";
		
		if (dustDao.query(sql).size() != 0) {
			List<HashMap<String, Object>> list = dustDao.query(sql);
			String datas = "";
			if (list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					datas += list.get(i).get("collectionData") + ",";
				}
			}

			datas = datas.substring(0, datas.length() - 1) ;
			
			pw.println(datas);
			
		} else {
			pw.println("0");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
