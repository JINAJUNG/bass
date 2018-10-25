package com.bass.test.dao;

import java.util.List;

import com.bass.test.vo.UserInfo;

public interface UserDAO {

	public List<UserInfo> selectUserList(UserInfo ui);
	public Integer selectUser(Integer uiNum);
	public Integer insertUser(UserInfo ui);
	public Integer updateUser(UserInfo ui);
	public Integer deleteUser(Integer uiNum);
	
}
