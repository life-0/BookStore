package com.life.Utils;

import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/*
 *@Author life-0
 *@ClassName GetUserName
 *@Date 2020/7/12 17:35
 *@Description: TODO
 *               获得使用者的ID 也就是前端的username  无效值为<=0
 */
@Component
public class GetUserName {
    public int getCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies ();
        int judgment=0;
        //遍历查找到Username的ID值
        for (Cookie cookie : cookies) {
            if (cookie.getName ().equals ("username") ){
                //得到特定人的关系数据
                System.out.println (cookie.getName ()+": "+cookie.getValue ());
                judgment= Integer.parseInt (cookie.getValue ());
            }
        }
        if (judgment==0){
            return 0;
        }else {
            return judgment;
        }

    }
}
