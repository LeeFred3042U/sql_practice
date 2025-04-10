-- Creating a table that stores phishing detection metadata (No personal info stored)
CREATE TABLE phishing_metadata (
    id SERIAL PRIMARY KEY,         
    timestamp TIMESTAMP DEFAULT NOW(), -- Time when messaged analysed for traacking
    phishing_score DECIMAL(6,3),   -- Confidence score (0-100%)
    keywords_detected TEXT[],      -- List of detected phishing words
    email_length INT,              -- Length of email body
    contains_link BOOLEAN,         -- If the message had links
    contains_attachment BOOLEAN,   -- If the message had attachments
    phishing_flag BOOLEAN          -- Final classification (TRUE = Phishing, FALSE = Safe)
);
