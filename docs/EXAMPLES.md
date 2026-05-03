# Examples of Performance Deity in Action

## Example 1: The N+1 Database Slayer

**User:** "Fix the slow query fetching user posts."

**Agent Output:**
*Running Database Deity...*
1. **Explain Plan:** The ORM is running `SELECT * FROM posts WHERE user_id = ?` in a loop (100 times).
2. **Refactor:** Converted to an `IN` clause: `SELECT * FROM posts WHERE user_id IN (?, ?, ?...)`.
3. **Index Added:** `CREATE INDEX idx_posts_user_id ON posts(user_id);`
4. **Performance Proof:** Execution time dropped from 1250ms -> 15ms (98% improvement).

## Example 2: The Array to Hash Map Optimization

**User:** "Speed up this data mapping loop."

**Agent Output:**
*Running Hot-Path Optimizer...*
1. **Baseline:** `Average: 450ms | P95: 480ms`
2. **Analysis:** O(N^2) complexity because `array.find()` is used inside a loop over 10,000 items.
3. **Refactor:** Converted the lookup array into a `Set` (Hash Map) before the loop. Lookup becomes O(1).
4. **Final Proof:** `Average: 12ms | P95: 14ms` (3,750% improvement).
