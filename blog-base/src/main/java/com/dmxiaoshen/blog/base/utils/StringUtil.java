package com.dmxiaoshen.blog.base.utils;

import java.util.UUID;

public class StringUtil {

	public static String getUUID(){
		UUID u = UUID.randomUUID();
		return u.toString().replaceAll("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println("04c3e57fa1c04ce6a5ee49262becb1aa".length());
		System.out.println(getUUID());
		System.out.println(getUUID().length());
	}
}
