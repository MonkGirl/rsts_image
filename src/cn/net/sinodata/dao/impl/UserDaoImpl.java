package cn.net.sinodata.dao.impl;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import cn.net.sinodata.entity.User;

public class UserDaoImpl{

	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	@Transactional
	public boolean addUser(User user) {
		
		User user1 = new User();
		user1.setId("0000000000001234");
		user1.setUsername("22223322222222222222222222222");
		System.out.println("hibernateTemplate================"+hibernateTemplate);
		hibernateTemplate.save(user1);
		
		User user2 = new User();
		user2.setId("111111100001234");
		user2.setUsername("22211111111111111111111111111111111111111111111111111111111122222");
		//hibernateTemplate.save(user2);
		return true;
	}
}
