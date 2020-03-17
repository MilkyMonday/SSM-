package com.ccz.dao;

import com.ccz.po.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserDao {
	// 用户列表
	public List<User> selectUserList(@Param("user")User user,@Param("start")int start,@Param("rows")int rows);

	// 创建用户
	public int createUser(User user);

	// 通过id查询用户
	public User getUserById(Integer id);

	// 更新用户信息
	public int updateUser(User user);

	// 删除用户
	public int deleteUser(Integer id);

	// 总记录数
	public Integer selectUserListCount(@Param("user")User user);
}
