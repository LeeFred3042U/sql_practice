CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_email VARCHAR(255) NOT NULL,
    subject TEXT,
    body TEXT NOT NULL,
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_phishing BOOLEAN DEFAULT NULL 
);