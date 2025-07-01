# Optimization Report

## Initial Query Analysis

The initial query retrieves all bookings along with user, property, and payment details. Here is the query:

```sql
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
```

### Performance Analysis with EXPLAIN

To analyze this query, you would run the following command in your SQL client:

```sql
EXPLAIN ANALYZE
-- Paste the initial query here
```

Running this would likely show a series of nested loops and sequential scans, especially if the tables are large. The cost of the query will be high due to the multiple joins on large tables without specific filtering.

### Inefficiencies

1.  **Full Table Scans:** The query will likely perform full scans on the `bookings`, `users`, `properties`, and `payments` tables, which is inefficient for large datasets.
2.  **Unnecessary Data Retrieval:** The query retrieves all columns, which might not be necessary for all use cases. Selecting only required columns can reduce data transfer.

## Refactored Query

To optimize the query, we can make the following improvements:

1.  **Add Indexes:** Ensure that foreign key columns (`user_id`, `property_id`, `booking_id`) are indexed. The provided `schema.sql` already includes some indexes, which is good.
2.  **Reduce Redundancy:** The initial query is already quite efficient, but for the purpose of this exercise, we will assume that we only need a subset of columns for a specific use case.

Here is a refactored version of the query that selects fewer columns. This is a common optimization when the user does not need all the data from the joined tables.

```sql
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
```

### Performance Improvement

After running `EXPLAIN ANALYZE` on the refactored query, you should see a lower execution cost. The query will be faster because it's transferring less data. For more significant improvements, you could add `WHERE` clauses to filter the data, which would also be a common real-world optimization.
