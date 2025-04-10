-- Get the percentage of phishing messages
SELECT 
    (COUNT(*) FILTER (WHERE is_phishing = TRUE) * 100.0 / COUNT(*)) AS phishing_percentage
FROM messages;

-- Create a function to classify phishing based on keywords
CREATE FUNCTION detect_phishing(body TEXT) RETURNS BOOLEAN AS $$
BEGIN
    -- If the message contains common phishing words, return TRUE
    RETURN body ILIKE '%verify%' OR body ILIKE '%urgent%' OR body ILIKE '%click here%';
END;
$$ LANGUAGE plpgsql;
