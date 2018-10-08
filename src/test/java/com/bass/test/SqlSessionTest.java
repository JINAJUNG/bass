package com.bass.test;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bass.test.vo.StudentInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SqlSessionTest {

	@Autowired
	private SqlSession ss;
	@Test
	public void test() {
		List<StudentInfo> l = ss.selectOne("SQL.BASSBALL.selectStudentList");
		System.out.println(l.size());
	}

}
