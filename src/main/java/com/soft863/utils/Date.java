package com.soft863.utils;

import java.text.SimpleDateFormat;

/**
 * @author lijunjie
 * @version 1.0
 * @date 2019/1/16 16:45
 */
public class Date {
    public static String date(){
        return new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
    }
}
