package com.bass.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bass.test.dao.UserDAO;
import com.bass.test.vo.UserInfo;

@Repository
public class UserDAOImpl implements UserDAO {
@Autowired
private SqlSession ss;

	@Override
	public List<UserInfo> selectUserList(UserInfo ui) {
		// TODO Auto-generated method stub
		return ss.selectList("SQL.User.selectUserList", ui);
	}

	@Override
	public Integer selectUser(Integer uiNum) {
		// TODO Auto-generated method stub
		UserInfo ui = new UserInfo();
		ui.setUiNum(uiNum);
		return ss.selectOne("SQL.User.selectUser", ui);
	}

	@Override
	public Integer insertUser(UserInfo ui) {
		// TODO Auto-generated method stub
		return ss.insert("SQL.User.insertUser", ui);
	}

	@Override
	public Integer updateUser(UserInfo ui) {
		// TODO Auto-generated method stub
		return ss.update("SQL.User.updateUser", ui);
	}

	@Override
	public Integer deleteUser(Integer uiNum) {
		// TODO Auto-generated method stub
		
		return ss.delete("SQL.User.deleteUser", uiNum);
	}

}
