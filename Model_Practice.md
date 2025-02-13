# Library Management System - Model Building Practice

## Problem Statement  
You are building a **Library Management System** where users can borrow books.  
Create a model for `Book` that includes relationships, validations, scopes, and methods to track borrowed books.

---

## Data Dictionary for `Book` Model

| Column Name   | Data Type  | Constraints / Description |
|--------------|-----------|---------------------------|
| id           | integer   | Primary Key (Auto-generated) |
| title        | string    | Must be present (required) |
| author       | string    | Must be present (required) |
| isbn         | string    | Must be unique and required |
| published_on | date      | Required, must be a past date |
| available    | boolean   | Defaults to `true`, represents if the book is available for borrowing |
| created_at   | datetime  | Auto-generated timestamp |
| updated_at   | datetime  | Auto-generated timestamp |

---

## Model Requirements

### **Relationships**  
- A `Book` **belongs to** a `Category` (each book belongs to a single category).  
- A `Book` **has many** `Borrows` (track book borrowings by users).  
- A `Book` **has many** `Users` through `Borrows` (users who have borrowed the book).  

### **Validations**  
- `title` and `author` must be present.  
- `isbn` must be present and unique.  
- `published_on` must be a past date.  

### **Scopes**  
- `available` → Books that are available to borrow.  
- `unavailable` → Books that are currently borrowed.  
- `recently_published` → Books published within the last 5 years.  
- `alphabetical` → Order books by title alphabetically.  

### **Methods**  
- `borrowed?` → Returns `true` if the book is currently borrowed.  
- `mark_as_borrowed` → Marks the book as unavailable.  
- `mark_as_returned` → Marks the book as available again.  

---

### **Practice Instructions**
- Implement the `Book` model in Ruby on Rails.
- Ensure all relationships, validations, and scopes are correctly defined.
- Write test cases to validate your model logic.
