package btl.entities;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Account")
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Long id;
	@Column(name = "Username")
	@NotEmpty(message = "Tài khoản không được bỏ trống!")
	private String userName;
	@Column(name = "Email")
	@NotEmpty(message = "Email không được bỏ trống!")
	private String email;
	@Column(name = "Phone")
	@NotEmpty(message = "SĐT không được bỏ trống!")
	private String phone;
	@Column(name = "Password")
	@NotEmpty(message = "Mật khẩu không được bỏ trống!")
	private String password;
	@Column(name = "Fullname")
	@NotEmpty(message = "Tên bạn không được bỏ trống!")
	private String fullName;
	@Column(name = "Gender")
	@NotNull(message = "Giới tính không được bỏ trống")
	private Boolean gender;
	@Column(name = "Address")
	@NotEmpty(message = "Địa chỉ không được bỏ trống!")
	private String address;
	@Column(name = "Status", columnDefinition="boolean  default 'true'")
	private Boolean status;
	
	@OneToMany(mappedBy = "acId")
	private List<Orders> orderAccount;
	
	@OneToMany(mappedBy = "ac", fetch = FetchType.EAGER)
	private Set<Account_roles> acRoles;

	@OneToMany(mappedBy = "accId")
	private List<Follow> followAccount;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Account(Long id, @NotEmpty(message = "Tài khoản không được bỏ trống!") String userName,
			@NotEmpty(message = "Email không được bỏ trống!") String email,
			@NotEmpty(message = "SĐT không được bỏ trống!") String phone,
			@NotEmpty(message = "Mật khẩu không được bỏ trống!") String password,
			@NotEmpty(message = "Tên bạn không được bỏ trống!") String fullName,
			@NotNull(message = "Giới tính không được bỏ trống") Boolean gender,
			@NotEmpty(message = "Địa chỉ không được bỏ trống!") String address, Boolean status,
			List<Orders> orderAccount, Set<Account_roles> acRoles, List<Follow> follow) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.fullName = fullName;
		this.gender = gender;
		this.address = address;
		this.status = status;
		this.orderAccount = orderAccount;
		this.acRoles = acRoles;
		this.followAccount = follow;
	}


	public Boolean getStatus() {
		return status;
	}



	public void setStatus(Boolean status) {
		this.status = status;
	}



	public List<Follow> getFollowAccount() {
		return followAccount;
	}



	public void setFollowAccount(List<Follow> followAccount) {
		this.followAccount = followAccount;
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public Boolean getGender() {
		return gender;
	}


	public void setGender(Boolean gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Boolean getEnabled() {
		return status;
	}


	public void setEnabled(Boolean status) {
		this.status = status;
	}


	public List<Orders> getOrderAccount() {
		return orderAccount;
	}


	public void setOrderAccount(List<Orders> orderAccount) {
		this.orderAccount = orderAccount;
	}


	public Set<Account_roles> getAcRoles() {
		return acRoles;
	}


	public void setAcRoles(Set<Account_roles> acRoles) {
		this.acRoles = acRoles;
	}

	
	
}
