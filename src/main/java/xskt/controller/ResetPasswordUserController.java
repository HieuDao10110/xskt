package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.context.HashPasswordContext;
import xskt.context.SendEmail;
import xskt.dao.ListAccountDAO;
import xskt.dao.ModifyAccountDAO;

import java.io.IOException;

/**
 * Servlet implementation class ResetPasswordUserController
 */
public class ResetPasswordUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordUserController() {
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
        String email = request.getParameter("email");
        String newEmail = "";
//        String pass = "";
        String role = "";
        String status = "";
        String name = "";
        String phone = "";
        
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        HashPasswordContext hashContext = new HashPasswordContext();
        SendEmail sendEmail = new SendEmail();
        
    	if(email == null) { email = "";}
 	
	    String kq = "failed";
	    
	    //CREATE NEW PASSWORD
	    //generate random account
	    String newPass = hashContext.generatePassword(8);//8 character
	    //hash pass
	    byte[] saltByte = hashContext.getSalt();
	    String saltString = hashContext.saltToString(saltByte);
	    String hashPass = hashContext.getSecurePassword(newPass, saltByte);
	    
	    //save new password to database and send new password to user
    	String arr[] = {email, hashPass, role, status, name, phone, saltString, newEmail}; 
    	String emailContent = "Your password has been reset!\nYour new password is: "+newPass;
	    try{
	    	ListAccountDAO listDAO = new ListAccountDAO();
	    	// check account existence, if account not exist return false => execute create account
    		if(listDAO.checkAccount(email)) {
    			int st = listDAO.getAccountPassword(email).getStatus();
    			//truowng hop reset lai tai khoan da xoa
    			if(st == 2) {
    				request.setAttribute("resetPass", "Reset password fail. Your account does not exist.");
    			}else {
    				//save new password to database
			    	kq = modifyDAO.updateAccount(arr);   	   
			        if(kq.equals("succes")) {
			        	//send new password to user
				    	kq = sendEmail.sendEmail(email, emailContent);
			        	request.setAttribute("resetPass", "Reset password succes. please check email.");
			        } else {
			        	request.setAttribute("resetPass", "Reset password fail. please try again.");
			        }
    			} 			
    		}else {
	        	request.setAttribute("resetPass", "Reset password fail. please try enter email again.");
	        }	    	        
        } catch(Exception e) {
        	e.printStackTrace();
        	kq = "false";
        }
        try{
        	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }	    				       	
    }
}
