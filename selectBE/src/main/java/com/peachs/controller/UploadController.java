package com.peachs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.peachs.entity.AccountsInfo;
import com.peachs.entity.OriginDataInfo;
import com.peachs.mapper.OriginDataInfoMapper;

@Controller
public class UploadController {

	@Autowired
	public OriginDataInfoMapper o_mapper;
	@GetMapping("/upload")
	public void form() {}
	
	@PostMapping("/uploading")
	public String upload(@RequestParam("file") MultipartFile file, HttpSession session, Model model) {
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:/datazip";
		
//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//		
//		String uniqueName = uuids[0];
//		System.out.println("생성된 고유문자열" + uniqueName);
//		System.out.println("확장자명" + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		String filePath = uploadFolder+"/"+fileRealName;
		File saveFile = new File(filePath);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 로그인 한 회원 정보 가져오기
		AccountsInfo user= (AccountsInfo) session.getAttribute("mvo");
		OriginDataInfo data = new OriginDataInfo();
		data.setOd_name(fileRealName);
		data.setUser_id(user.getUser_id());
		data.setOd_path(filePath);
		o_mapper.insert(data);
		List<OriginDataInfo> works = o_mapper.getLists(user);
		model.addAttribute("works", works);
		return "board/mainpage";
	}
	
	@GetMapping("/download")
	public void download(HttpServletResponse response,HttpServletRequest request) throws Exception {
        try {
        	String path = request.getParameter("downpath"); // 경로에 접근할 때 역슬래시('\') 사용
        	
        	File file = new File(path);
        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	
        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
                byte[] buffer = new byte[1024];
                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                    out.write(buffer, 0, read);
                }
        } catch (Exception e) {
            throw new Exception("download error");
        }
    }
	
	
	
}