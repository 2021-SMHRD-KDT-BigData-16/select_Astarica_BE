package com.peachs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peachs.entity.AccountsInfo;
import com.peachs.mapper.AccountsInfoMapper;


@Controller
public class AccountsInfoController {
	@Autowired
	private AccountsInfoMapper mapper;
	
	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(Model model) {
		List<AccountsInfo> list = mapper.getLists();
		model.addAttribute("list", list);
		return "board/home"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}
}
