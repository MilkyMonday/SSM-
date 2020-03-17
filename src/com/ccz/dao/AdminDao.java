package com.ccz.dao;

import org.apache.ibatis.annotations.Param;

import com.ccz.po.Admin;
public interface AdminDao {
	/**
	 * 通过账号和密码查询管理员
	 */
	public Admin findAdmin(@Param("adminName") String adminName, @Param("password") String password);

}
