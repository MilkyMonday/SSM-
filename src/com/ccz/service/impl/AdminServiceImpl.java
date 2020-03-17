package com.ccz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ccz.dao.AdminDao;
import com.ccz.po.Admin;
import com.ccz.service.AdminSercive;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminSercive {
	// 注入AdminDao
	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin findAdmin(String adminName, String password) {
		return adminDao.findAdmin(adminName, password);
	}

}
