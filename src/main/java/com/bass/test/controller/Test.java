package com.bass.test.controller;

public class Test {

	public static <T extends String> T getT(T t) {
		return t;
	}
	public static void main(String[] args) {
		String str = getT(new String("abc"));
		//Integer i = getT(new Integer(1));
	}
}
