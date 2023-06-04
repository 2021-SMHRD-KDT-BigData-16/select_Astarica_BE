package com.peachs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peachs.entity.AccountsInfo;
import com.peachs.mapper.AccountsInfoMapper;


@Controller
public class AccountsInfoController {
	@Autowired
	private AccountsInfoMapper mapper;
	//------------------------------------------------------FISRT PAGE---------------------------------------------------------//
	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(Model model) {
		List<AccountsInfo> list = mapper.getLists();
		model.addAttribute("list", list);
		return "board/login"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}
	//------------------------------------------------------LOGIN USER---------------------------------------------------------//
	@RequestMapping("/login")
	public String login(AccountsInfo mvo, HttpSession session) {
		AccountsInfo user = mapper.login(mvo);
		
		if (user != null) {
			session.setAttribute("mvo", user);
			return "board/main";
		}
		return "redirect:/login";
	}
	
	//------------------------------------------------------REGISTER USER---------------------------------------------------------//
		@GetMapping("/register") 
		public String register() {
			
			return "board/register";
		}
		
		@PostMapping("/register") 
		public String register(AccountsInfo mvo) {		
//			// 중복 체크
//			AccountsInfo existingUser = mapper.getUserByEmail(avo.getUser_id());
//			if (existingUser != null) {
//				// 이미 등록된 이메일 주소인 경우 사용자에게 안내 메시지를 제공하거나 적절한 조치를 취해야 함
//				return "redirect:/register?error=duplicate";
//			}
			
			mapper.register(mvo);
		
			return "redirect:/list"; 
		}
}
