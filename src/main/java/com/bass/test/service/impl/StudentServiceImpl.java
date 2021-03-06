package com.bass.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bass.test.dao.StudentDAO;
import com.bass.test.service.StudentService;
import com.bass.test.vo.StudentInfo;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDAO sdao;
	@Override
	public List<StudentInfo> getStudentList(StudentInfo si) {
		// TODO Auto-generated method stub
		return sdao.selectStudentList(si);
	}

	@Override
	public StudentInfo getStudent(Integer stuNum) {
		// TODO Auto-generated method stub
		return sdao.selectStudent(stuNum);
	}

	@Override
	public Integer insertStudent(StudentInfo si) {
		// TODO Auto-generated method stub
		return sdao.insertStudent(si);
	}

	@Override
	public Integer updateStudent(StudentInfo si) {
		// TODO Auto-generated method stub
		return sdao.updateStudent(si);
	}

	@Override
	public Integer deleteStudent(Integer stuNum) {
		// TODO Auto-generated method stub
		return sdao.deleteStudent(stuNum);
	}

	@Override
	public Integer updateStudenterror(StudentInfo si) {
		int cnt = sdao.updateStudent(si);
		System.out.println(getStudent(si.getStudent_num()));
		cnt = sdao.updateStudenterror(si);
		return cnt;
	}

	@Override
	public Integer getstudent_num() {
		// TODO Auto-generated method stub
		return sdao.getstudent_num();
	}

}
