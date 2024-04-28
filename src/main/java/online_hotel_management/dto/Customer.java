package online_hotel_management.dto;

import java.util.HashMap;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerId;

	private String customerName;
	@Column(unique = true)

	private long customerPhone;
	@Column(unique = true)

	private String customerEmail;

	private String customerPassword;

	private String address;

	private long customerAadhar;

	private HashMap<Integer, Integer> bookedRoom;
}
