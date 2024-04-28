package online_hotel_management.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
@WebServlet("/roomNumber")
public class RoomServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int noOfRooms=Integer.parseInt(req.getParameter("noOfRooms"));
//		String name=req.getParameter("hotelName");
//		double price=Double.parseDouble(req.getParameter("roomPrice"));
//		long phone=Long.parseLong(req.getParameter("hotelPhone"));
		HttpSession session=req.getSession();
		session.setAttribute("noOfRooms", noOfRooms);
		req.getRequestDispatcher("Checkout.jsp").forward(req, resp);
		
	}
}
