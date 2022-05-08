SELECT CONCAT(P.first_name, ' ', P.middle_name, ' ', P.last_name) AS 'Account Full Name'
      ,A.[balance] AS 'Balance'
      ,B.[name] AS 'Bank Name'
	  ,(SELECT COUNT(C.card_id)
		FROM [Card] C
		WHERE A.account_id = C.account_holder_id) AS 'Card Amount'
FROM [Bank_Database].[dbo].[Account] A
JOIN Bank B ON B.bank_id = A.bank_id
JOIN Person P ON P.egn = A.person_egn