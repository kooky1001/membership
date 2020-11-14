package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;
	
	//회원가입 페이지로 보내기
	@GetMapping("/insertMember")
	public ModelAndView insertForm() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	//회원등록을 위한 메소드
	@PostMapping("/insertMember")
	public ModelAndView insertSubmit(MemberVo m) {
		ModelAndView mav = new ModelAndView("redirect:/list");
//		ModelAndView mav = new ModelAndView();
//		System.out.println(m);
		int re = dao.insert(m);
		mav.addObject("re", re);
		return mav;
	}
	
	//회원 아이디 중복확인
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam HashMap map) {
		int n = dao.checkId(map);
		return n+"";
	}
	
	//주민번호 확인
	@GetMapping("/checkMember")
	public void checkForm() {
		
	}
	
	@PostMapping("/checkMember")
	public ModelAndView checkMember(MemberVo m) {
		ModelAndView mav = new ModelAndView("/insertMember");
		mav.addObject("m", m);
		return mav;
	}
	
	
	
	
	
	
	
	
	@GetMapping("/list")
	public void list() {
	}
}
