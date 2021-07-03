package com.life.Controller;

import com.life.POJO.Books;
import com.life.POJO.Relationship;
import com.life.POJO.User;
import com.life.Service.BooksService;
import com.life.Service.UserService;
import com.life.Utils.GetUserName;
import com.life.Utils.IDUtils;
import com.life.Utils.TimeConvert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.*;

/*
 *@Author life-0
 *@ClassName User_control
 *@Date 2020/7/5 10:57
 *@Description: TODO
 */
@Controller
public class User_control {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("BooksServiceImpl")
    private BooksService booksService;

    @RequestMapping({"/", "/index"})
    public String mo(){
        return "index";
    }
    @RequestMapping("/Login")
    public String toLogin(){
        return "/login";
    }
    @RequestMapping("/UserLogin")
    public String login( HttpServletResponse response, HttpServletRequest request)
            throws UnsupportedEncodingException {
        request.setCharacterEncoding ("utf-8");
        response.setContentType ("text/html;charset=utf-8");

        String id = request.getParameter ("ID");
        String pwd = request.getParameter ("pwd");
       /* String results = request.getParameter ("result");*/
        System.out.println ("ID: " + id + "\npwd: " + pwd);
        HashMap<String, Object> map = new HashMap<> ();
        map.put ("ID", id);
        map.put ("pwd", pwd);
        User user = userService.QueryUser (map);
        Cookie username = new Cookie ("username", id);
        Cookie value = new Cookie ("value", user.getName ());
        response.addCookie (username);
        response.addCookie (value);
        if (user != null) {
            return "forward:/index";
        }else {
            return "/login";
        }
    }

    /*用户注册*/
    @RequestMapping("/Register")
    public String toRegister() {
        return "/register";
    }

    @RequestMapping("/UserRegister")
    public String register(HttpServletResponse response, HttpServletRequest request)
            throws UnsupportedEncodingException {
        request.setCharacterEncoding ("utf-8");
        response.setContentType ("text/html;charset=utf-8");

        String name = request.getParameter ("name");
        String university = request.getParameter ("University");
        String role = request.getParameter ("occupation");
        String password = request.getParameter ("pwd");
        String uuid = IDUtils.getRandomID ();
        User user = new User (password, uuid, name, university, role);
        int flag = userService.addUser (user);  //添加成功返回值为1
        if (flag > 0) {
            User checked = userService.QueryUserByUUID (uuid);
            Cookie username = new Cookie ("username", String.valueOf (checked.getId ()));
            Cookie value = new Cookie ("value", checked.getName ());
            response.addCookie (username);
            response.addCookie (value);
            return "redirect:/UserLogin";
        }else {
            return "/Register";
        }


    }

    //查询用户关系表中的数据以及相应的书籍详细信息
    @RequestMapping("/User")
    public String UserHome(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies ();
        TimeConvert timeConvert = new TimeConvert ();
        Map<String, Object> bookDeadline = new HashMap<> ();   //查看每一本书是否超时
        List<Relationship> relationships = null;
        List<Books> books = null;
        int judgment = 0; //用于判断是否登录
        //遍历查找到Username的ID值
        for (Cookie cookie : cookies) {
            if (cookie.getName ().equals ("username")) {
                //得到特定人的关系数据
                System.out.println (cookie.getName () + ": " + cookie.getValue ());
                judgment = Integer.parseInt (cookie.getValue ());
                relationships = userService.QueryByUserID (Integer.parseInt (cookie.getValue ()));
            } else {
                continue;
            }
        }
        //如果找不到Username的ID则返回到登陆页面
        if (judgment == 0) {
            return "/login";
        }
        //成功登录
        else {
            for (Relationship relationship : relationships) {
                //检测是否超时
                int i = timeConvert.TimeSub (relationship.getLend (), new Date ());
                if (i > 0) {
                    bookDeadline.put (relationship.getBookName (), "已超时,请尽快归还!");
                }
                System.out.println (relationship.toString ());
            }

            model.addAttribute ("Relationships", relationships);
            model.addAttribute ("BookDeadLine", bookDeadline);

            return "/UserHome";
        }

    }

