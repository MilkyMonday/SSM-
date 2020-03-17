package com.ccz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ccz.common.utils.Page;
import com.ccz.dao.LogDao;
import com.ccz.po.Log;
import com.ccz.service.LogService;

@Service("logService")
@Transactional
public class LogServiceImpl implements LogService {
	@Autowired
	private LogDao logdao;

	@Override
	public Page<Log> findLogList(int currPage) {
		Page<Log> page = new Page<Log>();
		page.setCurrPage(currPage);
		page.setPageSize(10);
		int i = logdao.selectLogListCount();
		page.setTotalCount(i);
		page.setTotalPage((i % 10 == 0) ? i / 10 : i / 10 + 1);
		page.setLists(logdao.selectLogList((currPage - 1) * 10, 10));
		return page;
	}

	@Override
	public int createLog(Log log) {
		return logdao.createLog(log);
	}

}
