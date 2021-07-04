package com.life.Service;

import com.life.Dao.BooksMapper;
import com.life.POJO.Books;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 *@Author life-0
 *@ClassName BooksServiceImpl
 *@Date 2020/6/23 10:55
 *@Description: TODO
 */
@Service
public class BooksServiceImpl implements BooksService{

    private BooksMapper booksMapper;

    public void setBooksMapper(BooksMapper booksMapper) {
        this.booksMapper = booksMapper;
    }

    @Override
    public List<Books> ShowAllBooks() {
        return booksMapper.ShowAllBooks ();
    }

    @Override
    public List<Books> QueryBooks(String name) {
        return booksMapper.QueryBooks (name);
    }

    @Override
    public Books QueryBooksByISBN(String ISBN) {
        return booksMapper.QueryBooksByISBN (ISBN);
    }

    @Override
    public List<Books> QueryBooksByClassification(String classification) {
        return booksMapper.QueryBooksByClassification (classification);
    }

    @Override
    public int AddBooks(Books books) {

        return booksMapper.AddBooks (books);
    }

    @Override
    public int deleteBooksByISBN(String ISBN) {
        return booksMapper.deleteBooksByISBN (ISBN);
    }

    @Override
    public int updateBooks(Books books) {
        return booksMapper.updateBooks (books);
    }
}
