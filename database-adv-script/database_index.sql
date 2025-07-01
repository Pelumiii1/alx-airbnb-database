-- Indexes for high-usage columns

-- Index on the user_id column in the booking table
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index on the property_id column in the booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on the property_id column in the review table
CREATE INDEX idx_review_property_id ON review(property_id);

-- Index on the booking_id column in the payment table
CREATE INDEX idx_payment_booking_id ON payment(booking_id);
