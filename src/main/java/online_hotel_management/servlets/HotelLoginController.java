package online_hotel_management.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Hotel;

@WebServlet("/hotellogin")
public class HotelLoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelEmail = req.getParameter("hotel_email");
		String hotelPassword = req.getParameter("hotel_password");

		HotelDAO dao = new HotelDAO();
		String dbPassword = dao.logInHotel(hotelEmail);
		System.out.println(dbPassword);
		if (dbPassword != null) {
			if (dbPassword.equals(hotelPassword)) {

				HttpSession httpSession = req.getSession();

				Hotel dbHotel = dao.findByEmail(hotelEmail);
				httpSession.setAttribute("session", dbHotel);

				req.setAttribute("loginHotel", true);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("ProfileHotel.jsp");
				dispatcher.forward(req, resp);
				
			} else {
				req.setAttribute("message", "Invalid password");
				RequestDispatcher dispatcher = req.getRequestDispatcher("HotelRegisterLogin.jsp");
				dispatcher.forward(req, resp);
			}
		} else {
			req.setAttribute("message", "User not registered");
			RequestDispatcher dispatcher = req.getRequestDispatcher("HotelRegisterLogin.jsp");
			dispatcher.forward(req, resp);
		}

	}

}