package online_hotel_management.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import online_hotel_management.dao.CustomerDAO;
import online_hotel_management.dto.Customer;
@WebServlet("/customerupdate")
public class CustomerUpdateController  extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse  resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
//		Long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");
//		String email = req.getParameter("email");
//		String password = req.getParameter("password");
//		Long aadhar=Long.parseLong(req.getParameter("aadhar"));
		
		Customer customer=new Customer();
		customer.setCustomerId(id);
		customer.setCustomerName(name);
//		customer.setCustomerPhone(phone);
		customer.setAddress(address);
//		customer.setCustomerEmail(email);
//		customer.setCustomerPassword(password);
//		customer.setCustomerAadhar(aadhar);
		
		CustomerDAO dao= new CustomerDAO();
		Customer dbCustomer=dao.findById(id);
		customer.setCustomerPassword(dbCustomer.getCustomerPassword());
		
		dbCustomer.setAddress(address);
		dbCustomer.setCustomerName(name);
//		dbCustomer.setCustomerPassword(password);
		
		HttpSession session=req.getSession();
		
		session.setAttribute("customerupdate", dbCustomer);
		
		
		try {
			dao.updateCustomer(id,customer);
				req.getRequestDispatcher("List of Hotel.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		

	}
}
