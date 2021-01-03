package com.life.Controller;

import com.life.POJO.Books;
import com.life.Service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletResponse;
import java.util.List;

/*
 *@Author life-0
 *@ClassName control
 *@Date 2020/6/24 8:54
 *@Description: TODO
 */
@Controller
public class Admin_control {
    //controller 调 Service
    @Autowired
    @Qualifier("BooksServiceImpl")
    private BooksService booksService;

    @RequestMapping("/AllBooks")
    public String queryBook(Model model){
        List<Books> books = booksService.ShowAllBooks ();
        model.addAttribute ("books",books);
        return "Admin/Home";
    }

    @RequestMapping("/QueryBook")
    public String queryBookByName(String name, String flag, Model model){
            List<Books> books = booksService.QueryBooks (name);
            model.addAttribute ("books",books);
        System.out.println ("name:"+name +"\nflag= "+flag);
        if (flag.equals ("admin"))
            return "Admin/Home";
        else
            return "/DetailBook";
    }

    @RequestMapping ("/QueryBookByClassification/{classification}")
    public String queryBookByCF(@PathVariable String classification, Model model){
        List<Books> books = booksService.QueryBooksByClassification (classification);
        model.addAttribute ("books", books);
        return "/DetailBook";
    }

    @RequestMapping("/ToAddBook")
    public String ToAddBook(){
        return "Admin/AddBook";
    }

    @RequestMapping("/AddBook")
    public String AddBook(Books book){
        System.out.println (book.toString ());
        booksService.AddBooks (book);
        return "redirect:/AllBooks";
    }

    @RequestMapping("/ToUpdateBook")
    public String ToUpdateBook(String ISBN,Model model){
        System.out.println (ISBN);
        Books book = booksService.QueryBooksByISBN (ISBN);
        System.out.println (book.toString ()+".....");
        model.addAttribute ("Book",book);
        return "Admin/UpdateBooks";
    }

    @RequestMapping("/UpdateBook")
    public String RenewBook(Books books){
        System.out.println (books.toString ());
        booksService.updateBooks (books);
        return "redirect:/AllBooks";
    }

    @RequestMapping("/DeleteBook/{ID}")
    public String DeleteBook(@PathVariable("ID") String ISBN){
        System.out.println (ISBN);
        booksService.deleteBooksByISBN (ISBN);
        return "redirect:/AllBooks";
    }
}
