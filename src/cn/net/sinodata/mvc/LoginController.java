package cn.net.sinodata.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.net.sinodata.utils.CommonLogger;

@Controller
@RequestMapping("/login.do")
public class LoginController {

	@RequestMapping
	public String login(HttpServletRequest request, ModelMap modelMap){
		CommonLogger.debug("login...");
		CommonLogger.debug("--------"+System.getProperty("webapp.root"));
		CommonLogger.info("1/0", new NullPointerException());
		return "login";
	}
}
