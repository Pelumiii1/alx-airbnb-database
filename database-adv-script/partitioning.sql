-- Partitioning the bookings table by start_date

-- Step 1: Create a new partitioned table
CREATE TABLE bookings_partitioned (
    booking_id SERIAL,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for different date ranges
CREATE TABLE bookings_y2022 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2022-12-31');

CREATE TABLE bookings_y2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');

CREATE TABLE bookings_y2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');

-- Step 3: Copy data from the old table to the new one
INSERT INTO bookings_partitioned SELECT * FROM bookings;

-- Step 4: Drop the old table and rename the new one
DROP TABLE bookings;
ALTER TABLE bookings_partitioned RENAME TO bookings;

-- Step 5: Re-create indexes and foreign keys
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

ALTER TABLE bookings ADD CONSTRAINT fk_bookings_property FOREIGN KEY (property_id) REFERENCES properties(property_id);
ALTER TABLE bookings ADD CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES users(user_id);
