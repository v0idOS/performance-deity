---
description: Diagnose and fix slow database queries. Runs EXPLAIN ANALYZE, identifies missing indexes, eliminates N+1 ORM patterns, and provides exact CREATE INDEX statements.
---

Execute all three phases in order.

## Phase 1 — Analysis

1. Take the slow query or ORM code.
2. Generate the equivalent raw SQL.
3. Either instruct the user to run `EXPLAIN QUERY PLAN` (SQLite) or `EXPLAIN ANALYZE` (Postgres/MySQL), or infer missing indexes directly from the `WHERE`, `JOIN`, and `ORDER BY` clauses.

## Phase 2 — N+1 Audit

Check whether queries are issued inside a loop. If yes, rewrite using:
- `IN (...)` batch clause
- SQL `JOIN`
- ORM eager loading:
  - `.include()` — Prisma
  - `.populate()` — Mongoose
  - `select_related()` / `prefetch_related()` — Django

## Phase 3 — Rewrite

1. Provide the optimized SQL or ORM code.
2. Provide the exact `CREATE INDEX` statements required.
3. Explain the disk I/O reduction: Full Table Scan O(N) → Index Lookup O(log N).

Before/after query plan summary:

| Metric | Before | After |
|---|---|---|
| Scan type | Full Table Scan | Index Lookup |
| Complexity | O(N) | O(log N) |
| Query count (per page load) | N+1 | 1 |
