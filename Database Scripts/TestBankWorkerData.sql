SELECT CONCAT(P.first_name, ' ', P.middle_name, ' ', P.last_name) AS 'Worker Full Name'
      ,Bk.[name] AS 'Bank Name'
FROM Bank_Worker Bw
JOIN Bank Bk ON Bk.bank_id = Bw.bank_id
JOIN Person P ON P.egn = Bw.person_egn