
// group by 用法
// GROUP BY 语句用于结合合计函数，根据一个或多个列对结果集进行分组。
// group by  用来分组统计，如果 ，可以统计所有菜品的菜品类型的数量，如 100个菜中 有多少个冷菜 多少个热菜

SELECT
	caipinTypeId,
	caipinTypeName,
	count(*) AS typeCount
FROM
	pos_order_caipin
GROUP BY
	caipinTypeId

// group by 后添加条件 用Having,Having用来处理分组后的条件，Where处理的是分组前的
SELECT
	caipinTypeId,
	caipinTypeName,
	count(*) AS typeCount
FROM
	pos_order_caipin
GROUP BY
	caipinTypeId
HAVING
	price != 0
