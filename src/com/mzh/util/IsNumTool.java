package com.mzh.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class IsNumTool {
	public static Boolean checkString(String str){
		boolean result=str.matches("[0-9]+");
		System.out.println(result);
		return result;
	}
}
