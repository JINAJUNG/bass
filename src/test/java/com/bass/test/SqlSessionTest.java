package com.bass.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SqlSessionTest {

	@Autowired
	private SqlSession ss;
	
	@Test
	public void test() {
		System.out.println(ss.selectOne("SQL.BASSBALL.selDate"));
	}

}
