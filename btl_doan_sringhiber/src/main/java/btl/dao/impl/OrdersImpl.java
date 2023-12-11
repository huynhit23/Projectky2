package btl.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btl.dao.DaoAll;
import btl.entities.Orders;
import btl.entities.Products;

@Repository
public class OrdersImpl implements DaoAll<Orders>{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Orders> getAll() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Orders>  list = session.createQuery("from Orders").list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public boolean insert(Orders op) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(op);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updete(Orders op) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(op);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}



	@Override
	public Orders findByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Orders op) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Orders findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
