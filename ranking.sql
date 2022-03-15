SELECT
   a."Account Name"  'Account',
   a."Account Owner Name"  'Account Owner',
   sum(i."Gross Profit")  'Gross Profit',
   sum(i."Revenue")  'Revenue',
   rank() over(PARTITION BY a."Account Owner Name"  ORDER BY sum(i."Revenue") DESC ) 'Rank',
   'Ranked Accounts' 'Category'
FROM  "Accounts (Zoho CRM)"  a
JOIN "Invoices (Zoho CRM)"  i ON a."Id"  = i."Account"  
WHERE  year(i."Created Time")  LIKE year(today())
GROUP BY a."Account Name",
   a."Account Owner Name" 
ORDER BY a."Account Owner Name",
  'Gross Profit' DESC
