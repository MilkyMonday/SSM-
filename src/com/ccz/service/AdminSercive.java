package com.ccz.service;

import com.ccz.po.Admin;

public interface AdminSercive {
	// 通过账号和密码查询管理员
	public Admin findAdmin(String adminName, String password);
}
