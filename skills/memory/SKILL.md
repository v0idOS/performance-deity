---
description: Detect and fix memory leaks. Instruments memory tracking across thousands of iterations, proves the leak with growth data, identifies the uncollected reference, and verifies the fix.
---

Execute all four phases in order.

## Phase 1 — Isolation

1. Identify the code suspected of leaking.
2. Write a wrapper that runs it in an infinite loop or for ≥1,000,000 iterations.

## Phase 2 — Instrumentation

Inject memory tracking into the wrapper:
- Node.js: `process.memoryUsage().heapUsed` before and after each iteration.
- Python: `tracemalloc.start()` / `tracemalloc.get_traced_memory()`.
- PowerShell: `[System.GC]::GetTotalMemory($false)`.

If memory continuously grows without recovering after GC, the leak is confirmed. Show the growth numerically:
```
Iteration      0:  10 MB
Iteration 100k:  14 MB
Iteration 500k:  40 MB
```

## Phase 3 — Fix

Identify the uncollected reference:
- Event listeners not removed from detached DOM nodes
- Global arrays or caches growing without a size limit
- Closures retaining large outer-scope objects

Apply the fix:
- `removeEventListener` for DOM event listeners
- `WeakMap` / `WeakRef` for object-keyed associations that should not prevent GC
- Object pooling to reuse memory instead of allocating new objects per cycle

## Phase 4 — Report

Re-run the instrumented wrapper and present:

| Metric | Before | After |
|---|---|---|
| Memory growth per 10k ops | +50MB | +0MB |
| GC pause frequency | High | Stable |

Explain the root cause and the specific reference that was being retained.
