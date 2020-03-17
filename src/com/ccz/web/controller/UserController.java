package com.ccz.web.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccz.common.utils.Page;
import com.ccz.po.User;
import com.ccz.service.UserService;

/**
 * 用户管理控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/list")
	public String list(@RequestParam(defaultValue="1")int currPage,String userName, String gender, String job, String userLevel,Model model) {
		Page<User> userList = userService.findUserList(currPage, userName, gender, job, userLevel);
		model.addAttribute("userList", userList);
		return "main";
	}

	/**
	 * 创建用户
	 */
	@RequestMapping("/user/create")
	@ResponseBody
	public String userCreate(User user) {
		user.setUpdateTime(new Date());
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = userService.createUser(user);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过id获取用户信息
	 */
	@RequestMapping("/user/getUserById")
	@ResponseBody
	public User getUserById(Integer id) {
		User user = userService.getUserById(id);
		return user;
	}

	/**
	 * 更新用户
	 */
	@RequestMapping("/user/update")
	@ResponseBody
	public String userUpdate(User user) {
		int rows = userService.updateUser(user);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除用户
	 */
	@RequestMapping("/user/delete")
	@ResponseBody
	public String userDelete(Integer id) {
		int rows = userService.deleteUser(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}
