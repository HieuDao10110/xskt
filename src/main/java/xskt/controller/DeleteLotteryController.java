package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.dao.ModifyLotteryDAO;

import java.io.IOException;

/**
 * Servlet implementation class DeleteLotteryController
 */
public class DeleteLotteryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLotteryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		// delete lottery
		// get a string consisting of DATE and PROVINCE e.g "2022-12-30 Ha Noi"
		String kq = "failed";
        ModifyLotteryDAO dao = new ModifyLotteryDAO(); 
	    String[] paramValues = request.getParameterValues("deletemanylot");
	    if(paramValues != null) {
	        kq = dao.deleteManyLottery(paramValues);
        }
        
        if(kq.equals("succes")) {
        	request.setAttribute("showToast", "Execution delete lottery successful.");
        } else {
        	request.setAttribute("showToast", "Execution delete lottery failed.");
        }
       
        try{
            RequestDispatcher rd = request.getRequestDispatcher("ListLottery");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
