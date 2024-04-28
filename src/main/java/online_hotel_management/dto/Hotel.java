package online_hotel_management.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Hotel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int hotelId;
	private String hotelName;
	private String hotelLocation;
	@Column(unique = true)
	private long hotelPhone;
	@Column(unique = true)
	private String hotelEmail;
	private String hotelPassword;
	private int totalRooms;
	private int availRoom;
	private double roomPrice;
}
