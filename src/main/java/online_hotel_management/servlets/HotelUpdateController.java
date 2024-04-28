package online_hotel_management.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Hotel;

@WebServlet("/hotelupdate")
public class HotelUpdateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse  resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
//		String name = req.getParameter("name");
//		Long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");
//		String email = req.getParameter("email");
		String password = req.getParameter("password");
		double price=Double.parseDouble(req.getParameter("price"));
		
		Hotel hotel = new Hotel();
		hotel.setHotelId(id);
//		hotel.setHotelName(name);
//		hotel.setHotelPhone(phone);
		hotel.setHotelLocation(address);
//		hotel.setHotelEmail(email);
		hotel.setHotelPassword(password);
		hotel.setRoomPrice(price);		
		
		HotelDAO dao = new HotelDAO();
		
		Hotel dbHotel=dao.findByHotelId(id);
		dbHotel.setHotelLocation(address);
		dbHotel.setHotelPassword(password);
		dbHotel.setRoomPrice(price);
		
		HttpSession session=req.getSession();
		
		session.setAttribute("hotelupdate", dbHotel);
		
		
		
		
		try {
			dao.updateHotel(id,hotel);
				req.getRequestDispatcher("ProfileHotel.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		

	}
}
