package com.bass.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.bass.test.dao.StudentDAO;
import com.bass.test.vo.StudentInfo;

public class StudentDAOImpl implements StudentDAO{

	@Autowired
	private SqlSession ss;
	@Override
	public List<StudentInfo> selectStudentList(StudentInfo si) {
		// TODO Auto-generated method stub
		return ss.selectList("SQL.Student.selectStudentList",si);
	}

	@Override
	public StudentInfo selectStudent(Integer stuNum) {
		// TODO Auto-generated method stub
		StudentInfo si = new StudentInfo();
		si.setStudent_num(stuNum);
		return ss.selectOne("SQL.Student.selectStudentList",si);
	}

	@Override
	public Integer insertStudent(StudentInfo si) {
		// TODO Auto-generated method stub
		return null;//ss.insert("SQL.Student.insertStudent",si);
	}

	@Override
	public Integer updateStudent(StudentInfo si) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteStudent(Integer stuNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
