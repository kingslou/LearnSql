
//一个多表连接，配合group by 使用
// 其中菜品表是主表，其他表都是一些菜品的信息（做法，估清，类型）

SELECT
	c.*, ifnull(cpzf.zfcount, 0) AS zfcount,
	ct.guid AS cpTypeId,
	ct.dishTypeCode AS cpTypeCode,
	ct.dishTypeName AS cpTypeName,
	be.dishTypeCode AS bestTypeCode,
	be.guid AS bestTypeId,
	be.dishTypeName AS bestTypeName,
	CASE
WHEN gq.caipinNum IS NULL THEN
	- 1
ELSE
	gq.caipinNum
END AS guqingNum

FROM
	pos_caipin c
LEFT JOIN (
	SELECT
		*
	FROM
		pos_caipin_guqing
	WHERE
		startTime <= datetime('now', 'localtime')

	AND endTime >= datetime('now', 'localtime')
) gq ON c.guid = gq.caipinGuid

LEFT JOIN (
	SELECT
		count(guid) zfcount,
		caipinId
	FROM
		pos_caipin_zuofa
	WHERE
		isDeleted = 'false'
	GROUP BY
		caipinId
) cpzf ON c.guid = cpzf.caipinId

LEFT JOIN pos_caipin_type ct ON c.typeId = ct.guid

LEFT JOIN pos_caipin_type b ON c.typeId = b.guid

LEFT JOIN pos_caipin_type be ON b.parentId = be.guid

WHERE
	c.isDeleted = 'false'
AND c.enabled = 'true'
