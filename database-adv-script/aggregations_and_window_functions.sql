-- All users and their total number of bookings
SELECT u.user_id, u.username, u.email, COUNT(b.booking_id) AS total_bookings
FROM user u
    LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.username,
    u.email
ORDER BY total_bookings DESC;

-- All properties and their total number of bookings
SELECT
    p.property_id,
    p.property_name,
    p.property_type,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (
        ORDER BY COUNT(b.booking_id) DESC
    ) AS booking_rank,
    DENSE_RANK() OVER (
        ORDER BY COUNT(b.booking_id) DESC
    ) AS dense_booking_rank,
    ROW_NUMBER() OVER (
        ORDER BY COUNT(b.booking_id) DESC
    ) AS row_num
FROM property p
    LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.property_name,
    p.property_type
ORDER BY booking_count DESC;