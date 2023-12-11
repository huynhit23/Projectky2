package btl.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Products {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "Name")
	private String name;
	@Column(name = "Author")
	private String author;
	
	@Column(name = "Nha_cung_cap")
	private String nha_cung_cap;
	
	@Column(name = "Nha_xuat_ban")
	private String nha_xuat_ban;
	
	@Column(name = "Sets")
	private String sets;
	
	@ManyToOne
	@JoinColumn(name = "Category_id", referencedColumnName = "Id")
	private Categories catId;
	
	@Column(name = "Price")
	private Float price;
	
	@Column(name = "Sale_price")
	private Float salePrice;
	
	@Column(name = "Img")
	private String img;
	
	@Column(name = "Content")
	private String content;
	
	@Column(name = "Thong_tin")
	private String thong_tin;
	
	@Column(name = "Ngay_xuat_ban")
	private Date ngay_xuat_ban;
	
	@Column(name = "Status")
	private Integer status;
	
	
	public Products() {
		// TODO Auto-generated constructor stub
	}
	
	public Products(Long id, String name, String author, String nha_cung_cap, String nha_xuat_ban, String sets,
			Categories catId, Float price, Float salePrice, String img, String content, String thong_tin,
			Date ngay_xuat_ban, Integer status) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.nha_cung_cap = nha_cung_cap;
		this.nha_xuat_ban = nha_xuat_ban;
		this.sets = sets;
		this.catId = catId;
		this.price = price;
		this.salePrice = salePrice;
		this.img = img;
		this.content = content;
		this.thong_tin = thong_tin;
		this.ngay_xuat_ban = ngay_xuat_ban;
		this.status = status;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getNha_cung_cap() {
		return nha_cung_cap;
	}

	public void setNha_cung_cap(String nha_cung_cap) {
		this.nha_cung_cap = nha_cung_cap;
	}

	public String getNha_xuat_ban() {
		return nha_xuat_ban;
	}

	public void setNha_xuat_ban(String nha_xuat_ban) {
		this.nha_xuat_ban = nha_xuat_ban;
	}

	public String getSets() {
		return sets;
	}

	public void setSets(String sets) {
		this.sets = sets;
	}

	public Categories getCatId() {
		return catId;
	}

	public void setCatId(Categories catId) {
		this.catId = catId;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThong_tin() {
		return thong_tin;
	}

	public void setThong_tin(String thong_tin) {
		this.thong_tin = thong_tin;
	}

	public Date getNgay_xuat_ban() {
		return ngay_xuat_ban;
	}

	public void setNgay_xuat_ban(Date ngay_xuat_ban) {
		this.ngay_xuat_ban = ngay_xuat_ban;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
}
