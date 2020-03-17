package com.ccz.service;

import com.ccz.common.utils.Page;
import com.ccz.po.Log;

public interface LogService {
	// 通过查询系统日志
	public Page<Log> findLogList(int currPage);

	// 创建日志
	public int createLog(Log log);
}
