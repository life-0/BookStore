package com.life.POJO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

/*
 *@Author life-0
 *@ClassName User
 *@Date 2020/7/5 11:03
 *@Description: TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias ("user")
public class User {
    private int id;	//用于登录的账号
    private String pwd; //用于登录的密码
    private String UUID; //作为用户的唯一标识,不可修改
    private String name; //用户姓名
    private String unit; //用户所在单位
    private String occupation; //用户的职业

    public User(String pwd,String UUID,String name,String unit,String occupation){
        this.pwd=pwd;
        this.UUID=UUID;
        this.name=name;
        this.unit=unit;
        this.occupation=occupation;
    }

}
