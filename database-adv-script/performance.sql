-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    py.payment_id,
    py.amount,
    py.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
JOIN
    payments py ON b.booking_id = py.booking_id;

-- Refactored Query: Retrieve specific booking details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
JOIN
    payments py ON b.booking_id = py.booking_id;