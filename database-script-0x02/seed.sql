-- Seed users
INSERT INTO
    users (
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role
    )
VALUES (
        'Alice',
        'Smith',
        'alice@gmail.com',
        'hashed_pw_1',
        '08011111111',
        'host'
    ),
    (
        'Bob',
        'Johnson',
        'bob@gmail.com',
        'hashed_pw_2',
        '08022222222',
        'guest'
    ),
    (
        'Clara',
        'Ojo',
        'clara@gmail.com',
        'hashed_pw_3',
        '08033333333',
        'guest'
    ),
    (
        'Daniel',
        'Okeke',
        'daniel@gmail.com',
        'hashed_pw_4',
        '08044444444',
        'host'
    );

-- Seed properties
INSERT INTO
    properties (
        host_id,
        name,
        description,
        location,
        price_per_night
    )
VALUES (
        1,
        'Cozy Cabin',
        'A peaceful cabin in the woods',
        'Lagos',
        25000.00
    ),
    (
        4,
        'Luxury Apartment',
        'Modern apartment with ocean view',
        'Abuja',
        60000.00
    );

-- Seed bookings
INSERT INTO
    bookings (
        property_id,
        user_id,
        start_date,
        end_date,
        status
    )
VALUES (
        1,
        2,
        '2025-07-01',
        '2025-07-05',
        'confirmed'
    ), -- Bob books Alice's cabin
    (
        2,
        3,
        '2025-08-10',
        '2025-08-15',
        'completed'
    );
-- Clara books Daniel's apartment

-- Seed payments
INSERT INTO
    payments (
        booking_id,
        amount,
        payment_date,
        payment_method
    )
VALUES (
        1,
        100000.00,
        '2025-06-28',
        'credit_card'
    ),
    (
        2,
        300000.00,
        '2025-08-01',
        'bank_transfer'
    );

-- Seed reviews
INSERT INTO
    reviews (
        property_id,
        user_id,
        rating,
        comment
    )
VALUES (
        1,
        2,
        5,
        'Beautiful and quiet! Loved every bit of it.'
    ),
    (
        2,
        3,
        4,
        'Very modern and comfortable. A bit pricey.'
    );

-- Seed messages
INSERT INTO
    messages (
        sender_id,
        recipient_id,
        message_body
    )
VALUES (
        2,
        1,
        'Hi Alice, is your cabin available next weekend?'
    ),
    (
        1,
        2,
        'Hi Bob, yes it is! You can book it now.'
    ),
    (
        3,
        4,
        'Hello Daniel, do you offer airport pickup?'
    );