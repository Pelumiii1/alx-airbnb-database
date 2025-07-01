-- Properties with average rating > 4.0 (Non-correlated subquery)
SELECT property_id, property_name, property_type
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Users with more than 3 bookings (Correlated subquery)
SELECT user_id, username, email
FROM user u
WHERE (
    SELECT COUNT(booking_id)
    FROM booking b
    WHERE b.user_id = u.user_id
) > 3;