package com.bass.test.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bass.test.HomeController;

@ControllerAdvice
public class TestAdvice {
	private static final Logger logger = LoggerFactory.getLogger(TestAdvice.class);
	@ExceptionHandler(value=SQLException.class)
	public @ResponseBody ResponseEntity<String> errorHandle(SQLException se){
		logger.error("sql error =>{}",se);
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(se.getMessage());
	}
}
//ResponseEntity 전체 HTTP응답 상태코드,헤더 및 본문에 들어갈 내용 제어할 수 있다.
//HTTP 웹을 작동하게 하는 응용프로그램 
       //웹 브라우저와 웹 서버가 인터넷을 통해 서로 통신하는데 사용하는 프로토콜