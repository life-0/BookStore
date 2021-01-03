package com.life.POJO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/*
 *@Author life-0
 *@ClassName Relationship
 *@Date 2020/7/5 11:09
 *@Description: TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias ("relationship")
public class Relationship {
    private int UserID; //用户账号
    private String BookName; //书名
    private String ISBN; //书的ISBN号
    private Date lend; //这本书的借出时间
    private Date back; //这本书的归还时间  (书籍归还时间统一默认: 2000-01-01 00:00:00)
    private int Amount; //书被借出的数量  (只有Amount大于0时,这条关系数据才会被证明有效)

}