    //借书操作: 必须获得ISBN userID
    @RequestMapping("/borrowBook")
    public String borrowBook(HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException, UnsupportedEncodingException {
        request.setCharacterEncoding ("utf-8");
        response.setContentType ("text/html;charset=utf-8");
        Map<String, Object> Bookmap = new HashMap<> ();
        Map<String, Object> Usermap = new HashMap<> ();
        List<Relationship> relationships = null;
        String bookName = request.getParameter ("bookName");
        int UserID = 0;
        GetUserName getUserName = new GetUserName ();
        //判定此人是否已经登陆

        if (request.getParameter ("userID").equals ("")) {
            return "/login";
        } else {
            UserID = Integer.parseInt (request.getParameter ("userID"));
        }

//        int num = userService.eligibility (UserID);    //获得特定用户关系表中是否存在8条数据
//        int amount = userService.ReturnEmptyRelationship (UserID);//得到8条数据中amount为0的个数
        int bookCount = userService.queryUserBookCount (UserID);    //查看有多少书已经被此用户借去了
        System.out.println ("bookCount: " + bookCount);
        int SameBookCount = userService.queryBooksDetail (UserID, bookName);    //查看是否有已经借过的同样的书籍
        System.out.println ("SameBookCount: " + SameBookCount);

        //是否扩展单人的关系数据 最多8条信息
        if (SameBookCount == 0 && bookCount <= 8) {
            Relationship relationship = new Relationship (
                    Integer.parseInt (request.getParameter ("userID")),
                    request.getParameter ("bookName"),
                    request.getParameter ("ISBN"),
                    new Date (),
                    new TimeConvert ().definiteTime ("2000-01-01 00:00:00"),
                    Integer.parseInt (request.getParameter ("amount"))
            );
            userService.AddRelation (relationship);

            Bookmap.put ("status", request.getParameter ("amount"));
            Bookmap.put ("ISBN", request.getParameter ("ISBN"));
            userService.LUpdateAmount (Bookmap);

            relationships = userService.QueryByUserID (UserID);
            for (Relationship RE : relationships) {
                System.out.println (RE.toString ());
            }
            model.addAttribute ("Relationships", relationships);
            return "/UserHome";
        }
        //是否扩展单人的关系数据 最多8条信息    num == 8 && amount >= 0 && amount < 8
        else if (SameBookCount != 0 && bookCount <= 8) {   //如果有空处则 update
            Usermap.put ("UserID", request.getParameter ("userID"));
            Usermap.put ("BookName", request.getParameter ("bookName"));
            Usermap.put ("ISBN", request.getParameter ("ISBN"));
            Usermap.put ("lend", new Date ());
            Usermap.put ("Amount", Integer.parseInt (request.getParameter ("amount")));
            userService.lendBook (Usermap);

            Bookmap.put ("status", request.getParameter ("amount"));
            Bookmap.put ("ISBN", request.getParameter ("ISBN"));
            //修改书表
            userService.LUpdateAmount (Bookmap);
            relationships = userService.QueryByUserID (UserID);
            for (Relationship relationship : relationships) {
                System.out.println (relationship.toString ());
            }
            model.addAttribute ("Relationships", relationships);

            return "/UserHome";
        } else {   //否则返回一个错误值提示
            Cookie cookie = new Cookie ("LendBook", "false");   //检测是否借书成功 默认失败
            response.addCookie (cookie);
            return "forward:/index.jsp"; //跳转到原来的页面
        }


    }

    //还书操作
    @RequestMapping("/returnBook")
    public String returnBook(Relationship relationship, Model model) {
        Map<String, Object> map = new HashMap<> ();
        Iterator<Map.Entry<String, Object>> it = map.entrySet ().iterator ();
        while (it.hasNext ()) {
            Map.Entry<String, Object> entry = it.next ();
            System.out.println ("------------------------------------------------");
            System.out.println ("key = " + entry.getKey () + ", value = " + entry.getValue ());
        }
        map.put ("ISBN", relationship.getISBN ());
        map.put ("UserID", relationship.getUserID ());
        map.put ("Amount", 1);   //还书的数量钉死了,一本一本的换
        map.put ("back", new Date ());
        map.put ("status", 1);
        if (relationship.getUserID () == 0) {
            return "/login";
        } else {
            userService.ReturnBook (map);
        }
//        userService.ReturnBook (map);
        List<Relationship> relationships = userService.QueryByUserID (relationship.getUserID ());
        for (Relationship relationship1 : relationships) {
            System.out.println (relationship1);
        }
        model.addAttribute ("Relationships", relationships);
        return "/UserHome";
    }
}
