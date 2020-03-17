package com.ccz.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ccz.po.Admin;
import com.ccz.service.AdminSercive;

@Controller
public class AdminController {
	// 依赖注入
	@Autowired
	private AdminSercive adminService;
	/**
	 * 管理员登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String adminName,String password, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询管理员
		Admin admin = adminService.findAdmin(adminName, password);
		if(admin != null){		
			// 将管理员对象添加到Session
			session.setAttribute("Admin_SESSION", admin);
			// 跳转到主页面
			return "redirect:user/list";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	/**
	 * 模拟其他类中跳转到管理员管理页面的方法
	 */
	@RequestMapping(value = "/toMain")
	public String toCustomer() {
	    return "main";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login";
	}
	/**
	 * 向管理员登陆页面跳转
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
}
