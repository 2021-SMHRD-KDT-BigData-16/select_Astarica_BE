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
import com.peachs.entity.OriginDataInfo;
import com.peachs.mapper.AccountsInfoMapper;
import com.peachs.mapper.OriginDataInfoMapper;


@Controller
public class AccountsInfoController {
	@Autowired
	private AccountsInfoMapper mapper;
	
	@Autowired
	private OriginDataInfoMapper o_mapper; // 원본 데이터 DB 연결 Mapper
	
	@RequestMapping("/") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String first() {
		return "board/login"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}
	//------------------------------------------------------FISRT PAGE---------------------------------------------------------//
	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(Model model) {
		List<AccountsInfo> list = mapper.getLists();
		model.addAttribute("list", list);
		return "board/mainpage"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}
	//------------------------------------------------------LOGIN USER---------------------------------------------------------//
	@RequestMapping("/login")
	public String login(AccountsInfo mvo, HttpSession session, Model model) {
		AccountsInfo user = mapper.login(mvo);
		if (user != null) {
			List<OriginDataInfo> works = o_mapper.getLists(mvo);
			session.setAttribute("mvo", user);
			model.addAttribute("works", works);
			return "board/mainpage";
		}
		return "redirect:/login";
	}
	//------------------------------------------------------LOGOUT USER---------------------------------------------------------//
		@RequestMapping("/logout")
		public String loginout(HttpSession session) {
			
			session.invalidate();
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
	
		@GetMapping("/mainpage") 
		public String mainpage() {
			
			return "board/mainpage";
		}
		@GetMapping("/dashboard") 
		public String dashboard() {
			
			return "board/dashboard";
		}
		@GetMapping("/analysis") 
		public String analysis() {
			
			return "board/analysis";
		}
		@GetMapping("/dashboard_model") 
		public String dashboard_model() {
			
			return "board/dashboard_model";
		}
		@GetMapping("/dashboard_label") 
		public String dashboard_label() {
			
			return "board/dashboard_label";
		}
		
}
