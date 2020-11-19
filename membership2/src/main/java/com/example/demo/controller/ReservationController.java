package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.ReservationDao;
import com.example.demo.vo.DepartmentVo;
import com.example.demo.vo.DoctorVo;

@Controller
public class ReservationController {

	@Autowired
	private ReservationDao dao;
	
	@GetMapping("/reservation")
	public void resForm() {
		
	}
	
	@GetMapping("/resDept")
	@ResponseBody
	public List<DepartmentVo> resDept(){
		List<DepartmentVo> list = dao.findAllDept();
		return list;
	}
	
	@PostMapping("/resDoc")
	@ResponseBody
	public List resDoc(@RequestParam HashMap map) {
//		System.out.println(map);
		List<DoctorVo> list = dao.findByNoDoc(map);
//		System.out.println(list);
		return list;
	}
}
