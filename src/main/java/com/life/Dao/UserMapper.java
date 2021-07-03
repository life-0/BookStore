package com.life.Dao;

import com.life.POJO.Relationship;
import com.life.POJO.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    @Insert("insert into user( uuid, name, unit, occupation, pwd) values (#{UUID},#{name},#{unit},#{occupation},#{pwd})")
    int addUser(User user); //添加用户

    @Select("select * from user where UUID=#{UUID} ")
    User QueryUserByUUID(String UUID); //查询用户通过UUID

    User QueryUser(Map<String, Object> map); //登陆验证查询

    List<User> AllUsers();  //查看所有可以借书的人的表

    List<Relationship> QueryRelation(); //查看关系表的所有数据

    List<Relationship> QueryByUserID(int UserID); //通过UserID查看单个人的数据

    @Select("select count(*) from relationship where UserID=#{UserID} and Amount!=0")
    int ReturnEmptyRelationship(@Param("UserID") int UserID);//判断特定ID用户的8条数据是否全满

    int eligibility(int UserID); //借书资格查询

    int queryUserBookCount(int UserID); //查询用户已经借了多少本书

    int queryBooksDetail(int UserID, String BookName);  //查询指定借的书的数据

    int AddRelation(Relationship relationship);  //添加一条书籍关系表

    int lendBook(Map<String, Object> map); //借书操作_1

    void LUpdateAmount(Map<String, Object> map); //借书操作_2


    int ReturnBook(Map<String, Object> map);   //还书

}
