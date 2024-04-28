package online_hotel_management.servlets;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet("/bookingservlet")
public class BookingServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		int customerId = Integer.parseInt(req.getParameter("customerId"));
		int noOfRooms = Integer.parseInt(req.getParameter("noOfRooms"));

		CustomerDAO dao = new CustomerDAO();
		dao.bookRoom(hotelId, customerId, noOfRooms);
		Customer dbCustomer=dao.findById(customerId);
		HashMap<Integer, Integer> bookedHotels = dbCustomer.getBookedRoom();
		
			

		HotelDAO daoHotel=new HotelDAO();
		
			HashMap<Hotel, Integer> hotelRoomsMap = new HashMap<>();

			for (Map.Entry<Integer, Integer> entry : bookedHotels.entrySet()) {
				Integer hotelId1 = entry.getKey();
				Integer numberOfRooms = entry.getValue();

				Hotel hotel = daoHotel.findByHotelId(hotelId1);

				if (hotel != null) {
					hotelRoomsMap.put(hotel, numberOfRooms);
				} else {
					System.out.println("Hotel with ID " + hotelId + " not found.");
				}
			}
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("newbookedhotels", hotelRoomsMap);

			

		
		
		HttpSession session=req.getSession();
		session.setAttribute("bookedcustomer", dbCustomer);
		RequestDispatcher dispatcher = req.getRequestDispatcher("List of Hotel.jsp");
		dispatcher.forward(req, resp);
		

	}

}
