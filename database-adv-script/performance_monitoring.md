# Performance Monitoring and Refinement Report

## Objective

This report outlines the process for continuously monitoring and refining database performance by analyzing query execution plans and making necessary schema adjustments. The goal is to ensure that the database remains efficient as the application scales.

## 1. Monitoring Query Performance

To monitor query performance, we use `EXPLAIN ANALYZE`, which provides a detailed execution plan and performance statistics. Let's consider a frequently used query that retrieves all reviews for a specific property:

```sql
-- Query to retrieve all reviews for a given property
SELECT
    r.review_id,
    r.rating,
    r.comment,
    u.first_name,
    u.last_name
FROM
    reviews r
JOIN
    users u ON r.user_id = u.user_id
WHERE
    r.property_id = 123; -- Example property_id
```

To analyze this query, we run:

```sql
EXPLAIN ANALYZE
-- Paste the query here
```

## 2. Identifying Bottlenecks

After running `EXPLAIN ANALYZE`, we might see an execution plan that includes a **sequential scan** on the `reviews` table. This means the database is scanning the entire table to find reviews for the specified `property_id`, which is inefficient, especially as the number of reviews grows.

**Bottleneck:** The lack of an index on the `property_id` column in the `reviews` table is causing the slow performance.

## 3. Implementing Changes

To address this bottleneck, we can create an index on the `reviews(property_id)` column. This will allow the database to quickly locate the reviews for a specific property without scanning the entire table.

```sql
-- Create an index on the property_id column in the reviews table
CREATE INDEX idx_reviews_property_id ON reviews (property_id);
```

## 4. Reporting Improvements

After creating the index, we can run `EXPLAIN ANALYZE` again on the same query. The new execution plan should show an **Index Scan** instead of a Sequential Scan. This indicates that the database is now using the index to speed up the query.

### Expected Improvements:

-   **Lower Execution Time:** The query will run significantly faster.
-   **Reduced Cost:** The query execution cost will be much lower.
-   **Improved Scalability:** The application will be more scalable, as the performance of this query will not degrade as rapidly as the `reviews` table grows.

By following this process of monitoring, identifying bottlenecks, and implementing changes, we can ensure that the database continues to perform optimally over time.
