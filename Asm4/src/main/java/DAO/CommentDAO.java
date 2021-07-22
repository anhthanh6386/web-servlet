package DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import Utils.jpaUtils;
import model.Comment;

public class CommentDAO extends AbstracEntityDao<Comment>{

	public CommentDAO() {
		super(Comment.class);
	}

	public List<Comment> findByIdVideo(String idVideo){
		em=jpaUtils.getEntityManager();
		trans=em.getTransaction();
		String jpql="select c from Comment c where idVideo=:id";
		TypedQuery<Comment> query=em.createQuery(jpql, Comment.class);
		query.setParameter("id", idVideo);
		query.setFirstResult(0);
		query.setMaxResults(100);
		List<Comment> list=query.getResultList();
		return list;
	}
	
}
