package DAO;


import java.util.List;

import javax.persistence.TypedQuery;
import Utils.jpaUtils;
import model.User;

public class UserDAO extends AbstracEntityDao<User>{

	public UserDAO() {
		super(User.class);
	}

	
	public List<User> findByDeleteUS(){
		em =jpaUtils.getEntityManager();
		trans=em.getTransaction();
		String jpql="select u from User u where u.deleteUS=0";
		TypedQuery<User> query=em.createQuery(jpql,User.class);
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<User> list = query.getResultList();
		return list;
		
	}
	
	public List<User> findByPageAndUserName(String username,int page,int max){
		em=jpaUtils.getEntityManager();
		trans=em.getTransaction();
		int first = 0;
		first = (page - 1) * max;
		String jpql="select u from User u where u.deleteUS=0 and u.id like CONCAT('%', :username,'%')";
		TypedQuery<User> query=em.createQuery(jpql, User.class);
		query.setParameter("username", username);
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<User> list=query.getResultList();
		return list;
	}
	
}
