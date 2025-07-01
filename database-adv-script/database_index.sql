-- Analyze query performance before adding indexes
EXPLAIN ANALYZE SELECT * FROM booking WHERE user_id = 12345;
EXPLAIN ANALYZE SELECT * FROM booking WHERE property_id = 54321;
EXPLAIN ANALYZE SELECT * FROM review WHERE property_id = 54321;
EXPLAIN ANALYZE SELECT * FROM payment WHERE booking_id = 98765;

-- Indexes for high-usage columns

-- Index on the user_id column in the booking table
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index on the property_id column in the booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on the property_id column in the review table
CREATE INDEX idx_review_property_id ON review(property_id);

-- Index on the booking_id column in the payment table
CREATE INDEX idx_payment_booking_id ON payment(booking_id);

-- Analyze query performance after adding indexes
EXPLAIN ANALYZE SELECT * FROM booking WHERE user_id = 12345;
EXPLAIN ANALYZE SELECT * FROM booking WHERE property_id = 54321;
EXPLAIN ANALYZE SELECT * FROM review WHERE property_id = 54321;
EXPLAIN ANALYZE SELECT * FROM payment WHERE booking_id = 98765;
