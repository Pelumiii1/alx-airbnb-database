# ALX Airbnb Database - Schema Design

## Goal

This project defines the database structure for a basic Airbnb-like system using SQL.

## What’s Inside

- **schema.sql**: Contains SQL code to create tables for:

  - Users
  - Properties
  - Bookings
  - Payments
  - Reviews
  - Messages

- Foreign keys are used to connect tables (e.g., bookings are linked to users and properties).
- Indexes are added to improve search performance.
- One improvement made during normalization:
  - The `total_price` in `bookings` was removed because it can be calculated from other values (price per night × number of nights).

## Why Normalization?

We removed any repeating or unnecessary data to:

- Avoid storing things twice
- Prevent update errors
- Make the database faster and cleaner
