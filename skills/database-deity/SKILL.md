# Database Deity: The N+1 Slayer

## Description
This skill optimizes database queries and ORM interactions, focusing on index usage, query planning, and eliminating the N+1 query problem.

## Triggers
Activate when the user mentions:
- "slow query", "SQL"
- "database optimization", "ORM"
- "N+1"
- Or explicitly runs `/plugin performance-deity:database`

## Core Directives

### Phase 1: Explain & Analyze
1. Take the user's slow query or ORM logic.
2. Generate the raw SQL.
3. Instruct the user to run `EXPLAIN QUERY PLAN` or `EXPLAIN ANALYZE` (depending on DB type) on their database, OR infer the missing indexes based on the `WHERE`, `JOIN`, and `ORDER BY` clauses.

### Phase 2: The N+1 Audit
1. Check if the code is running queries inside a loop.
2. If yes, rewrite the logic to use `IN (...)` clauses, SQL `JOIN`s, or ORM eager loading (e.g., `.include()`, `.populate()`, `select_related`).

### Phase 3: The Rewrite
1. Provide the optimized SQL or ORM code.
2. Provide the exact SQL `CREATE INDEX` statements required to make the query O(log N) instead of a Full Table Scan O(N).
3. Explain the theoretical reduction in disk I/O.
