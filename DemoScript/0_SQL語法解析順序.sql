-- SQL�y�k���ѪR����
--�d��
SELECT 	A.AllPayTradeID, 
		A.AllPayTradeNo,
		A.MID,
		B.MerchantID,
		A.TradeTotalAMT,
		C.SubTotalAMT,
		A.ActualTotalAMT,
		A.PaymentTypeID,
		A.PaymentSubTypeID
FROM
	#TEMP_ChargeBack T
JOIN
	AllPay_Payment_TradeNo A WITH(NOLOCK) ON T.AllPayTradeID = A.AllPayTradeID
JOIN 
	AllPay_Payment_TradeDetail B WITH(NOLOCK) ON A.AllPayTradeID = B.AllPayTradeID
JOIN 
	AllPay_Payment_TradeItemsDetail C WITH(NOLOCK) ON A.AllPayTradeID = C.AllPayTradeID
WHERE
	C.ItemStatus = '3' --�����h��
AND
	A.PaymentStatus = 1
AND
	B.MerchantID NOT IN () --����POS�t�Ӫ����

-- �b�W��d�Ҥ�
-- DB�̥��B�z���O
FROM
	#TEMP_ChargeBack T
JOIN
	AllPay_Payment_TradeNo A WITH(NOLOCK)
JOIN 
	AllPay_Payment_TradeDetail B WITH(NOLOCK)
JOIN 
	AllPay_Payment_TradeItemsDetail C WITH(NOLOCK)

-- ���U�ӳB�z���O
ON T.AllPayTradeID = A.AllPayTradeID
ON A.AllPayTradeID = B.AllPayTradeID
ON A.AllPayTradeID = C.AllPayTradeID
-- �H�� WHERE������
WHERE
	C.ItemStatus = '3' --�����h��
AND
	A.PaymentStatus = 1
AND
	B.MerchantID NOT IN () --����POS�t�Ӫ����
-- GROUP BY
-- ORDER BY

-- ���U�ӳB�z���O�q�Эy�϶������X�u���ݭn����줺�e
A.AllPayTradeID, 
A.AllPayTradeNo,
A.MID,
B.MerchantID,
A.TradeTotalAMT,
C.SubTotalAMT,
A.ActualTotalAMT,
A.PaymentTypeID,
A.PaymentSubTypeID

-- ���U�ӭY��GROUP BY �h�|����GROUP
-- �̫�N�OORDER BY

-- FROM~WHERE�������B�z > WHERE�����JOIN TABLE ON���� > SELECT Column > GROUP BY > ORDER BY




/*
ACID��h�C
	Atomicity (��l�ʡB���i���������ʡ^
	Consistency (�@�P��)
	Isolation (�j����)
	Durability (���[��)
*/

https://retrydb.blogspot.com/2017/04/sql-server-acid.html