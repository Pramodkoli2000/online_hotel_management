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



@WebServlet("/hotelsignup")
public class HotelSignupController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelName=req.getParameter("hotel_name");
		long hotelPhone=Long.parseLong(req.getParameter("hotel_phone"));
		String hotelEmail=req.getParameter("hotel_email");
		String hotelPassword=req.getParameter("hotel_password");
		String hotelLocation=req.getParameter("hotel_location");
		int totalRooms=Integer.parseInt(req.getParameter("total_rooms"));
		int availRooms=Integer.parseInt(req.getParameter("avail_room"));
		double roomPrice=Double.parseDouble(req.getParameter("hotel_room_price"));
		
		HotelDAO dao= new HotelDAO();
		
		if (dao.checkEmail(hotelEmail)) {
			if (dao.checkPhone(hotelPhone)) {
				Hotel hotel=new Hotel();
				hotel.setHotelName(hotelName);
				hotel.setHotelPassword(hotelPassword);
				hotel.setHotelEmail(hotelEmail);
				hotel.setHotelPhone(hotelPhone);
				hotel.setHotelLocation(hotelLocation);
				hotel.setTotalRooms(totalRooms);
				hotel.setAvailRoom(availRooms);
				hotel.setRoomPrice(roomPrice);		
				
				dao.signUpHotel(hotel);
			}else {
				req.setAttribute("unique", "User already registered with the email");
			}
	} else {
		req.setAttribute("unique", "User already registered with the phone number");
	}
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("HotelRegisterLogin.jsp");
		dispatcher.forward(req, resp);
	}
}