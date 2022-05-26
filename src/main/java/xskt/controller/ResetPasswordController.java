package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.context.HashPasswordContext;
import xskt.context.SendEmail;
import xskt.dao.ModifyAccountDAO;

import java.io.IOException;

/**
 * Servlet implementation class ResetPasswordController
 */
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordController() {
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
	    	//save new password to database
	    	kq = modifyDAO.updateAccount(arr);   	   
	        if(kq.equals("succes")) {
	        	//send new password to user
		    	kq = sendEmail.sendEmail(email, emailContent);
	        	request.setAttribute("showToast", "Execution reset password successful.");
	        } else {
	        	request.setAttribute("showToast", "Execution reset password failed.");
	        }
	        
        } catch(Exception e) {
        	e.printStackTrace();
        	kq = "false";
        }
        try{
        	RequestDispatcher rd = request.getRequestDispatcher("ListAccount");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }	    				       	
    }
}
