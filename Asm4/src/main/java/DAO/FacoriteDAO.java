package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import Utils.jpaUtils;
import model.Favorite;
import model.FavoriteReport;
import model.FavoriteUserReport;

public class FacoriteDAO extends AbstracEntityDao<Favorite> {

	static EntityManager em;
	static EntityTransaction trans;

	public FacoriteDAO() {
		super(Favorite.class);
	}

	public List<Favorite> findByUser(String userId) {
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		String hql = "select f from Favorite f where f.user.id =:userId";
		List<Favorite> list = null;
		try {
			TypedQuery<Favorite> query = em.createQuery(hql, Favorite.class);
			query.setParameter("userId", userId);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void deleteFavoriteByvideoId(String videoId, String videoUser) {
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		String hql = "select f from Favorite f where f.video.id =:videoId and f.user.id =:userId";
		try {
			TypedQuery<Favorite> query = em.createQuery(hql, Favorite.class);
			query.setParameter("videoId", videoId);
			query.setParameter("userId", videoUser);

			Favorite fa = query.getSingleResult();
			trans.begin();
			em.remove(fa);
			trans.commit();
			System.out.println("unlike success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

	}

	public List<FavoriteReport> reportFavoriteByVideo() {
		String jpql = "select new model.FavoriteReport(f.video.tiTile, count(f), min(f.likeDate),max(f.likeDate)) from Favorite f group by f.video.tiTile ";
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		List<FavoriteReport> list = null;
		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql,FavoriteReport.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro getReport");
			trans.rollback();
		}finally {
			em.close();
		}

		return list;
	}
	
	public List<FavoriteUserReport> reportUser(String videoId){
		String jpql = "select new model.FavoriteUserReport(f.user.id, f.user.fullname, f.user.email, f.likeDate) from Favorite f where f.video.id =:videoId";
		em = jpaUtils.getEntityManager();
		List<FavoriteUserReport> list = null;
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return list;
	}

}
