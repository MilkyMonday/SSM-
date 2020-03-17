package com.ccz.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ccz.common.utils.Page;
import com.ccz.dao.UserDao;
import com.ccz.po.User;
import com.ccz.service.UserService;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 声明DAO属性并注入
	@Autowired
	private UserDao userDao;

	@Override
	public Page<User> findUserList(int currPage, String userName, String gender, String job, String userLevel) {
		User user = new User();
		if (StringUtils.isNotBlank(userName)) {
			user.setUserName(userName);
		}
		// 判断客户信息来源
		if (StringUtils.isNotBlank(gender)) {
			user.setGender(gender);
		}
		// 判断客户所属行业
		if (StringUtils.isNotBlank(job)) {
			user.setJob(job);
		}
		// 判断客户级别
		if (StringUtils.isNotBlank(userLevel)) {
			user.setUserLevel(userLevel);
		}
		Page<User> pages = new Page<User>();
		pages.setCurrPage(currPage);
		pages.setPageSize(10);
		int i = userDao.selectUserListCount(user);
		pages.setTotalCount(i);
		pages.setTotalPage((i % 10 == 0) ? i / 10 : i / 10 + 1);
		pages.setLists(userDao.selectUserList(user,(currPage-1)*10,10));
		return pages;
	}

	@Override
	public int createUser(User user) {
		return userDao.createUser(user);
	}

	@Override
	public User getUserById(Integer id) {
		return userDao.getUserById(id);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}
}
