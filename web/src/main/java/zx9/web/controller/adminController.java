package zx9.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import zx9.web.dao.UserDao;
import zx9.web.vo.UserVO;

@Controller
public class adminController {

	@Autowired
	UserDao udao;
	
@RequestMapping("userall")
public String userall(Model m) {
	
	List<UserVO>ul=udao.GetallUser();
	m.addAttribute("alluser", ul);
	return "/admin/admin_user";
}
@RequestMapping("chmod")
public String chmod(UserVO u,Model m) {
	udao.chmod(u);
String msg="변경되었습니다.";
m.addAttribute("msg",msg);
return "/admin/chmod_ok";
	
	//	return "redirect:/userall";
}
}
