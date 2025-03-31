INSERT INTO phishing_metadata (phishing_score, keywords_detected, email_length, contains_link, contains_attachment, phishing_flag)
VALUES 
(85.5, ARRAY['urgent', 'bank', 'password'], 200, TRUE, FALSE, TRUE),
(40.2, ARRAY['update', 'account'], 150, TRUE, FALSE, FALSE),
(92.1, ARRAY['click', 'verify', 'login'], 250, TRUE, TRUE, TRUE),
(75.3, ARRAY['login', 'verify'], 180, TRUE, FALSE, TRUE),  
(12.5, ARRAY['newsletter', 'subscription'], 120, FALSE, FALSE, FALSE); 
