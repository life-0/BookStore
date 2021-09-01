package com.life.Utils;

import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 *@Author life-0
 *@ClassName TimeConvert
 *@Date 2020/7/4 21:10
 *@Description: TODO 时间字符转换
 */
@Component
public class TimeConvert {
    //自定义时间
    public  Date definiteTime(String date) throws ParseException {
        DateFormat dFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        Date parse = dFormat.parse (date);
        return parse;
    }

    //时间格式转换
    public  String TimeFormat(Date date){
        String formatDate;
        //格式 24小时制：2016-07-06 09:39:58
        DateFormat dFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；
        formatDate = dFormat.format(date);
        return formatDate;
    }

    //计算时间差 单位: 天
    public  int TimeSub(Date lend, Date back){

        long lendTime = lend.getTime ();
        long backTime = back.getTime ();
        int day=(int)(backTime-lendTime)/( 30 * 24 * 60 * 60 * 1000);
        return day;

    }

}
