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

import cdu.dao.DustDao;

/**
 * Servlet implementation class oldnoise
 */
@WebServlet("/oldnoise")
public class oldnoise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public oldnoise() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DustDao dustDao = new DustDao();
		PrintWriter pw = response.getWriter();
		System.out.println("·çËÙ");
		String sql = "select collectionData  from  t_noise order by COLLECTIONTIME asc ";
		
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
