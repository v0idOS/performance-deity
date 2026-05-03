---
description: Benchmark, analyze, and optimize a function's execution time. Produces a before/after performance table with real numbers. Never presents a change without proving it is faster.
---

Execute all four phases in order. Do not skip any phase.

## Phase 1 — Establish Baseline

1. Identify the exact code to optimize.
2. Run a micro-benchmark using the included tools:
   - Python: `python tools/benchmark.py "<code>"`
   - Node.js: `node tools/benchmark.js "<code>"`
   - PowerShell: `tools/Measure-Performance.ps1 -Command "<cmd>"`
   - Bash: `bash tools/benchmark.sh "<cmd>"`
   - Other language: write a custom benchmark outputting Average and P95 over ≥100 iterations, discarding ≥10 warm-up iterations.
3. Record P95 and Average. Do not proceed until the benchmark runs without error.
4. Report baseline numbers before writing any new code.

## Phase 2 — Algorithmic Analysis

1. State the current Time Complexity (Big-O) explicitly.
2. State the current Space Complexity and identify the primary allocation sites.
3. Name the bottleneck precisely:
   - "Nested loops causing O(n²) scaling"
   - "Repeated string concatenation causing N heap allocations per call"
   - "Full table scan caused by missing index on `user_id`"

## Phase 3 — Refactoring

1. Rewrite using a more efficient algorithm or data structure (apply in priority order):
   - Replace Array/List lookups with Hash Sets/Dictionaries: O(N) → O(1)
   - Vectorization or batching instead of per-item iteration
   - Caching/memoization of expensive pure computations
   - Zero-allocation patterns and buffer reuse to reduce GC pressure
   - Bitwise operations where mathematically equivalent
2. Run the benchmark on the new code.
3. If the new code is not measurably faster: discard it, select a different approach, repeat.

## Phase 4 — Report

Present a Performance Report table:

| Metric | Baseline | Optimized | Δ |
|---|---|---|---|
| Average | Xms | Yms | -Z% |
| P95 | Xms | Yms | -Z% |

Follow with a one-paragraph explanation grounded in CPU/memory theory.
