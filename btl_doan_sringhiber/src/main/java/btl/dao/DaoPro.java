package btl.dao;

import java.util.List;

import btl.entities.Products;

public interface DaoPro{
	public List<Products> getAll();
	public List<Products> findByName(String name);
	public Products findById(Long proId);
	public List<Products> getSale();
	public List<Products> getFeatured();
	public List<Products> getNewProduct();
	public List<Products> getBestSellerList();
	public List<Products> getCatId(Integer catId);
	public List<Products> getSets(String sets);
	public boolean insertProduct(Products pro);
	public boolean deleteProduct(Long proId);
	public boolean updateProduct(Products pro);
}
