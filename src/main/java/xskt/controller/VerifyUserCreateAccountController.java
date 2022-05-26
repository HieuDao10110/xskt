package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import xskt.dao.ModifyAccountDAO;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerifyUserCreateAccountController
 */
@WebServlet("/Verify")
public class VerifyUserCreateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUserCreateAccountController() {
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
		String em = request.getParameter("e");
		ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
		String kq = modifyDAO.verifyAccount(em);
		request.setAttribute("Verify", kq);
		try{
			RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
			rd.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}	
}
