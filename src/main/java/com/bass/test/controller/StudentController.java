package com.bass.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bass.test.service.StudentService;
import com.bass.test.vo.StudentInfo;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService ss;

	@RequestMapping( value="/studentPage", method=RequestMethod.GET)
	@ResponseBody
	public List<StudentInfo> getStudentList(@ModelAttribute StudentInfo si){
		return ss.getStudentList(si);
	}
}
