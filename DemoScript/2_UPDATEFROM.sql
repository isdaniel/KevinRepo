-- 避免使用UPDATE FROM
-- FROM之後的資料表若為大表則可能會引發TABLE LOCK
-- FROM之後若有兩張大表作JOIN也可能引發TABLE LOCK
-- 即使加上WITH (NOLOCK)還是可能引發TABLE LOCK
UPDATE A
SET	A.AllocateStatus = 1
FROM dbo.Payment_TradeDetail_AliPay AS A WITH (NOLOCK)
    INNER JOIN dbo.Payment_TradeNo AS B WITH (NOLOCK)
		ON A.TradeID = B.TradeID
WHERE 
           A.AllocateStatus IS NULL

-- 以上語法可能就會造成兩張表JOIN時間過長且要進行UPDATE的資料筆數超過5000筆引發TABLE LOCK
-- 當下其他連線SESSION無法對該表進行存取
-- 故建議先將資料取出以批次進行更新

-- 上述語法運作流程如下
-- 1.先執行了dbo.Payment_TradeDetail_AliPay 與dbo.Payment_TradeNo的JOIN
-- 2.進行WHERE條件篩選
-- 3.進行更新UPDATE超過5000筆 進行TABLE LOCK