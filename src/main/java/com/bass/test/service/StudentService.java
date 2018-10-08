package com.bass.test.service;

import java.util.List;

import com.bass.test.vo.StudentInfo;

public interface StudentService {

	public List<StudentInfo> getStudentList(StudentInfo si);
	public StudentInfo getStudent(Integer stuNum);
	public Integer insertStudent(StudentInfo si);
	public Integer updateStudent(StudentInfo si);
	public Integer deleteStudent(Integer stuNum);
	
}
