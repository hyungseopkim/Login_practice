package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.utils.ArticleDAO;
import kh.web.utils.ArticleDTO;
import kh.web.utils.LoginDAO;
import kh.web.utils.LoginDTO;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf8");
			
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			
			LoginDAO ldao = new LoginDAO();
			ArticleDAO adao = new ArticleDAO();
			
			boolean isRedirect = true;
			String dst = null;
			
			if(command.equals("/Login.do")) {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				boolean result = ldao.isIdExist(id, password);

				if(result) {
					request.getSession().setAttribute("loginId",id);
					isRedirect = false;
					dst ="login.jsp";
				}
				
				
				
			} else if (command.equals("/SignUp.do")) {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String name = request.getParameter("name");
				
				LoginDTO dto = new LoginDTO(0, id, password, name);
				int result = ldao.insertData(id, password, name);
				
				isRedirect = false;
				dst = "login.jsp";
				
				
			} else if (command.equals("/BoardList.do")) {
				List<ArticleDTO> result = adao.selectData();
				
				request.setAttribute("result", result);
				
				isRedirect = false;
				dst = "boardList.jsp";
			}
			
			if(isRedirect) {
				response.sendRedirect(dst);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
