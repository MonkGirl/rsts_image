package cn.net.sinodata.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.net.sinodata.entity.User;
import cn.net.sinodata.service.impl.UserServiceImpl;

@Controller("userController")
@Scope("prototype")
@RequestMapping("/user.do")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping(params="method=add")
	public String add(HttpServletRequest request, ModelMap modelMap) {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		User user = userServiceImpl.addUser(id, username);
	
		modelMap.addAttribute("flag", user!=null?"success":"fail");
		modelMap.addAttribute("user", user);
		return "/user/addUser";
	}
	
	@RequestMapping(params="method=index")
	public String index(HttpServletRequest request, ModelMap modelMap){
		return "index";
	}
}
