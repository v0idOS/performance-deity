# Performance Deity ⚡

**Performance Deity** is a ruthlessly strict, interconnected performance engineering methodology for your coding agents. It transforms your AI coding assistant from a standard code generator into an obsessive, world-class Site Reliability and Performance Engineer.

## The Problem
Standard AI agents write code that "works". They rarely write code that is blazing fast, thread-safe, or resilient to memory leaks. 

## The Solution
Performance Deity provides 5 interconnected skills (deities) that force the AI to mathematically prove its code is performant, safe, and resilient before presenting it to you.

---

## The Pantheon of Skills

### ⚡ 1. The Hot-Path Optimizer (`performance-deity:optimize`)
**Triggers:** "optimize", "speed up", "benchmark"
- Writes micro-benchmarks, analyzes Big-O complexity, refactors for speed, and mathematically proves latency reduction (e.g., swapping arrays for hash maps).

### 🧠 2. The Leak Hunter (`performance-deity:memory`)
**Triggers:** "memory leak", "OOM", "high RAM"
- Instruments memory tracking, identifies uncollected references, and implements object pooling or weak references to stabilize GC pauses.

### 🧵 3. The Race Condition Killer (`performance-deity:concurrency`)
**Triggers:** "threading", "deadlock", "race condition"
- Writes chaos scripts that fire 10,000 concurrent requests at your function. Proves thread unsafety, adds Atomic operations or Mutexes, and verifies 0% failure rate.

### 💾 4. The N+1 Slayer (`performance-deity:database`)
**Triggers:** "slow query", "SQL", "N+1"
- Forces the AI to run `EXPLAIN QUERY PLAN`, identifies missing indexes, and rewrites ORM loops into batch queries or eager loads.

### 💥 5. The Chaos Engineer (`performance-deity:stress-test`)
**Triggers:** "stress test", "harden this"
- Acts as a Red Team. Bombards your code with 1GB string payloads, malformed JSON, and network drops to ensure graceful degradation.

---

## Included Tooling

The plugin ships with an automated, cross-platform benchmarking suite for any tech stack:
- `tools/benchmark.py`: Python script runner utilizing `timeit`.
- `tools/benchmark.js`: Node.js script runner utilizing V8 `perf_hooks`.
- `tools/Measure-Performance.ps1`: Professional PowerShell benchmarking.
- `tools/benchmark.sh`: POSIX-compliant bash benchmarking.

## Installation

See [docs/INSTALL.md](docs/INSTALL.md) for setup instructions across Claude Code, Cursor, and OpenCode.

## Philosophy

- **Guessing is a sin.** Measure everything.
- **Micro-optimizations matter** in hot paths.
- **Algorithmic efficiency (Big-O)** beats language-level tricks.

---
*Built for developers who demand blazing-fast software.*
