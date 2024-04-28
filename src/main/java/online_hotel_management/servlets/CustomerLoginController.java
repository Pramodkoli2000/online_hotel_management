package online_hotel_management.servlets;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import online_hotel_management.dao.CustomerDAO;
import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Customer;
import online_hotel_management.dto.Hotel;

@WebServlet("/customerlogin")
public class CustomerLoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String customerEmail = req.getParameter("customer_email");
		String customerPassword = req.getParameter("customer_password");

		CustomerDAO dao = new CustomerDAO();
		String dbpassword = dao.loginCustomer(customerEmail);
		if (dbpassword != null) {
			if (dbpassword.equals(customerPassword)) {

				HttpSession httpSession = req.getSession();

				Customer dbCustomer = dao.findByEmail(customerEmail);
				httpSession.setAttribute("customersession", dbCustomer);

				
				HotelDAO hotelDao = new HotelDAO();
				List<Hotel> allHotels = hotelDao.findAll();
				httpSession.setAttribute("allHotels", allHotels);
				
				HashMap<Integer, Integer> bookedHotels = dbCustomer.getBookedRoom();
				if (bookedHotels != null) {
					

					HashMap<Hotel, Integer> hotelRoomsMap = new HashMap<>();

					for (Map.Entry<Integer, Integer> entry : bookedHotels.entrySet()) {
						Integer hotelId = entry.getKey();
						Integer numberOfRooms = entry.getValue();

						Hotel hotel = hotelDao.findByHotelId(hotelId);

						if (hotel != null) {
							hotelRoomsMap.put(hotel, numberOfRooms);
						} else {
							System.out.println("Hotel with ID " + hotelId + " not found.");
						}
					}
					httpSession.setAttribute("bookedhotels", hotelRoomsMap);

					

				} else {
					HashMap<Hotel, Integer> map = new HashMap<Hotel, Integer>();
					httpSession.setAttribute("bookedhotels", map);
				}
				 req.setAttribute("loginSuccess", true);

				RequestDispatcher dispatcher = req.getRequestDispatcher("List of Hotel.jsp");
				dispatcher.forward(req, resp);
			} else {
				req.setAttribute("message", "Invalid password");
				RequestDispatcher dispatcher = req.getRequestDispatcher("CustomerRegisterLogin.jsp");
				dispatcher.forward(req, resp);
			}

		} else {
			req.setAttribute("message", "User not registered");
			RequestDispatcher dispatcher = req.getRequestDispatcher("CustomerRegisterLogin.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
