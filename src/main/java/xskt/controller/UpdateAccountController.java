package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.dao.ModifyAccountDAO;
import xskt.context.HashPasswordContext;
import xskt.context.SendEmail;
import xskt.dao.ListAccountDAO;

import java.io.IOException;;

/**
 * Servlet implementation class UpdateAccountController
 */
public class UpdateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccountController() {
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
			processRequestRedirect(request, response);
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
			processRequestUpdate(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void processRequestRedirect(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acc = request.getParameter("acc");
        ListAccountDAO listDAO = new ListAccountDAO();
        // direct to update account JSP
        if(acc != null) {
        	request.setAttribute("account", listDAO.getAccount(acc));
        	request.setAttribute("searchHistory", listDAO.getSearchHistory(acc));
            try{
                RequestDispatcher rd = request.getRequestDispatcher("admin/updateAccount.jsp");
                rd.forward(request, response);
            } catch(Exception e) {
            	e.printStackTrace();
            }
        }       
    }
	
	protected void processRequestUpdate(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        SendEmail sendEmail = new SendEmail();
        HashPasswordContext hashContext = new HashPasswordContext();
        // execute update account
    	String email = request.getParameter("email");
    	String newEmail = request.getParameter("newEmail");
    	String pass = request.getParameter("pw");;
    	String role = request.getParameter("role"); 
    	String status = request.getParameter("status");
    	String name = request.getParameter("name");       	
    	String phone = request.getParameter("phone");
    	if(email == null) { email = "";}
    	if(newEmail == null) { newEmail = "";}
    	if(pass == null) { pass = "";}
    	//with 0=user, 1=admin, other=no change
    	if(role == null) { role = "";}
    	if(!(role.equals("0") || role.equals("1"))) {
    		role = "";
    	}  	
    	//with 0=user, 1=admin, other=no change
    	if(status == null) { status = "";}
    	if(!(status.equals("0") || status.equals("1"))) {
    		status = "";
    	}
    	if(name == null) { name = "";}
    	if(phone == null) { phone = "";}
    	//hash pass
    	String regexPass = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$";
    	
	    byte[] saltByte;
	    String saltString = "";
	    String hashPass = "";
	    if(pass.matches(regexPass)){
	    	saltByte = hashContext.getSalt();
	    	saltString = hashContext.saltToString(saltByte);
	    	hashPass = hashContext.getSecurePassword(pass, saltByte);
	    }	    
    	String arr[] = {email, hashPass, role, status, name, phone, saltString, newEmail};
    	if(!email.isEmpty()) {    		
    		String kq = "failed";
    		kq = modifyDAO.updateAccount(arr);
    		String emailContent = "Your password has been reset!\nYour new password is: "+pass;
            if(kq.equals("succes")) {
            	if(!hashPass.isEmpty()) {
            	//send new password to user
            	kq = sendEmail.sendEmail(email, emailContent);
            	}
            	request.setAttribute("showToast", "Execution update account successful.");
            } else {
            	request.setAttribute("showToast", "Execution update account failed.");
            }  
    	} 
    	try{
        	RequestDispatcher rd = request.getRequestDispatcher("ListAccount");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
