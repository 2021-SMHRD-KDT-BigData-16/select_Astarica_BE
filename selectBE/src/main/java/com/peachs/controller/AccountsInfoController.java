package com.peachs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peachs.entity.AccountsInfo;
import com.peachs.entity.Csv;
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
		return "board/login_register"; // flist.jsp --> 반환 값은 flist로 해야한다.
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
//		@GetMapping("/register") 
//		public String register() {
//			
//			return "board/register";
//		}
		
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
		public String mainpage(HttpSession session, Model model) {
			AccountsInfo user = (AccountsInfo)session.getAttribute("mvo");
			List<OriginDataInfo> works = o_mapper.getLists(user);
			model.addAttribute("works", works);
			return "board/mainpage";
		}
		@GetMapping("/dashboard") 
		public String dashboard(HttpSession session, Model model) {
			ArrayList<Csv> csv =  (ArrayList<Csv>)session.getAttribute("csv");
			model.addAttribute("csv", csv);
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
		
		@GetMapping("/test")
		public String test(HttpServletRequest request, HttpSession session)throws IOException, ParseException {
			String temp = request.getParameter("data");
			System.out.println(temp);
			JSONArray jsonArray = new JSONArray(temp);
			JSONObject element;
			ArrayList<Csv> contents = new ArrayList<Csv>();
			for(int i=0; i<jsonArray.length(); i++) {
				element = (JSONObject) jsonArray.opt(i);
				int path = element.getInt("imagePath");
				String test = Integer.toString(path)+".jpg";
				Csv csv = new Csv();
				csv.setImagePath(test);
				csv.setLabel((String)element.get("label"));
				csv.setPoint1_x(element.getInt("point1_x"));
				csv.setPoint1_y(element.getInt("point1_y"));
				csv.setPoint2_x(element.getInt("point2_x"));
				csv.setPoint2_y(element.getInt("point2_y"));
				csv.setImageHeight(element.getInt("imageHeight"));
				csv.setImageWidth(element.getInt("imageWidth"));
				csv.setShapeNum(element.getInt("Shape_num"));
				double ratio = element.getDouble("ratio");
				String ratio_temp = Double.toString(ratio);
				csv.setRatio(ratio_temp);
				double wide = element.getDouble("wide");
				String wide_temp = Double.toString(wide);
				csv.setWide(wide_temp);
				double bwide = element.getDouble("bwide");
				String bwide_temp = Double.toString(bwide);
				csv.setBwide(bwide_temp);
				contents.add(csv);
			}
			
			System.out.println(contents.size());
			for (int j=0; j<contents.size(); j++) {
				System.out.println(contents.get(j).getImagePath());
				System.out.println(contents.get(j).getLabel());
				System.out.println(contents.get(j).getPoint1_x());
				System.out.println(contents.get(j).getPoint1_y());
				System.out.println(contents.get(j).getPoint2_x());
				System.out.println(contents.get(j).getPoint2_y());
				System.out.println(contents.get(j).getShapeNum());
			
			}
			session.setAttribute("csv", contents);
	        return "board/dashboard";
		}

}
