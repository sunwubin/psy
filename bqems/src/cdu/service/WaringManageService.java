package cdu.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cdu.bean.WaringBean;
import cdu.dao.WaringDao;

/**
 * Servlet implementation class WaringManageService
 */
@WebServlet("/WaringManageService")
public class WaringManageService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaringManageService() {
        super();
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
         String dustMax=request.getParameter("dustMax");
         String dustMin=request.getParameter("dustMin");
         String humidityMax=request.getParameter("humidityMax");
         String humidityMin=request.getParameter("humidityMin");
         String noiseMax=request.getParameter("noiseMax");
         String noiseMin=request.getParameter("noiseMin");
         String pressureMax=request.getParameter("pressureMax");
         String pressureMin=request.getParameter("pressureMin");
         String temperatureMax=request.getParameter("temperatureMax");
         String temperatureMin=request.getParameter("temperatureMin");
         System.out.println(noiseMax);
         
         
         WaringBean waringBean=new WaringBean();
         waringBean.setDustMax(dustMax);
         waringBean.setDustMin(dustMin);
         waringBean.setHumidityMax(humidityMax);
         waringBean.setHumidityMin(humidityMin);
         waringBean.setNoiseMax(noiseMax);
         waringBean.setNoiseMin(noiseMin);
         waringBean.setPressureMax(pressureMax);
         waringBean.setPressureMin(pressureMin);
         waringBean.setTemperatureMax(temperatureMax);
         waringBean.setTemperatureMin(temperatureMin);
         WaringDao dao=new WaringDao();
         dao.update(waringBean);
         response.sendRedirect("html/waringmanage.jsp");
         
	}

}
