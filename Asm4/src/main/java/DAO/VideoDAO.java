package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import Utils.jpaUtils;
import model.Video;

public class VideoDAO extends AbstracEntityDao<Video> {
	static EntityManager em;
	static EntityTransaction trans;

	public VideoDAO() {
		super(Video.class);
		// TODO Auto-generated constructor stub
	}


	
	public List<Video> findByPageAndTitle(String title,int page,int max){
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		int first = 0;
		first = (page - 1) * max;
		String jpql = "SELECT v FROM Video v where v.deleteVD = 0 and v.tiTile like CONCAT('%', :tiTile, '%')";
		TypedQuery<Video> querry = em.createQuery(jpql, Video.class);
		querry.setParameter("tiTile",title);
		querry.setFirstResult(first);
		querry.setMaxResults(max);
		List<Video> list = querry.getResultList();
		
		return list;
	}
	
	public List<Video> findByPage(String title,int page,int max){
		em = jpaUtils.getEntityManager();
		trans = em.getTransaction();
		int first = 0;
		first = (page - 1) * max;
		String jpql = "SELECT v FROM Video v where v.deleteVD = 0";
		TypedQuery<Video> querry = em.createQuery(jpql, Video.class);
		querry.setFirstResult(first);
		querry.setMaxResults(max);
		List<Video> list = querry.getResultList();
		
		return list;
	}
	
	public List<Video> findAllVideo(){
		em=jpaUtils.getEntityManager();
		trans=em.getTransaction();
		String jpql = "SELECT v FROM Video v where v.deleteVD = 0";
		TypedQuery<Video> querry = em.createQuery(jpql, Video.class);
		List<Video> list = querry.getResultList();
		return list;
	}

}
