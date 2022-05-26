package xskt.controller.fb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xskt.context.FBContext;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginWithFB
 */
public class LoginWithFB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginWithFB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		    
		if (code == null || code.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			FBContext fbConnection = new FBContext();
			String accessToken = fbConnection.getAccessToken(code);
			PrintWriter out = response.getWriter();
			response.setContentType("text/plain");
			out.write(accessToken);
//		    String accessToken = RestFB.getToken(code);
//		    User user = RestFB.getUserInfo(accessToken);
//		    request.setAttribute("id", user.getId());
//		    request.setAttribute("name", user.getName());
//		    RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
//		    dis.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
