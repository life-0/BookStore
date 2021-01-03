package com.life.Utils;

import java.util.UUID;

/*
 *@Author life-0
 *@ClassName IDUtils
 *@Date 2020/6/24 8:39
 *@Description: TODO
 */
public class IDUtils {
    //生成随机ID 并将其中的-去掉
    public static String getRandomID(){
        return UUID.randomUUID ().toString ().replaceAll ("-","");
    }
}
