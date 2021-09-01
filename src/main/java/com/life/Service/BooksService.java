package com.life.Service;

import com.life.POJO.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BooksService {
    public List<Books> ShowAllBooks();

    public List<Books> QueryBooks(String name);

    Books QueryBooksByISBN(String ISBN);

    List<Books> QueryBooksByClassification(String classification);

    public int AddBooks(Books books);

    public int deleteBooksByISBN(String ISBN);

    public int updateBooks(Books books);
}
