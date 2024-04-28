package online_hotel_management.controller;

import java.util.ArrayList;
import java.util.List;

import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Hotel;

public class HotelController {

	public static void main(String[] args) {
		
		HotelDAO dao = new HotelDAO();
		
//		Hotel hotel = new Hotel();
//		hotel.setHotelName("Novotel");
//		hotel.setHotelLocation("Mumbai");
//		hotel.setHotelPhone(7845457845l);
//		hotel.setHotelEmail("novotel@gmail.com");
//		hotel.setHotelPassword("N123");
//		hotel.setTotalRooms(220);
//		hotel.setAvailRoom(150);
//		hotel.setRoomPrice(18000);
//		
//		dao.signUpHotel(hotel);
		
//		dao.updateHotelPassword("JWM@gmail.com", "JWM123", "J123");
//		System.out.println(dao.findByHotelId(1));
//		System.out.println(dao.updateRoomPrice(2, 20000));
//		System.out.println(dao.findByHotelName("Sukanta"));
//		System.out.println(dao.updateTotalRooms(2, 200));
//		System.out.println(dao.updateAvailRoom(2, 150));
//		System.out.println(dao.findHotelByLoc("Mumbai"));
//		System.out.println(dao.updatePhone(10, 9156431943l, 9988556699l));
		List<Hotel> hotels=dao.findHotelByLoc("Pune");
		System.out.println(hotels);
	}
}
