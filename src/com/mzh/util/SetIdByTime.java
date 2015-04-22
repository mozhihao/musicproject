package com.mzh.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class SetIdByTime {
	//生成主键
	public static String setIdByTimeStampAndRandom(){
		SimpleDateFormat dateformatAll = new SimpleDateFormat("yyyyMMddHHmmss");// 定义返回的日期格式
		Timestamp d = new Timestamp(System.currentTimeMillis());
		String time=String.valueOf(dateformatAll.format(d)); // Timpstamp类型 插入数据库
		String id = time + getRandom();
		return id;
	}
	
	//生成随机数
	public static int getRandom(){
		int random = (int) (Math.random()*100000);
		return random;
	}
}
