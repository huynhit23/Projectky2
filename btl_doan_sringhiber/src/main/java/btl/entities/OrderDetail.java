package btl.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {
	@Id
	@Column(name = "OrderDetailId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "ProdId", referencedColumnName = "Id")
	private Products proO;
	@ManyToOne
	@JoinColumn(name = "OrderId", referencedColumnName = "Id")
	private Orders order;
	
	@Column(name = "Quantity")
	private Integer quantity;
	@Column(name = "Price")
	private Float price;
	
	@Column(name = "Status")
	private Integer status;
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}
	

	public OrderDetail(Long id, Products proO, Orders order, Integer quantity, Float price, Integer status) {
		super();
		this.id = id;
		this.proO = proO;
		this.order = order;
		this.quantity = quantity;
		this.price = price;
		this.status = status;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Products getProO() {
		return proO;
	}

	public void setProO(Products proO) {
		this.proO = proO;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}


	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
