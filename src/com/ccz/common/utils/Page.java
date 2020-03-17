package com.ccz.common.utils;

import java.util.List;

public class Page<T> {

	private int currPage;// 当前页
	private int pageSize;// 每页显示的记录数
	private int totalCount;// 总记录数
	private int totalPage;// 总页数
	private List<T> lists; // 结果集

	public Page() {
	}

	public Page(int currPage, int pageSize, int totalCount, int totalPage, List<T> lists) {
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.lists = lists;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getLists() {
		return lists;
	}

	public void setLists(List<T> lists) {
		this.lists = lists;
	}
}
