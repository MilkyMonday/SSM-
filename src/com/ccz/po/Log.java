package com.ccz.po;

import java.util.Date;

public class Log {
	private Integer id;
	private Date time;
	private String bewrite;

	public Log() {
	}

	public Log(Date time, String bewrite) {
		this.time = time;
		this.bewrite = bewrite;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getBewrite() {
		return bewrite;
	}

	public void setBewrite(String bewrite) {
		this.bewrite = bewrite;
	}
}
