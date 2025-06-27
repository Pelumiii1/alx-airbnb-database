# Database Normalization to 3NF

## Objective

Normalize the given database schema to Third Normal Form (3NF) by identifying and eliminating redundancies and transitive dependencies.

---

## Step-by-Step Analysis

### 1. User Table

- Already in 3NF.
- Each attribute is atomic and functionally dependent on the primary key `user_id`.

### 2. Property Table

- In 3NF.
- All attributes are atomic and depend directly on `property_id`.

### 3. Booking Table

- Violation found: `total_price` is a **derivable** attribute.
- `total_price` can be calculated as:  
  `price_per_night × (end_date - start_date)`
- To comply with 3NF, remove `total_price` and compute it dynamically.

### 4. Payment Table

- In 3NF.
- All values are atomic and fully dependent on `payment_id`.

### 5. Review Table

- In 3NF.
- All values depend on the primary key `review_id`.

### 6. Message Table

- In 3NF.
- No derived or transitive attributes.

---

## Final Adjustments

### Booking Table (Revised)

```plaintext
PK: booking_id
FK: property_id, user_id
Attributes:
  - start_date
  - end_date
  - status
  - created_at
```
