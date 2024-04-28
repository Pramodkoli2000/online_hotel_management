package online_hotel_management.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import online_hotel_management.dao.HotelDAO;
import online_hotel_management.dto.Customer;
import online_hotel_management.dto.Hotel;

@WebServlet("/BookHotel")
public class BookHotelController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelLoc=req.getParameter("hotels");
		HotelDAO dao=new HotelDAO();
		List<Hotel> hotels=dao.findHotelByLoc(hotelLoc);
		

		HttpSession session=req.getSession();
		Customer sessionCustomer=(Customer) session.getAttribute("customersession");
		session.setAttribute("customersession", sessionCustomer);
		String notFound;
		if (hotels!=null) {
			session.setAttribute("hotels", hotels);
			notFound=null;
			session.setAttribute("notfound",notFound);
			
			
		}
		else {
			 notFound= "Hotels with given location not found";
			session.setAttribute("notfound",notFound);
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher("search hotels.jsp");
		dispatcher.forward(req, resp);
	}	
}
