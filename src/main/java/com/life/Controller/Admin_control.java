package com.life.Controller;

import com.life.POJO.Books;
import com.life.Service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
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
    public String queryBook(Model model) {
        List<Books> books = booksService.ShowAllBooks ();
        model.addAttribute ("books", books);
        return "Admin/Home";
    }

    @RequestMapping("/QueryBook")
    public String queryBookByName(String name, String flag, Model model) {
        List<Books> books = booksService.QueryBooks (name);
        model.addAttribute ("books", books);
        System.out.println ("name:" + name + "\nflag= " + flag);
        if (flag.equals ("admin"))
            return "Admin/Home";
        else
            return "/DetailBook";
    }

    @RequestMapping("/QueryBookByClassification/{classification}")
    public String queryBookByCF(@PathVariable String classification, Model model) {
        List<Books> books = booksService.QueryBooksByClassification (classification);
        model.addAttribute ("books", books);
        return "/DetailBook";
    }

    @RequestMapping("/ToAddBook")
    public String ToAddBook() {
        return "Admin/AddBook";
    }

    @RequestMapping("/AddBook")
    public String AddBook(Books book) {
        System.out.println (book.toString ());
        booksService.AddBooks (book);
        return "redirect:/AllBooks";
    }

    @RequestMapping("/ToUpdateBook")
    public String ToUpdateBook(String ISBN, Model model) {
        System.out.println (ISBN);
        Books book = booksService.QueryBooksByISBN (ISBN);
        System.out.println (book.toString () + ".....");
        model.addAttribute ("Book", book);
        return "Admin/UpdateBooks";
    }

    @RequestMapping("/UpdateBook")
    public String RenewBook(Books books, @RequestParam("file") CommonsMultipartFile image_book,
                            HttpServletResponse response, HttpServletRequest request) throws IOException {
        System.out.println (books.toString ());
        if (image_book.isEmpty ()) {
            Cookie cookie = new Cookie ("file", "文件为空请重新上传文件!");
            response.addCookie (cookie);
        } else {
            //上传路径保存设置
            String path = request.getServletContext ().getRealPath ("/img");
            File realPath = new File (path);
            if (!realPath.exists ()) {
                realPath.mkdir ();
            }
            //上传文件地址
            System.out.println ("上传文件保存地址：" + realPath);

            //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
            image_book.transferTo (new File (realPath + "/" + image_book.getOriginalFilename ()));
            books.setImagePath (realPath + "/" + image_book.getOriginalFilename ());//添加文件图片路径
        }
        booksService.updateBooks (books);
        return "redirect:/AllBooks";
    }

    @RequestMapping("/DeleteBook/{ID}")
    public String DeleteBook(@PathVariable("ID") String ISBN) {
        System.out.println (ISBN);
        booksService.deleteBooksByISBN (ISBN);
        return "redirect:/AllBooks";
    }
}
