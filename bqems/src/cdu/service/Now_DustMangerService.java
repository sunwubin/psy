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
 * Servlet implementation class Now_Dust
 */
@WebServlet("/Now_Dust")
public class Now_DustMangerService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Now_DustMangerService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DustDao  dustDao = new DustDao();
		String sql="select collectionData  from  t_dust order by COLLECTIONTIME desc ";
		PrintWriter  pw = response.getWriter(); 
		if (dustDao.query(sql).size()!= 0) {
			List<HashMap<String, Object>> dustList =  dustDao.query(sql);
	        float ds =   Float.parseFloat(dustList.get(0).get("collectionData")+"");
	        pw.println(ds);
		}else {
			pw.println("0");
		}
        
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
