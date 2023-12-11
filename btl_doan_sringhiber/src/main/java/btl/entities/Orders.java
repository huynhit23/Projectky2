package btl.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "FullName")
	private String fullName;
	
	@ManyToOne
	@JoinColumn(name = "AcId", referencedColumnName = "Id")
	private Account acId;
	
	@Column(name = "OrderDate")
	private Date orderDate;
	
	@Column(name = "Address")
	private String address;
	
	@Column(name = "Phone")
	private String phone;
	@Column(name = "Email")
	private String email;
	
	@Column(name = "TotalPrice")
	private Float totalPrice;
	
	@Column(name = "Note")
	private String note;
	
	@Column(name = "Status")
	private Integer status;
	
	@OneToMany(mappedBy = "order")
	private Set<OrderDetail> orderDetail;
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

	

	public Orders(Long id, String fullName, Account acId, Date orderDate, String address, String phone, String email,
			Float totalPrice, String note, Integer status, Set<OrderDetail> orderDetail) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.acId = acId;
		this.orderDate = orderDate;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.totalPrice = totalPrice;
		this.note = note;
		this.status = status;
		this.orderDetail = orderDetail;
	}



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Account getAcId() {
		return acId;
	}

	public void setAcId(Account acId) {
		this.acId = acId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}



	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}
	
	 
}
