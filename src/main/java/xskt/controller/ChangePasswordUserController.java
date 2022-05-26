package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.context.HashPasswordContext;
import xskt.dao.ListAccountDAO;
import xskt.dao.ModifyAccountDAO;
import xskt.model.Account;

import java.io.IOException;

/**
 * Servlet implementation class ChangePasswordUserController
 */
public class ChangePasswordUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordUserController() {
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
        String acc = request.getParameter("email");
        ListAccountDAO listDAO = new ListAccountDAO();
        // direct to update account JSP
        if(acc != null) {
        	request.setAttribute("account", listDAO.getAccount(acc));
        	request.setAttribute("searchHistory", listDAO.getSearchHistory2(acc));
            try{
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
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
        ListAccountDAO listDAO = new ListAccountDAO();
        HashPasswordContext hashContext = new HashPasswordContext();
        // execute update account
    	String email = request.getParameter("email");    	
    	String oldPass = request.getParameter("oldPass");;
    	String newPass = request.getParameter("newPass"); 
    	String confirmNewPass = request.getParameter("confirmNewPass");
    	String name = request.getParameter("name");       	
    	String phone = request.getParameter("phone");
    	if(email == null) { email = "";}
    	if(oldPass == null) { oldPass = "";}
    	if(newPass == null) { newPass = "";}
    	if(confirmNewPass == null) { confirmNewPass = "";}
    	if(name == null) { name = "";}
    	if(phone == null) { phone = "";}
    	   	
    	Account acc = new Account();
    	// check account existence, if account not exist return false => execute create account
    	if(listDAO.checkAccount(email)) {
    		if(!oldPass.isEmpty()) {	
	    		acc = listDAO.getAccountPassword(email);
	        	String salt = acc.getSalt();
	        	byte[] arr = hashContext.saltToByteArr(salt);
	        	//hash client pass
	        	String clientHassPass = hashContext.getSecurePassword(oldPass, arr);
	        	//check pass
	        	String pass = acc.getPwd();
	        	
	        	//if oldPass true check new pass
	        	if(pass.equals(clientHassPass)) {
	        		if(newPass.equals(confirmNewPass) && !newPass.isEmpty()) {
	        			//hash pass
	        	    	String regexPass = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$";
	        	    	
	        		    byte[] saltByte;
	        		    String saltString = "";
	        		    String hashPass = "";
	        		    if(newPass.matches(regexPass)){
	        		    	//hash pass
	        		    	saltByte = hashContext.getSalt();
	        		    	saltString = hashContext.saltToString(saltByte);
	        		    	hashPass = hashContext.getSecurePassword(newPass, saltByte);
	        		    	String arr1[] = {email, hashPass, "", "", name, phone, saltString, ""};
	        		    	//save to database
	        		    	String kq = "failed";
	        	    		kq = modifyDAO.updateAccount(arr1);
	        	    		if(kq.equals("succes")) {        	            	
	        	            	request.setAttribute("editProfile", "Change password successfully.");
	        	            } else {
	        	            	request.setAttribute("editProfile", "Password change failed, please try again.");
	        	            }
	        	    		try{
	        	            	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
	        	                rd.forward(request, response);
	        	            } catch(Exception e) {
	        	            	e.printStackTrace();
	        	            }
	        		    }
		    		}
	        	}else {
	        		request.setAttribute("oldPass", "incorrect");
	        		try{
	                	RequestDispatcher rd = request.getRequestDispatcher("ChangePassword?email="+email);
	                    rd.forward(request, response);
	                } catch(Exception e) {
	                	e.printStackTrace();
	                }
	        	}
        	}
    		String arr2[] = {email, "", "", "", name, phone, "", ""};
	    	//save to database
	    	String kq = "failed";
    		kq = modifyDAO.updateAccount(arr2);
    		if(kq.equals("succes")) {        	            	
            	request.setAttribute("editProfile", "Change information successfully.");
            } else {
            	request.setAttribute("editProfile", "Information change failed, please try again.");
            }
    		try{
            	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
                rd.forward(request, response);
            } catch(Exception e) {
            	e.printStackTrace();
            }
        // something went wrong with account of this session
    	}else {
    		request.setAttribute("editProfile", "Something went wrong, please try login again.");
    		try{
            	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
                rd.forward(request, response);
            } catch(Exception e) {
            	e.printStackTrace();
            }
    	}    		        
        
    	// if all the above code is wrong
    	try{
        	RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
