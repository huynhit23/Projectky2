package btl.dao;

import java.util.List;

import btl.entities.Categories;
public interface DaoCat {
	public  List<Categories> getCate();
	public Categories findByName(String username);
	public boolean insert(Categories op);
	public Categories getCategoriesById(Long id);
	public boolean updateCategories(Categories cat);
	public boolean deleteCategories(Long id);
}
