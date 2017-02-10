package cn.net.sinodata.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import cn.net.sinodata.dao.impl.UserDaoImpl;
import cn.net.sinodata.entity.User;
import cn.net.sinodata.service.AddService;

@Service("userServiceImpl")
@Scope("prototype")
public class UserServiceImpl implements AddService {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDaoImpl userDaoImpl;

	@Override
	public User addUser(String id, String username) {
		User user = new User();
		user.setId(id);
		
		user.setUsername(username);
		userDaoImpl.addUser(user);
		return user;
	}
}
