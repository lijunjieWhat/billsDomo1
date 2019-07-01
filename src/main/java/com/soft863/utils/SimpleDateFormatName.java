package com.soft863.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author lijunjie
 * @version 1.0
 * @date 2019/1/10 21:37
 */
public class SimpleDateFormatName {

    public static String getDateName(String oldName){
        return (new Date().getTime()+"-"+new SimpleDateFormat("yyyyMMdd").format(new Date())+oldName);
    }

}
