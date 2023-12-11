package btl.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btl.dao.DaoAll;
import btl.dao.DaoFollow;
import btl.entities.Account;
import btl.entities.Follow;
import btl.entities.Products;

@Repository
public class FollowImpl implements DaoFollow{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Follow> getAll() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Follow>  list = session.createQuery("from Follow").list();
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
	public boolean insert(Follow op) {
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
	public boolean updete(Follow op) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public Follow getId(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Follow c = (Follow) session.createQuery("from Follow where id = :id").setParameter("id", id).uniqueResult();
			session.getTransaction().commit();
			return c;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}
	@Override
	public boolean delete(Long id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getId(id));
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
	public List<Follow> getProId(Long proId) {
		Session session = sessionFactory.openSession();
		try {
			
			List<Follow> list = session.createQuery("from Follow where proId.id = :proId").setParameter("proId", proId).list();
			
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
	public List<Follow> getAccId(Account accId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Follow> list = session.createQuery("from Follow where accId = :accId").setParameter("accId", accId).list();
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

}
