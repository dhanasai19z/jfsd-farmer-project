package com.klu.jfsd.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "product_table")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false, unique = true)
    private int id;

    @Column(name = "product_name", nullable = false, unique = false)
    private String name;

    @Column(name = "product_specification", nullable = false, unique = false)
    private String specification;

    @Column(name = "product_type", nullable = false, unique = false)
    private String type;

    @Column(name = "product_price", nullable = false, unique = false)
    private String price;

    @Column(name = "product_quantity", nullable = false, unique = false)
    private String quantity = "0";
    
    @Column(name = "producer_location", nullable = false, unique = false)
    private String location;

    @Column(name = "producer_contact", nullable = false, unique = false)
    private String contact;

    @Column(name = "product_Date", nullable = false, unique = false)
    private String Date;

    @Column(name = "product_image")
    private String image;

    @Column(name = "product_farmer_id", nullable = false)
    private Integer farmerId = -1 ;

    // Add a reference to the Farmer entity
   

    public int getFarmerId() {
		return farmerId;
	}

	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}
	
	

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	// Getters and setters
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

  
}
