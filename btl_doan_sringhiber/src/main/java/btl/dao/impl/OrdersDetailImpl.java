package btl.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btl.dao.DaoAll;
import btl.entities.OrderDetail;
import btl.entities.Orders;

@Repository
public class OrdersDetailImpl implements DaoAll<OrderDetail>{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<OrderDetail> getAll() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<OrderDetail>  list = session.createQuery("from OrderDetail").list();
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
	public boolean insert(OrderDetail op) {
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
	public boolean updete(OrderDetail op) {
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
	public OrderDetail findByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(OrderDetail op) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public OrderDetail findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
