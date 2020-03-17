package com.ccz.web.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ccz.common.utils.Page;
import com.ccz.po.Log;
import com.ccz.service.LogService;


@Controller
public class LogController {
	@Autowired
	private LogService logService;
	
	@RequestMapping(value = "/log/list")
	public String logList(@RequestParam(defaultValue="1")int currPage,Model model) {
		Page<Log> logList = logService.findLogList(currPage);
		model.addAttribute("logList", logList);
		return "log";
	}
}
