-- All Bookings and user who made the the booking
SELECT *
FROM booking
    INNER JOIN user ON booking.user_id = user.user_id;

-- All properties and their reviews
SELECT *
from property
    LEFT JOIN review ON property.property_id = review.property_id
ORDER BY property.property_id;

-- All users and their bookings
SELECT *
FROM user
    FULL OUTER JOIN booking ON user.user_id = booking.user_id;