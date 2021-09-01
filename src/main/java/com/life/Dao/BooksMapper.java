package com.life.Dao;

import com.life.POJO.Books;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface BooksMapper {
    List<Books> ShowAllBooks();

    List<Books> QueryBooks(String name);

    @Select("select * from books where ISBN = #{ISBN}")
    Books QueryBooksByISBN(@Param("ISBN") String ISBN);

    @Select("select * from books where classification = #{classification}")
    List<Books> QueryBooksByClassification(@Param("classification") String classification);

    int AddBooks(Books books);

    int deleteBooksByISBN(String ISBN);

    int updateBooks(Books books);

}
