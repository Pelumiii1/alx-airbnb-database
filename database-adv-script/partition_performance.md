# Partitioning Performance Report

## Objective

The goal of this task was to improve query performance on the `bookings` table by implementing table partitioning. The partitioning is based on the `start_date` column, which is a common approach for time-series data.

## Implementation

The `partitioning.sql` script performs the following steps:

1.  **Creates a new partitioned table** called `bookings_partitioned` with the same structure as the original `bookings` table.
2.  **Defines partitions** for different year ranges (2022, 2023, and 2024). This allows the database to store data in separate physical locations based on the `start_date`.
3.  **Copies data** from the old `bookings` table to the new partitioned table.
4.  **Replaces the old table** with the new partitioned table.
5.  **Re-creates indexes and foreign keys** on the new table.

## Performance Improvements

After partitioning the `bookings` table, we can expect to see significant performance improvements for queries that filter by `start_date`. For example, a query like this:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-03-31';
```

Before partitioning, the database would have to scan the entire `bookings` table to find the matching rows. After partitioning, the database can use a technique called **partition pruning**, where it only scans the relevant partitions (in this case, `bookings_y2023`).

### Expected Results

-   **Faster Query Execution:** Queries with date range filters on `start_date` will be significantly faster.
-   **Reduced I/O:** The database will read less data from disk, which reduces I/O and improves overall performance.
-   **Improved Maintenance:** Operations like backups and archiving can be performed on a per-partition basis, which is more efficient.

By implementing partitioning, we have made the database more scalable and efficient, especially as the `bookings` table grows over time.
