package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import xskt.dao.ListLotteryDAO;
import xskt.dao.ModifyAccountDAO;
import xskt.model.Lottery;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchTicketLotteryController
 */
@WebServlet("/SearchTicket")
public class SearchTicketLotteryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTicketLotteryController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String clientDate = request.getParameter("d");
        String clientProvice = request.getParameter("p");
        String clientNum = request.getParameter("n");
        
        //luu vao lich su do ve
        String clientAcc = request.getParameter("acc");
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        modifyDAO.addSearchHistory(clientAcc, clientProvice, clientNum, clientDate);
        //do xo so 
        ListLotteryDAO listDAO = new ListLotteryDAO();
        Lottery lot = new Lottery(listDAO.getLottery(clientProvice, clientDate));
        String kqxs = "";
        if(!lot.isEmpty()) {
        	kqxs ="" + lot.checkPrize(clientNum);
        	if(kqxs.isEmpty()) {
	        	request.setAttribute("searchTicketLos", clientNum);
	        	request.setAttribute("searchTicketDate", clientDate);
	        	request.setAttribute("searchTicketProvince", clientProvice);
	        }else {
	        	request.setAttribute("searchTicketWin", kqxs);
	        	request.setAttribute("searchTicketWinNum", clientNum);
	        	request.setAttribute("searchTicketDate", clientDate);
	        	request.setAttribute("searchTicketProvince", clientProvice);
	        }
        }else {
        	request.setAttribute("searchTicketFail", kqxs);
        }
        try{
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
