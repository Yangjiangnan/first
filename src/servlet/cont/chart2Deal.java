package servlet.cont;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoimpl.dbDeal;

/**
 * Servlet implementation class chart2Deal
 */
@WebServlet("/chart2Deal")
public class chart2Deal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int data[]=new int[7];
		dbDeal up=new dbDeal();
		data=up.cusNum();
		request.setAttribute("data", data);
		request.getRequestDispatcher("/chart2.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
