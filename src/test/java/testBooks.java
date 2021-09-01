import com.life.POJO.Books;
import com.life.Service.BooksServiceImpl;
import com.life.Utils.IDUtils;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/*
 *@Author life-0
 *@ClassName testBooks
 *@Date 2020/6/23 11:02
 *@Description: TODO
 */
public class testBooks {
    @Test
    public void test_queryAll() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        BooksServiceImpl booksServiceImpl = context.getBean ("BooksServiceImpl", BooksServiceImpl.class);
        List<Books> books = booksServiceImpl.ShowAllBooks ();
        for (Books book : books) {
            System.out.println (book);
        }

    }

    @Test
    public void test_queryByName() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        BooksServiceImpl booksServiceImpl = context.getBean ("BooksServiceImpl", BooksServiceImpl.class);
        List<Books> books = booksServiceImpl.QueryBooks ("c");
        for (Books book : books) {
            System.out.println (book);
        }

    }

    @Test
    public void test_ADDBook() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        BooksServiceImpl booksServiceImpl = context.getBean ("BooksServiceImpl", BooksServiceImpl.class);
        //生产UUID工具类
        IDUtils idUtils = new IDUtils ();
        Books Book = new Books (idUtils.getRandomID (), "海贼王", "尾田荣一郎", "漫画出版社",
                20, "如何成为海贼王指南", 3, "漫画类", 3, "");
        int i = booksServiceImpl.AddBooks (Book);
        System.out.println (i);

        List<Books> books = booksServiceImpl.ShowAllBooks ();
        for (Books book : books) {
            System.out.println (book);

        }


    }

    @Test
    public void test_DeleteByName() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        BooksServiceImpl booksServiceImpl = context.getBean ("BooksServiceImpl", BooksServiceImpl.class);
        int i = booksServiceImpl.deleteBooksByISBN ("C++");
        System.out.println (i);
        List<Books> books = booksServiceImpl.ShowAllBooks ();
        for (Books book : books) {
            System.out.println (book);
        }
        /*
        Books(ISBN=f3e77c02045340919238f2fd2ed8416c, name=Python入门, author=周雪, press=天津出版社, price=99,
                introduction=学过的都说好, status=15, classification=科普类, count=15)
        */
    }
}
