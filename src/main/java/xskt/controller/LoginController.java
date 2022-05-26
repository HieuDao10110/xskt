package xskt.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import xskt.context.HashPasswordContext;
import xskt.dao.ListAccountDAO;
import xskt.dao.ModifyAccountDAO;
import xskt.model.Account;

import java.io.IOException;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
        Cookie arr[] = request.getCookies();
        session.setAttribute("fillUser", "");
        if(arr != null) {
            for(Cookie c : arr) {
                if(c.getName().equals("user")) {
                    session.setAttribute("fillUser", c.getValue());
                }
            }
        }
        request.getRequestDispatcher("loginForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String clientRem = request.getParameter("remember");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60*60);//1 hours
        if(clientRem != null) {
        	//save cookie
            Cookie userC = new Cookie("user",clientEmail);
            //set time alive of cookie
            userC.setMaxAge(60*60*24);//1 ngay
            //add cookie to the browser
            response.addCookie(userC);
        }
        Account acc = new Account();
        
        ModifyAccountDAO modifyDAO = new ModifyAccountDAO();
        
        ListAccountDAO listDAO = new ListAccountDAO();
        HashPasswordContext hashContext = new HashPasswordContext();
        // check account, if exist then check pass
        if(listDAO.checkAccount(clientEmail)) {
        	acc = listDAO.getAccountPassword(clientEmail);
        	String salt = acc.getSalt();
        	byte[] arr = hashContext.saltToByteArr(salt);
        	//hash client pass
        	String clientHassPass = hashContext.getSecurePassword(clientPass, arr);
        	//check pass
        	String pass = acc.getPwd();
        	//if pass true check role
        	if(pass.equals(clientHassPass)) {
        		//check role
        		// role = 0 => user
        		if(acc.getRole() == 0) {
        			//check status(=1: da kich hoat tai khoan. =0: chua kich hoat tai khoan)
        			if(acc.getStatus() == 1) {
	        			session.setAttribute("userAccount", clientEmail);
	        			modifyDAO.setLoginDate(clientEmail);
	        			try{
	        	            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
	        	            rd.forward(request, response);
	        	        } catch(Exception e) {
	        	        	e.printStackTrace();
	        	        }
        			}else {
        				request.setAttribute("loginFail", "Your account not active or does not exist, please reset password or sign up again.");
	        			try{
	        	            RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
	        	            rd.forward(request, response);
	        	        } catch(Exception e) {
	        	        	e.printStackTrace();
	        	        }
        			}
        		// role = 1 => admin
        		}else if(acc.getRole() == 1) {       		
        			session.setAttribute("adminAccount", "1");
        			session.setAttribute("adminAccountName", clientEmail);
        			modifyDAO.setLoginDate(clientEmail);
        			try{
        	            RequestDispatcher rd = request.getRequestDispatcher("admin/index.jsp");
        	            rd.forward(request, response);
        	        } catch(Exception e) {
        	        	e.printStackTrace();
        	        }
        		// role = 2 => manager	
        		}else if(acc.getRole() == 2) {
        			session.setAttribute("adminAccount", "2");
        			session.setAttribute("adminAccountName", clientEmail);
        			modifyDAO.setLoginDate(clientEmail);
        			try{
        	            RequestDispatcher rd = request.getRequestDispatcher("admin/index.jsp");
        	            rd.forward(request, response);
        	        } catch(Exception e) {
        	        	e.printStackTrace();
        	        }
        		}
        	// if pass false redirect loginForm with notify wrong pass
        	}else {
        		request.setAttribute("wrong", "pass");
            	try{
    	            RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
    	            rd.forward(request, response);
    	        } catch(Exception e) {
    	        	e.printStackTrace();
    	        }
        	}
        // if account false redirect loginForm with notify wrong email
        } else {
        	request.setAttribute("wrong", "email");
        	try{
	            RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
	            rd.forward(request, response);
	        } catch(Exception e) {
	        	e.printStackTrace();
	        }
        } 
    }
}
