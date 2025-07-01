-- All properties with at least one review with a rating higher than 4
SELECT p.property_id, p.property_name, p.property_type, AVG(r.rating) AS avg_rating
FROM property p
    JOIN review r ON p.property_id = r.property_id
GROUP BY
    p.property_id,
    p.property_name,
    p.property_type
HAVING
    AVG(r.rating) > 4.0
ORDER BY avg_rating DESC;

-- All users who have made more than 3 bookings
SELECT u.user_id, u.username, u.email, COUNT(b.booking_id) AS booking_count
FROM user u
    JOIN booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.username,
    u.email
HAVING
    COUNT(b.booking_id) > 3
ORDER BY booking_count DESC;