-- Qu 1: Clean data
ALTER TABLE properties
ADD clean_price INT;alter

SET sql_safe_updates = 0;
UPDATE properties
SET clean_price = REPLACE(price, '$', ' ');

-- Qu 2: Top 10 earning properties
SELECT property_name

-- Qu 3: Family friendly
SELECT p.property_name, p.city, p.clean_price
FROM properties p
JOIN reviews r ON p.property_id = r.property_id
WHERE r.review_text LIKE '%spacious%'
	OR r.review_text LIKE '%kid%'
ORDER BY p.clean_price;

-- Qu 4: Most expensive
CREATE PROCEDURE RetrieveMostExpensiveInCity()
BEGIN
	DECLARE max_price INT;
    
    SELECT MAX(clean_price) INTO max_price
    FROM properties
    
    SELECT max_price;
END //

DELIMITER ;

CALL RetrieveMostExpensiveInCity()
    
-- Qu 5: Lowest rated
SELECT p.property_name, AVG(r.score) AS average_review
FROM properties p
JOIN reviews r on p.property_id = r.property_id
GROUP BY p.property_name
LIMIT 1;