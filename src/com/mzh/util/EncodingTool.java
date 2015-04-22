package com.mzh.util;

import java.io.UnsupportedEncodingException;

public class EncodingTool {  
    public static String encodeStr(String str) {  
        try {  
            return new String(str.getBytes("ISO-8859-1"), "UTF-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
            return null;  
        }  
    }
    public static String encodeStrgbk(String str) {  
        try {  
            return new String(str.getBytes("ISO-8859-1"), "GBK");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
            return null;  
        }  
    }
}  