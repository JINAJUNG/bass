package com.bass.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bass.test.dao.UserDAO;
import com.bass.test.service.UserService;
import com.bass.test.vo.UserInfo;
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO udao;
	
	@Override
	public List<UserInfo> selectUserList(UserInfo ui) {
		// TODO Auto-generated method stub
		return udao.selectUserList(ui);
	}

	@Override
	public Integer selectUser(Integer uiNum) {
		// TODO Auto-generated method stub
		return udao.selectUser(uiNum);
	}

	@Override
	public Integer insertUser(UserInfo ui) {
		// TODO Auto-generated method stub
		return udao.insertUser(ui);
	}

	@Override
	public Integer updateUser(UserInfo ui) {
		// TODO Auto-generated method stub
		return udao.updateUser(ui);
	}

	@Override
	public Integer deleteUser(Integer uiNum) {
		// TODO Auto-generated method stub
		return udao.deleteUser(uiNum);
	}

}
