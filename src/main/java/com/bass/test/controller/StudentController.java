package com.bass.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bass.test.service.StudentService;
import com.bass.test.vo.StudentInfo;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService ss;

	@RequestMapping( value="/studentinfo", method=RequestMethod.GET)
	@ResponseBody
	public List<StudentInfo> getStudentList(String keyword){
		StudentInfo si = new StudentInfo();
		si.setStudent_major(keyword);
		return ss.getStudentList(si);
	}
	
	@RequestMapping( value="/studentinfo/insert", method=RequestMethod.GET)
	public String getStudentList(){
		return "studentinfo/insert";
	}
	
	
	@RequestMapping(value="/studentinfo/{studentv}",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView getStudent(@PathVariable Integer studentv, ModelAndView m) {
			m.setViewName("/studentinfo/view");
			m.addObject("student", ss.getStudent(studentv));
			return m;
	}

	
	@RequestMapping(value="/studentinfo",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertStudent(@RequestBody StudentInfo si) {
		
		return ss.insertStudent(si);
	}
	
	@RequestMapping(value="/studentinfo/{studentnum}",method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateStudent(@RequestBody StudentInfo si,@PathVariable Integer studentnum) {
		si.setStudent_num(studentnum);
		return ss.updateStudent(si);
	}
	
	@RequestMapping(value="/studentinfo/{studentnum}",method=RequestMethod.DELETE)
	@ResponseBody
	public Integer deleteStudent(@PathVariable Integer studentnum) {
		return ss.deleteStudent(studentnum);
	}
	@RequestMapping(value="/studentinfoerror/{studentnum}",method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateStudenterror(@RequestBody StudentInfo si,@PathVariable Integer studentnum) {
		si.setStudent_num(studentnum);
		return ss.updateStudent(si);
	}
	
	
}
