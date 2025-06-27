# ALX Airbnb Database - Sample Data

## Purpose

This script populates the database with sample data for testing and development.

## What's Included

- **Users**: 4 sample users, 2 hosts and 2 guests
- **Properties**: Each host owns one property
- **Bookings**: Each guest books a property
- **Payments**: Each booking has a related payment
- **Reviews**: Guests leave feedback for properties they stayed in
- **Messages**: Users communicate about property availability

## How to Use

Run this SQL script after creating the schema to insert sample data:

```bash
psql -d your_database_name -f seed.sql
```
