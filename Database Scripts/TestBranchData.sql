SELECT Br.[address] AS 'Branch Address'
	  ,Bk.name AS 'Bank Name'
FROM Branch Br
JOIN Bank Bk ON Bk.bank_id = Br.bank_id