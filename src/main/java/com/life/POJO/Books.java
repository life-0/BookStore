package com.life.POJO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

/*
 *@Author life-0
 *@ClassName Books
 *@Date 2020/6/23 10:25
 *@Description: TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias ("books")
public class Books {
    private String  ISBN;   //书号UUID
    private String  name;   //书名
    private String  author; //作者名
    private String  press;  //出版社
    private int price;  //单本定价
    private String  introduction;   //内容简介
    private int  status; //书籍现存数量
    private String  classification; //书籍类别
    private int count;  //书籍数量
}
