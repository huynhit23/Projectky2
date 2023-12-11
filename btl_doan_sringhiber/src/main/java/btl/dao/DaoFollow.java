package btl.dao;

import java.util.List;

import btl.entities.Account;
import btl.entities.Follow;
import btl.entities.Products;

public interface DaoFollow {
	public List<Follow> getAll();
	public Follow getId(Long id);
	public List<Follow> getProId(Long proId);
	public List<Follow> getAccId(Account accId);
	public boolean insert(Follow op);
	public boolean updete(Follow op);
	public boolean delete(Long id);
}
