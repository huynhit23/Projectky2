package btl.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btl.dao.DaoPro;
import btl.entities.Products;

@Repository
public class DaoProImpl implements DaoPro{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Products> getAll() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products>  list = session.createQuery("from Products").list();
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
	public List<Products> findByName(String name) {
		Session session = sessionFactory.openSession();
		try {
			if(name==null || name.length()==0)
				name = "%";
			else
				name = "%"+name+"%";
			
			List<Products> list = session.createQuery("from Products where name like :name").setParameter("name", name).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Products findById(Long proId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Products c = (Products) session.createQuery("from Products where id = :proId").setParameter("proId", proId).uniqueResult();
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
	public List<Products> getSale() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products> list = session.createQuery("from Products where salePrice > 0").setMaxResults(6).getResultList();
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
	public List<Products> getFeatured() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products> list = session.createQuery("from Products where salePrice = 0").list();
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
	public List<Products> getNewProduct() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products> list = session.createQuery("from Products order by id desc").setMaxResults(6).getResultList();
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
	public List<Products> getBestSellerList() {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products> list = session.createQuery("from Products where catId = 1").setMaxResults(6).getResultList();
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
	public List<Products> getCatId(Integer catId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List<Products> list = session.createQuery("from Products where catId = :catId").setMaxResults(6).getResultList();
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
	public List<Products> getSets(String sets) {
		Session session = sessionFactory.openSession();
		try {
			List<Products> list = session.createQuery("from Products where sets like :sets").setParameter("sets", sets).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean deleteProduct(Long proId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(findById(proId));
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
	public boolean updateProduct(Products pro) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(pro);
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
	public boolean insertProduct(Products pro) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(pro);
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

	

}
