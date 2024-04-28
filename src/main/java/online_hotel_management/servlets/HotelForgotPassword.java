package online_hotel_management.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Hotel;
@WebServlet("/forgotHotelPassword")
public class HotelForgotPassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("newPassword");
		
		HotelDAO dao=new HotelDAO();
		
		Hotel dbHotel=dao.findByEmail(email);
		if (dbHotel!=null) {
			dao.updatePassword(dbHotel, password);
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("HotelRegisterLogin.jsp");
			dispatcher.forward(req, resp);
		}
		else {
			req.setAttribute("nohotel", "Not registered with given email");
			RequestDispatcher dispatcher=req.getRequestDispatcher("HotelForgot.jsp");
			dispatcher.forward(req, resp);
		}
	}

	

}
