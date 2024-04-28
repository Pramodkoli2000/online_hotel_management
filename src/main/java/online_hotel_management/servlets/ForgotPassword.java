package online_hotel_management.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import online_hotel_management.dao.CustomerDAO;
import online_hotel_management.dto.Customer;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("newPassword");
		
		CustomerDAO dao=new CustomerDAO();
		
		Customer dbCustomer=dao.findByEmail(email);
		if (dbCustomer!=null) {
			dao.updatePassword(dbCustomer, password);
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("CustomerRegisterLogin.jsp");
			dispatcher.forward(req, resp);
		}
		else {
			req.setAttribute("nocustomer", "Not registered with given email");
			RequestDispatcher dispatcher=req.getRequestDispatcher("forgot.jsp");
			dispatcher.forward(req, resp);
		}
	}

	

}
