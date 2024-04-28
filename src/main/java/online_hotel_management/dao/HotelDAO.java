package online_hotel_management.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import online_hotel_management.dto.Customer;
import online_hotel_management.dto.Hotel;

public class HotelDAO {

	public EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("onkar").createEntityManager();
	}

	public Hotel signUpHotel(Hotel hotel) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.persist(hotel);
		entityTransaction.commit();
		return hotel;
	}

	public String logInHotel(String hotelEmail) {
		EntityManager entityManager = getEntityManager();
		
		try {
			Query query = entityManager.createQuery("SELECT h.hotelPassword FROM Hotel h WHERE h.hotelEmail=?1");
			query.setParameter(1, hotelEmail);
			String password = (String) query.getSingleResult();
			
				return password;
		} catch (NoResultException e) {
			
				return null;
		}
		 
	}

	public Hotel findByHotelId(int hotelId) {
		EntityManager entityManager = getEntityManager();
		return entityManager.find(Hotel.class, hotelId);
	}

	public List<Hotel> findByHotelName(String hotelName) {
		EntityManager entityManager = getEntityManager();

		Query query = entityManager.createQuery("SELECT h FROM Hotel h WHERE h.hotelName = ?1");
		query.setParameter(1, hotelName);
		List<Hotel> list = query.getResultList();
		if (!list.isEmpty()) {
			return list;
		} else {
			return null;
		}
	}
	public List<Hotel> findAll(){
		EntityManager entityManager = getEntityManager();
		Query query=entityManager.createQuery("SELECT h FROM Hotel h");
		
		return query.getResultList();
	}
	public List<Hotel> findHotelByLoc(String hotelLoc) {
		EntityManager entityManager = getEntityManager();

		Query query = entityManager.createQuery("SELECT h FROM Hotel h WHERE h.hotelLocation = ?1");
		query.setParameter(1, hotelLoc);
		List<Hotel> list = query.getResultList();
		if (!list.isEmpty()) {
			return list;
		} else {
			return null;
		}
	}
	public Hotel findByEmail(String hotelEmail) {
		EntityManager entityManager=getEntityManager();
		Query query=entityManager.createQuery("SELECT h FROM Hotel h WHERE h.hotelEmail=?1");
		query.setParameter(1, hotelEmail);
		try {
			Hotel hotel=(Hotel) query.getSingleResult();
			return hotel;
			
		} catch (Exception e) {
			return null;
		}
		
	}

	public Hotel updateHotelPassword(String hotelEmail, String oldPass, String newPass) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Query query = entityManager.createQuery("SELECT h FROM Hotel h WHERE h.hotelEmail=?1");
		query.setParameter(1, hotelEmail);

		Hotel hotel = (Hotel) query.getSingleResult();
		if (hotel != null) {
			if (hotel.getHotelPassword().equals(oldPass)) {
				hotel.setHotelEmail(hotelEmail);
				hotel.setHotelPassword(newPass);
				entityTransaction.begin();
				entityManager.merge(hotel);
				entityTransaction.commit();
				return hotel;
			} else {
				System.out.println("Please Enter Valid Password");
				return hotel;
			}
		} else {
			System.out.println("Hotel Not Registered!");
			return null;
		}
	}

	public Hotel updateRoomPrice(int hotelId, double roomPrice) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Hotel hotel = entityManager.find(Hotel.class, hotelId);
		if (hotel != null) {
			hotel.setHotelId(hotelId);
			hotel.setRoomPrice(roomPrice);
			entityTransaction.begin();
			entityManager.merge(hotel);
			entityTransaction.commit();
			return hotel;
		} else {
			System.out.println("Invalid Hotel Id");
			return null;
		}
	}

	public Hotel updateTotalRooms(int hotelId, int newTotalRooms) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Hotel hotel = entityManager.find(Hotel.class, hotelId);
		if (hotel != null) {
			hotel.setHotelId(hotelId);
			hotel.setTotalRooms(newTotalRooms);
			entityTransaction.begin();
			entityManager.merge(hotel);
			entityTransaction.commit();
			return hotel;
		} else {
			System.out.println("Enter the valid Hotel ID!");
			return null;
		}
	}

	public Hotel updateAvailRoom(int hotelId, int newAvailRoom) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Hotel hotel = entityManager.find(Hotel.class, hotelId);
		if (hotel != null) {
			hotel.setHotelId(hotelId);
			hotel.setAvailRoom(newAvailRoom);
			entityTransaction.begin();
			entityManager.merge(hotel);
			entityTransaction.commit();
			return hotel;
		} else {
			System.out.println("Enter the valid Hotel ID!");
			return null;
		}
	}

	public Hotel updatePhone(int hotelId, long oldPhone, long newPhone) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Hotel hotel = entityManager.find(Hotel.class, hotelId);
		if (hotel != null) {
			long dbPhone = hotel.getHotelPhone();
			if (dbPhone == oldPhone) {
				hotel.setHotelId(hotelId);
				hotel.setHotelPhone(newPhone);
				entityTransaction.begin();
				entityManager.merge(hotel);
				entityTransaction.commit();
				return hotel;
			} else {
				System.out.println("Enter correct phone number!");
				return hotel;
			}
		} else {
			System.out.println("Enter correct Hotel ID!");
			return null;
		}
	}

	public Hotel deleteHotel(int hotelId) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Hotel hotel = entityManager.find(Hotel.class, hotelId);
		if (hotel != null) {
			entityTransaction.begin();
			entityManager.remove(hotel);
			entityTransaction.commit();
			return hotel;
		} else {
			System.out.println("Enter the correct Hotel ID!");
			return null;
		}
	}
	public void updateHotel(int id, Hotel hotel) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		Hotel dbHotel = entityManager.find(Hotel.class, id);

		if (dbHotel != null) {

			dbHotel.setRoomPrice(hotel.getRoomPrice());
			dbHotel.setHotelPassword(hotel.getHotelPassword());
			dbHotel.setHotelLocation(hotel.getHotelLocation());
			
			entityTransaction.begin();
			entityManager.merge(dbHotel);
			entityTransaction.commit();

		} else {

			System.out.println("Id not found!");

		}

	}
	public boolean checkEmail(String email) {
		EntityManager entityManager=getEntityManager();
		Query query = entityManager.createQuery("SELECT h.hotelEmail FROM Hotel h");
		List<String> emails=query.getResultList();
		
		for (String string : emails) {
			if (string.equals(email) ){
				return false;
			}
		}
		return true;
	}
	public boolean checkPhone(long phone) {
		EntityManager entityManager=getEntityManager();
		Query query = entityManager.createQuery("SELECT h.hotelPhone FROM Hotel h");
		List<Long> phones=query.getResultList();
		
		for (Long dbphone: phones) {
			if (dbphone==phone ){
				return false;
			}
		}
		return true;
	}
	
	public void updatePassword(Hotel dbHotel,String newPassword) {
		dbHotel.setHotelPassword(newPassword);
		EntityManager entityManager=getEntityManager();
		EntityTransaction transaction=entityManager.getTransaction();
		
		transaction.begin();
		entityManager.merge(dbHotel);
		transaction.commit();
	}

}
