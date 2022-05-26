package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.context.SendEmail;
import xskt.dao.ListAccountDAO;
import xskt.dao.ModifyAccountDAO;
import xskt.model.Account;

import java.io.IOException;

/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("signUpForm.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
        String clientEmail = request.getParameter("email");
        String clientPass = request.getParameter("password");
        String clientConfirmPass = request.getParameter("confirmPass");
        String clientName = request.getParameter("name");
        String clientPhone = request.getParameter("phone");
        
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        ListAccountDAO listDAO = new ListAccountDAO();
        
    	if(clientEmail == null) { clientEmail = "";}
    	if(clientPass == null) { clientPass = "";}
    	if(clientConfirmPass == null) { clientConfirmPass = "";}
    	if(clientName == null) { clientName = "";}
    	if(clientPhone == null) { clientPhone = "";}
    	
    	Account	acc = new Account(clientEmail, clientPass, 0, 0, null, null, clientName, clientPhone);
    			
    	String arr[] = {clientEmail, clientPass, "0", "0", clientName, clientPhone};
    	
    	// check the validity of the account information to be created
    	if(acc.isValib()) {
    		// check account existence, if account not exist return false => execute create account
    		if(!listDAO.checkAccount(clientEmail)) {
	    		String kq = "failed";
	    		//check password and confirm password
	    		if(clientPass.equals(clientConfirmPass)) {
	    			kq = modifyDAO.createAccount(arr);
	    		}		
	            if(kq.equals("succes")) {
	            	// dieu huong den trang thong bao dang ky thanh cong va xac nhan email de hoan tat dang ky
	            	SendEmail sendEmail = new SendEmail();
	            	String url = "http://localhost:8080/xskt/Verify?e="+clientEmail;
	            	String emailContent = "Your account has been created!\nPlease confirm your email address:\n "+url;
	            	kq = sendEmail.sendEmail(clientEmail, emailContent);
	            	request.setAttribute("SignUpsucces", "Registration is successful, please check your email to confirm registration");
	            } else {
	            	//thong bao loi, vui long dang ky lai
	            	request.setAttribute("SignUpfailed", "There is something wrong. Please try to register again");
	            }
	            try{
	            	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
	                rd.forward(request, response);
	            } catch(Exception e) {
	            	e.printStackTrace();
	            }	    			
    		}else {
    			int st = listDAO.getAccountPassword(clientEmail).getStatus();
    			//truowng hop tao lai tai khoan da xoa
    			if(st == 2) {
    				String kq = "failed";
    	    		//check password and confirm password
    	    		if(clientPass.equals(clientConfirmPass)) {
    	    			kq = modifyDAO.reSignUp(clientEmail, clientConfirmPass);
    	    		}		
    	            if(kq.equals("succes")) {
    	            	// dieu huong den trang thong bao dang ky thanh cong va xac nhan email de hoan tat dang ky
    	            	SendEmail sendEmail = new SendEmail();
    	            	String url = "http://localhost:8080/xskt/Verify?e="+clientEmail;
    	            	String emailContent = "Your account has been created!\nPlease confirm your email address:\n "+url;
    	            	kq = sendEmail.sendEmail(clientEmail, emailContent);
    	            	request.setAttribute("SignUpsucces", "Registration is successful, please check your email to confirm registration");
    	            } else {
    	            	//thong bao loi, vui long dang ky lai
    	            	request.setAttribute("SignUpfailed", "There is something wrong. Please try to register again");
    	            }
    	            try{
    	            	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
    	                rd.forward(request, response);
    	            } catch(Exception e) {
    	            	e.printStackTrace();
    	            }
    			}else {
    				request.setAttribute("isExistEmail", "The account you are creating already exists, you can try logging in.");
	        		try{
	                	RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
	                    rd.forward(request, response);
	                } catch(Exception e) {
	                	e.printStackTrace();
	                }
    			}		   
    		}
    	}else {
    		request.setAttribute("isValid", "no");
    		try{
            	RequestDispatcher rd = request.getRequestDispatcher("signUpForm.jsp");
                rd.forward(request, response);
            } catch(Exception e) {
            	e.printStackTrace();
            }	    
    	}
    }
}
