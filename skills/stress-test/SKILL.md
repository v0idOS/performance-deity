---
description: Stress test and harden code against extreme inputs, malformed data, and simulated infrastructure failures. Acts as a red team. Documents every crash, then hardens the boundary.
---

Execute all four phases in order.

## Phase 1 — Fuzzer

Write a script that sends the following inputs to the target function:
- 1GB string payloads
- `null`, `undefined`, `NaN`, `-1`, `Infinity`
- Deeply nested recursive JSON (depth >1,000)
- Malformed Unicode strings (`\uFFFD`, null bytes, RTL override characters)
- Simulated network drops or database timeouts via mocked I/O

## Phase 2 — Attack

Run the fuzzer. For each failure, document:
- The exact input that caused the failure
- The failure mode: unhandled exception, memory exhaustion, infinite loop, or incorrect output without error

## Phase 3 — Hardening

For every documented failure:
1. Add input validation at the function boundary. Reject invalid input immediately with a typed error.
2. Add pagination or streaming for inputs that exceed a byte threshold.
3. Add a circuit breaker or retry-with-exponential-backoff for every network and database dependency.

## Phase 4 — Report

Re-run the full fuzzer. For every input that previously caused a crash, show the new response.

| Input | Before | After |
|---|---|---|
| 1GB string | Crash / OOM | 400 Bad Request |
| Null input | Unhandled exception | Typed error returned |
| Nested JSON 1k deep | Stack overflow | Rejected at boundary |

Zero crashes is the target.
