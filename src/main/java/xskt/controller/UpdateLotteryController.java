package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.dao.ListLotteryDAO;
import xskt.dao.ModifyLotteryDAO;

import java.io.IOException;

/**
 * Servlet implementation class UpdateLotteryController
 */
public class UpdateLotteryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLotteryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
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
        response.setContentType("text/html;charset=UTF-8");
        ListLotteryDAO listDAO = new ListLotteryDAO();
        ModifyLotteryDAO modifyDAO = new ModifyLotteryDAO();
        
        //for method get: direct to update account JSP
        String tinh1 = request.getParameter("tinh");
        String ngay1 = request.getParameter("ngay");
        if(tinh1 != null && ngay1 != null) {
        	request.setAttribute("lottery", listDAO.getLottery(tinh1, ngay1));
            try{
                RequestDispatcher rd = request.getRequestDispatcher("admin/updateLottery.jsp");
                rd.forward(request, response);
            } catch(Exception e) {
            	e.printStackTrace();
            }
        //for method post: execute update account
        } else {
        	String tinhDo = request.getParameter("lottery");
        	String ngay = request.getParameter("date");
        	String db = request.getParameter("gdb"); 
        	String g1 = request.getParameter("g1");
        	String g2 = request.getParameter("g2");
        	String g3 = request.getParameter("g3");
        	String g4 = request.getParameter("g4");
        	String g5 = request.getParameter("g5");
        	String g6 = request.getParameter("g6");
        	String g7 = request.getParameter("g7");
        	String g8 = request.getParameter("g8");
        	String email = request.getParameter("admin");
        	if(tinhDo.equals("hn") || tinhDo.equals("Ha Noi")) {
        		tinhDo = "Ha Noi";
        	}else if(tinhDo.equals("hcm") || tinhDo.equals("Tp Ho Chi Minh")) {
        		tinhDo = "Tp Ho Chi Minh";
        	}else if(tinhDo.equals("dn") || tinhDo.equals("Da Nang")) {
        		tinhDo = "Da Nang";
        	}else {
        		tinhDo = "";
        	}
        	if(ngay == null) { ngay = "";}
        	if(db == null) { db = "";}
        	if(g1 == null) { g1 = "";}
        	if(g2 == null) { g2 = "";}
        	if(g3 == null) { g3 = "";}
        	if(g4 == null) { g4 = "";}
        	if(g5 == null) { g5 = "";}
        	if(g6 == null) { g6 = "";}
        	if(g7 == null) { g7 = "";}
        	if(g8 == null) { g8 = "";}
        	if(email == null) { email = "";}
        	String arr[] = {tinhDo, ngay, db, g1, g2, g3, g4, g5, g6, g7, g8, email};
        	if(!email.isEmpty()) {
        		String kq = "failed";
        		kq = modifyDAO.updateLottery(arr);
                if(kq.equals("succes")) {
                	request.setAttribute("showToast", "Execution update lottery successful.");
                } else {
                	request.setAttribute("showToast", "Execution update lottery failed.");
                }
                try{
                	RequestDispatcher rd = request.getRequestDispatcher("ListLottery");
                    rd.forward(request, response);
                } catch(Exception e) {
                	e.printStackTrace();
                }
        	} else {
        		request.setAttribute("showToast", "Execution update lottery failed.");
        		try{
                	RequestDispatcher rd = request.getRequestDispatcher("ListLottery");
                    rd.forward(request, response);
                } catch(Exception e) {
                	e.printStackTrace();
                }
        	}      	
        }
    }
}
