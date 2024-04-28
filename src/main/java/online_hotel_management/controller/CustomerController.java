package online_hotel_management.controller;

import online_hotel_management.dao.CustomerDAO;
import online_hotel_management.dto.Customer;

public class CustomerController {
	public static void main(String[] args) {

		Customer customer = new Customer();

		customer.setCustomerName("pramod");
		customer.setCustomerPhone(8552865558l);
		customer.setAddress("pune");
		customer.setCustomerEmail("p@gmail.com");
		customer.setCustomerPassword("123");
		customer.setCustomerAadhar(1234567896541l);

		CustomerDAO dao = new CustomerDAO();
		// dao.saveCustomer(customer);
		// dao.findById(3);
		// dao.deleteCustomer(1);

		// customer.setAddress("Dhule");
		// dao.updateCustomer(3, customer) 	;

		// dao.loginCustomer("p@gmail.com", "123");
//	dao.updatePassword(3, "123", "456", customer);
//	dao.updateAddress(3, customer, "nashik");
		//dao.updatePhone(3, 8552865558l, 8552865555l, customer);
//		dao.bookRoom(6, 1, 20);
//		dao.cancelRoom(6, 1, 20);
		
		
		System.out.println(dao.findById(1));

	}
}
