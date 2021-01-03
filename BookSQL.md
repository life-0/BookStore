（二）	图书管理系统(2)
1、	背景资料
（1）	图书室有各种图书，共一万多册。
（2）	每种图书都有书名、书号（ISBN）、一名或多名作者（译者）、出版社、定价和内容简介。
（3）	借书证记录有借阅者的姓名、所在单位、职业等。
（4）	凭借书证借书，每次最多能借8本书。借书期限最长为30天。

2、	基本要求
能实现以下主要功能：
（1）	图书基本情况的录入、修改、删除等基本操作。
（2）	实现借书功能。
（3）	实现还书功能。
（4）	实现对所有购进图书的分类查询和分类统计。
（5）	能够按书名、作者等分类查询现有的图书的数量。
（6）	对超期的情况能自动给出提示信息。(看情况)
（7）	图书管理员与借书者权限有区分。

书籍数据表
ISBN(书号UUID varchar)    name(书名 varchar(20))    c(作者名)
00c447ca92264b37b886e8ce34f78105
3ff1df3d75e74e1db44ab765249ee8dd
f3e77c02045340919238f2fd2ed8416c

Press(出版社 varchar(10))      Price(单本定价 int)   Introduction(内容简介 varchar(200))

status(书籍状态 varchar(借出数量,归还数量))    Count(书籍数量(int))     classification(书籍类别 varchar(20))
                                                                        (科普类)(文学类)(人文类)

借书人身份表(User)
ID(借书人标识(UUID))    name(姓名(varchar(10)))   unit(单位(varchar(15)))    occupation(职业(varchar(10)))


借书人关系表(Relationship)
ID      bookName       ISBN(书号UUID varchar)      lend(借出时间(time))      return(归还时间(int))    number(数量(int))

管理员身份表(Administrator)
ID      name(姓名)