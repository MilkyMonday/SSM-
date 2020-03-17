package com.ccz.service;

import com.ccz.common.utils.Page;
import com.ccz.po.User;

public interface UserService {
	// 查询用户列表
	public Page<User> findUserList(int currPage,String userName, String gender, String job, String userLevel);

	// 创建客户
	public int createUser(User user);

	// 通过id查询客户
	public User getUserById(Integer id);

	// 更新客户
	public int updateUser(User user);

	// 删除客户
	public int deleteUser(Integer id);
}
