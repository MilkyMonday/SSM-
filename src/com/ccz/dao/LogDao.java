package com.ccz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccz.po.Log;

public interface LogDao {
	public List<Log> selectLogList(@Param("start") int start, @Param("rows") int rows);

	public int createLog(Log log);

	// 总记录数
	public Integer selectLogListCount();
}
