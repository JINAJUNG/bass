package com.bass.test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bass.test.vo.StudentInfo;
import com.bass.test.vo.UserInfo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SqlSessionTest {


	@Autowired
	@Qualifier("dataSourceProxy")
	private DataSource ds;
	
	@Autowired
	private SqlSessionFactory ssf;
	
	@Autowired
	private SqlSession ss;
	
/*	@Test
	public void test() {
		try {
			Connection con = ds.getConnection();
			System.out.println("db접속 test완료");
		}catch (Exception e) {
			fail(e.getMessage());
		}
		
	}
	
	@Test
	public void ssfTest() {
		try(SqlSession ss = ssf.openSession()){
			System.out.println("Sql Session 생성 테스트 완료");
		}catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void selTest() {
		System.out.println(ss.selectOne("SQL.Student.selectStudentList"));
	}
	*/
	@Test
	public void test() {
		UserInfo ui = new UserInfo();
		assertEquals(7,ss.selectList("SQL.User.selectUserList").size());
		assertNotNull(ss.selectOne("SQL.User.selectUser"));

	/*	List<UserInfo> selectuserList = ss.selectList("SQL.User.selectUserInfo");

		assertNotEquals(selectuserList.size(), 1);*/
		fail("Not yet implemented");
	}

	}

