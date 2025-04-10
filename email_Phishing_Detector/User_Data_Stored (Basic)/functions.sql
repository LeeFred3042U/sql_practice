-- Created a users table for storing user details
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100)
);

-- linking the messages table with the new users table by adding a foreign key
ALTER TABLE messages ADD COLUMN user_id INT REFERENCES users(id);

-- INNER JOIN: Fetches only users who have sent messages
SELECT u.full_name, m.subject, m.is_phishing
FROM users u
JOIN messages m ON u.email = m.sender_email
WHERE m.is_phishing = TRUE;

-- LEFT JOIN: Fetches all users, even if no message sent
SELECT u.full_name, m.subject, m.is_phishing
FROM users u
LEFT JOIN messages m ON u.email = m.sender_email;