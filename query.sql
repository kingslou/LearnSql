Ø 嵌套子查询
子查询是一个嵌套在select、insert、update或delete语句或其他子查询中的查询。
任何允许使用表达式的地方都可以使用子查询。子查询也称为内部查询或内部选择，而包含子查询的语句也成为外部查询或外部选择。
# from (select … table)示例
将一个table的查询结果当做一个新表进行查询
select * from (
select id, name from student where sex = 1
) t where t.id > 2;
上面括号中的语句，就是子查询语句（内部查询）。在外面的是外部查询，其中外部查询可以包含以下语句：
1、 包含常规选择列表组件的常规select查询
2、 包含一个或多个表或视图名称的常规from语句
3、 可选的where子句
4、 可选的group by子句
5、 可选的having子句
# 示例
查询班级信息，统计班级学生人生
select *, (select count(*) from student where cid = classes.id) as num
from classes order by num;
