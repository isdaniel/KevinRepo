-- LIKE 條件使用
-- %放置的位置落差
-- 以下查詢需在大量資料的資料表中查詢才容易顯示差異
-- 撰寫模糊查詢SQL語法時需謹慎考量需要放置的位置
-- 除了可能影響效能外還可能導致DB Engine放棄使用索引
-- 此處目前並不會引發DB Engine放棄索引查詢

--速度慢 因前面有%
SELECT TOP 1000 [MID]
      ,[NickName]
      ,[CName]
FROM [AllPay].[dbo].[Member_Basic] WITH (NOLOCK)
WHERE
	CNAME LIKE '%范%'

--速度慢 因前面有%
SELECT TOP 1000 [MID]
      ,[NickName]
      ,[CName]
FROM [AllPay].[dbo].[Member_Basic] WITH (NOLOCK)
WHERE
	CNAME LIKE '%范'

--速度較快 因為%在後面
SELECT TOP 1000 [MID]
      ,[NickName]
      ,[CName]
FROM [AllPay].[dbo].[Member_Basic] WITH (NOLOCK)
WHERE
	CNAME LIKE '范%'
	
--如果要查詢Like語法 CNAME LIKE '%范'  讓查詢走seek或索引,可嘗試在後面加 AND CNAME > '' 讓查詢走Seek.

SELECT TOP 1000 [MID]
      ,[NickName]
      ,[CName]
FROM [AllPay].[dbo].[Member_Basic] WITH (NOLOCK)
WHERE
	CNAME LIKE '%范' AND CNAME > ''
