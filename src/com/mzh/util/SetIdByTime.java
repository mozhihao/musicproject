package com.mzh.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class SetIdByTime {
	//��������
	public static String setIdByTimeStampAndRandom(){
		SimpleDateFormat dateformatAll = new SimpleDateFormat("yyyyMMddHHmmss");// ���巵�ص����ڸ�ʽ
		Timestamp d = new Timestamp(System.currentTimeMillis());
		String time=String.valueOf(dateformatAll.format(d)); // Timpstamp���� �������ݿ�
		String id = time + getRandom();
		return id;
	}
	
	//���������
	public static int getRandom(){
		int random = (int) (Math.random()*100000);
		return random;
	}
}
