package com.life.AOP;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

/*
 *@Author life-0
 *@ClassName AnnotationLog
 *@Date 2021/7/04 15:10
 *@Description: TODO
 *               AOP切面
 */
@Aspect
public class AnnotationLog {
    @Before("execution(* com.life.Service.BooksServiceImpl.*(..))")
    public void BookBefore() {
        System.out.println ("======执行Book表SQL语句前======");
    }

    @After("execution(* com.life.Service.BooksServiceImpl.*(..))")
    public void BookAfter() {
        System.out.println ("======执行Book表SQL语句后======");
    }

    @Before("execution(* com.life.Service.UserServiceImpl.*(..))")
    public void UserBefore() {
        System.out.println ("======执行User表SQL语句前=====");
    }

    @After("execution(* com.life.Service.UserServiceImpl.*(..))")
    public void UserAfter() {
        System.out.println ("======执行User表SQL语句后=====");
    }

    //在环绕增强中,可以给定一个参数,代表要获取处理切入的点

}
