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
