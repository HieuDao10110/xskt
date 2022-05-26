package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.dao.ListAccountDAO;
import xskt.dao.ModifyAccountDAO;
import xskt.model.Account;

import java.io.IOException;

/**
 * Servlet implementation class AddAccountController
 */
public class AddAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try{
        	RequestDispatcher rd = request.getRequestDispatcher("admin/addAccount.jsp");
            rd.forward(request, response);
        } catch(Exception e) {
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
        String email = request.getParameter("email");
        String pass = request.getParameter("pw");
        String confirmPass = request.getParameter("cpw");
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        String role = request.getParameter("role");
        String phone = request.getParameter("phone");
        
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        ListAccountDAO listDAO = new ListAccountDAO();
        
    	if(email == null) { email = "";}
    	if(pass == null) { pass = "";}
    	if(confirmPass == null) { pass = "";}
    	if(role == null) { role = "";}
    	if(!(role.equals("0") || role.equals("1"))) {
    		role = "";
    	}
    	if(status == null) { status = "";}
    	if(!(status.equals("0") || status.equals("1"))) {
    		status = "";
    	}
    	if(name == null) { name = "";}
    	if(phone == null) { phone = "";}
    	
    	Account acc = new Account(email, pass, 0, 0, null, null, name, phone);
    	String arr[] = {email, pass, role, status, name, phone};
    	
    	// check the validity of the account information to be created
    	if(acc.isValib()) {
    		// check account existence, if account not exist return false => execute create account
    		if(!listDAO.checkAccount(email)) {
	    		String kq = "failed";
	    		//check password and confirm password
	    		if(pass.equals(confirmPass)) {
	    			kq = modifyDAO.createAccount(arr);
	    		}		
	            if(kq.equals("succes")) {
	            	request.setAttribute("showToast", "Execution create account successful.");
	            } else {
	            	request.setAttribute("showToast", "Execution create account failed.");
	            }
	            try{
	            	RequestDispatcher rd = request.getRequestDispatcher("ListAccount");
	                rd.forward(request, response);
	            } catch(Exception e) {
	            	e.printStackTrace();
	            }	    			
    		}
    	}        	
    }
}
