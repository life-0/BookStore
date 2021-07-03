import com.life.POJO.Relationship;
import com.life.POJO.User;
import com.life.Service.BooksServiceImpl;
import com.life.Service.UserServiceImpl;
import com.life.Utils.IDUtils;
import com.life.Utils.TimeConvert;
import lombok.SneakyThrows;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 *@Author life-0
 *@ClassName testUser
 *@Date 2020/7/5 17:03
 *@Description: TODO
 */
public class testUser {
    @Test
    public void addUser() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
//        System.out.println (IDUtils.getRandomID ().length ());
        User user = new User ("123", IDUtils.getRandomID (), "四十五i", "大学士", "学生");
        int i = userServiceImpl.addUser (user);

    }
    @Test
    public void QueryUserByUUID() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        User user = userServiceImpl.QueryUserByUUID ("7b105619bc4749d3aa0f934e8f7798da");
        System.out.println (user.toString ());

    }
    @Test
    public void AllUsers() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        List<User> lists = userServiceImpl.AllUsers ();
        for (User list : lists) {
            System.out.println (list);
        }
    }

    @Test
    public void QueryRelation() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        List<Relationship> relationships = userServiceImpl.QueryRelation ();
        for (Relationship relationship : relationships) {
            System.out.println (relationship);
        }
    }

    @Test
    public void QueryByUserID() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        List<Relationship> relationships = userServiceImpl.QueryByUserID (1);
        for (Relationship relationship : relationships) {
            System.out.println (relationship);
        }
    }

    @Test
    public void AddRelation() throws ParseException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        TimeConvert Convert = new TimeConvert ();
        Relationship relationship = new Relationship (1, "十万个为什么",
                "00c447ca92264b37b886e8ce34f78105", new Date (), null, 1);
        int i = userServiceImpl.AddRelation (relationship);
        /*
        0c69bf3124504b7f95d889e6d883af2e C++
        11f3fcca4cf04f6fbe43c83a15648faf 一拳超人
        26994419e68c498a9e69dc52190a8ce8 海贼王
        */
        List<Relationship> relationships = userServiceImpl.QueryByUserID (1);
        for (Relationship relationship1 : relationships) {
            System.out.println (relationship1);
        }
    }

    @Test
    public void eligibility() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        int eligibility = userServiceImpl.eligibility (1);
        System.out.println (eligibility);
    }

    @SneakyThrows
    @Test
    public void lendBook() {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);
        BooksServiceImpl booksServiceImpl = context.getBean ("BooksServiceImpl", BooksServiceImpl.class);
        TimeConvert convert = new TimeConvert ();
        Map<String, Object> Usermap = new HashMap<> ();
        //  BookName = #{BookName}, ISBN = #{ISBN}, lend = #{lend}, Amount = #{Amount}

        //  先查出来这个用户已经借走的书里有没有这本书
//        int count = userServiceImpl.queryBooksDetail (1, "书籍重复测试");
//        System.out.println (count);

        Usermap.put ("UserID", 1);
        Usermap.put ("BookName", "书籍重复测试");
        Usermap.put ("ISBN", "cfccb541104045bc96860fc2f2870605");
        Usermap.put ("lend", convert.definiteTime ("2020-7-5 18:00:00"));
        Usermap.put ("Amount", 1);
        userServiceImpl.lendBook (Usermap);


        Map<String, Object> Bookmap = new HashMap<> ();
        Bookmap.put ("status", 1);
        Bookmap.put ("ISBN", "cfccb541104045bc96860fc2f2870605");
        userServiceImpl.LUpdateAmount (Bookmap);

        List<Relationship> relationships = userServiceImpl.QueryByUserID (1);
        for (Relationship relationship : relationships) {
            System.out.println (relationship);
        }
    }

    @Test
    public void ReturnBook() {
        //还书 :必须知道书的ISBN号,用户的ID号 还书成功后Amount -1,back有时间-->
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext ("applicationContext.xml");
        UserServiceImpl userServiceImpl = context.getBean ("UserServiceImpl", UserServiceImpl.class);

        TimeConvert convert = new TimeConvert ();

        Map<String, Object> map = new HashMap<> ();
        map.put ("ISBN", "cfccb541104045bc96860fc2f2870605");
        map.put ("UserID", 1);
        map.put ("Amount", 1);
        map.put ("back", new Date ());
        map.put ("status", 1);
        userServiceImpl.ReturnBook (map);
        List<Relationship> relationships = userServiceImpl.QueryByUserID (1);
        System.out.println (relationships);

    }

}
