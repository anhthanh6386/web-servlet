package DAO;

import java.util.List;

//import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

import Utils.jpaUtils;

public abstract class AbstracEntityDao<T> {
	private Class<T> entityClass;
	
	public AbstracEntityDao(Class<T> cls){
		this.entityClass = cls;
	}
	static EntityManager em;
	static EntityTransaction trans;

	public Boolean insert(T entity) {
		boolean checkResult = false;
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(entity);
			trans.commit();
			checkResult = true;
			System.out.println("Thêm thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi thêm dữ liệu !");
			trans.rollback();
		} finally {
			em.close();
		}
		return checkResult;
	}

	public Boolean update(T entity) {
		Boolean checkResult = false;
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		try {
			trans.begin();
			em.merge(entity);
			trans.commit();
			checkResult = true;
			System.out.println("Cập nhật thành công ! ");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi cập nhật !");
			trans.rollback();
		} finally {
			em.close();	
		}
		return checkResult;
	}

	public Boolean delete(String id) {
		Boolean checkResult = false;
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		try {
			trans.begin();
			T entityTy = em.find(entityClass, id);
			em.remove(entityTy);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi xoá dữ liệu !");
			trans.rollback();
		} finally {
			em.close();
			
		}
		return checkResult;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<T> findAll() {
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			return em.createQuery(cq).getResultList();
		} finally {
			em.close();
		}

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<T> findAllPage(int page, int max) {
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		 int first=0;
		 first=(page-1)*max;
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			Query q = em.createQuery(cq);
				q.setFirstResult(first);
				q.setMaxResults(max);
			return q.getResultList();
		} finally {
			em.close();
		}
	}

	public T findById(String id) {
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		try {
			T entity = em.find(entityClass, id);
			return entity;
		} finally {
			em.close();
		}

	}

}
