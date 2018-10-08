package com.bass.test.dao;

import java.util.List;

import com.bass.test.vo.StudentInfo;

public interface StudentDAO {
	
	public List<StudentInfo> selectStudentList(StudentInfo si);
	public StudentInfo selectStudent(Integer stuNum);
	public Integer insertStudent(StudentInfo si);
	public Integer updateStudent(StudentInfo si);
	public Integer deleteStudent(Integer stuNum);
}
