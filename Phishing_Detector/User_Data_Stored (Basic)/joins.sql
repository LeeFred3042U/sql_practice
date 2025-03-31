-- A subquery is a query inside another query. It helps in filtering data dynamically

-- Find email addresses that sent phishing messages
SELECT DISTINCT sender_email FROM messages WHERE is_phishing = TRUE;

-- Find users who received phishing messages
SELECT full_name FROM users
WHERE email IN (SELECT sender_email FROM messages WHERE is_phishing = TRUE);
