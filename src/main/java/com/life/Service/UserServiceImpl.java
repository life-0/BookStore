package com.life.Service;

import com.life.Dao.UserMapper;
import com.life.POJO.Relationship;
import com.life.POJO.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 *@Author life-0
 *@ClassName UserService
 *@Date 2020/7/5 16:54
 *@Description: TODO
 */

public class UserServiceImpl implements UserService{

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User QueryUser(Map<String, Object> map) {
        return userMapper.QueryUser (map);
    }

    @Override
    public List<User> AllUsers() {
        return userMapper.AllUsers ();
    }

    @Override
    public List<Relationship> QueryRelation() {
        return userMapper.QueryRelation ();
    }

    @Override
    public List<Relationship> QueryByUserID(int UserID) {
        return userMapper.QueryByUserID (UserID);
    }

    @Override
    public int ReturnEmptyRelationship(int UserID) {
        return userMapper.ReturnEmptyRelationship (UserID);
    }

    @Override
    public int eligibility(int UserID) {
        return userMapper.eligibility (UserID);
    }

    @Override
    public int queryUserBookCount(int UserID) {
        return userMapper.queryUserBookCount (UserID);
    }

    @Override
    public int queryBooksDetail(int UserID, String BookName) {
        return userMapper.queryBooksDetail (UserID,BookName);
    }

    @Override
    public int AddRelation(Relationship relationship) {
        return userMapper.AddRelation (relationship);
    }

    @Override
    public int lendBook(Map<String, Object> map) {
        return userMapper.lendBook (map);
    }

    @Override
    public void LUpdateAmount(Map<String, Object> map) {
        userMapper.LUpdateAmount (map);
    }

    @Override
    public int ReturnBook(Map<String, Object> map) {
        return userMapper.ReturnBook (map);
    }
}
