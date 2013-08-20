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

import cdu.dao.TemperatureDao;

/**
 * Servlet implementation class HumidityService
 */
@WebServlet("/HumidityService")
public class HumidityService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HumidityService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TemperatureDao temDao = new TemperatureDao();
		String sql="select collectionData  from  t_humidity order by collectionTime desc ";
		System.out.println("Êª¶È");
		PrintWriter  pw = response.getWriter(); 
		if (temDao.query(sql).size()!= 0) {
			List<HashMap<String, Object>> dustList =  temDao.query(sql);
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
		doGet(request, response);
	}

}
