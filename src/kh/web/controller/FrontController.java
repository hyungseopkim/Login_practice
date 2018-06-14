package kh.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.utils.LoginDAO;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf8");
			
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			
			LoginDAO ldao = new LoginDAO();
			
			boolean isRedirect = true;
			String dst = null;
			
			if(command.equals("/Login.do")) {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				boolean result = ldao.isIdExist(id, password);
				
				if(result) {
					request.getSession().setAttribute("loginId",id);
				}
				
			} else if (command.equals("/SignUp.do")) {
				
			} else if (command.equals("/BoardList.do")) {
				
			}
		} catch (Exception e) {
		}
		
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
