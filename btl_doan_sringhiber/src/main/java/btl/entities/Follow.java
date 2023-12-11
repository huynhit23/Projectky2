package btl.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Follow")
public class Follow {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "ProID", referencedColumnName = "Id")
	private Products proId;
	
	@ManyToOne
	@JoinColumn(name = "AccId", referencedColumnName = "Id")
	private Account accId;
	
	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(Long id, Products proId, Account acId) {
		super();
		this.id = id;
		this.proId = proId;
		this.accId = acId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Products getProId() {
		return proId;
	}

	public void setProId(Products proId) {
		this.proId = proId;
	}

	public Account getAccId() {
		return accId;
	}

	public void setAccId(Account accId) {
		this.accId = accId;
	}
	 
	
	
}
