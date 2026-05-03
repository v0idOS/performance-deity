---
description: Detect and fix race conditions and deadlocks. Fires thousands of concurrent requests to prove thread-unsafety, then applies the minimal synchronization primitive needed.
---

Execute all four phases in order.

## Phase 1 — Chaos Script

Write a test that fires ≥1,000 concurrent async requests or threads at the target function simultaneously. The test must assert the final state deterministically (e.g. if a counter is incremented 1,000 times, assert `counter === 1000`).

## Phase 2 — Failure Verification

Run the test. If it passes consistently:
- Increase concurrency to 10,000.
- Add `sleep()` calls mid-execution to force thread context switching.

Prove the function is unsafe before fixing it. Do not add synchronization to code that has not been shown to fail.

## Phase 3 — Synchronization

Implement the minimal synchronization primitive needed (prefer in this order):
1. Atomic operations (e.g. `Atomics.add`, `atomic.AddInt64`, `std::atomic`)
2. Mutex / Lock with the smallest possible critical section
3. Semaphore only if mutual exclusion alone is insufficient

Do not hold a lock across any I/O operation.

## Phase 4 — Report

Re-run the test with 10,000 concurrent requests. Report the pass/fail counts.

| Metric | Before | After |
|---|---|---|
| Failures at 1k concurrent | N | 0 |
| Failures at 10k concurrent | N | 0 |

The target is 0 failures.
