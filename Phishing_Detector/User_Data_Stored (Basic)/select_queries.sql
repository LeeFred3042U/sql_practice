-- Selecting all messages
SELECT * FROM messages;

-- Getting all phishing messages
SELECT * FROM messages WHERE is_phishing = TRUE;

-- Total Phishing emails detected
SELECT COUNT(*) FROM messages WHERE is_phishing = TRUE;
