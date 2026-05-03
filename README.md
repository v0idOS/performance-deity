# Performance Deity ⚡

**A `CLAUDE.md` template that turns Claude Code into a performance engineering expert.**

Drop one file into your project root. No install. No config. No plugin loader.

---

## What It Does

Claude Code reads `CLAUDE.md` automatically at the start of every session. This file gives it a strict, phased methodology for nine categories of performance work — with explicit rules, required benchmarks, and proof requirements before it can present any change to you.

**The core rule:** Claude cannot call something an optimization unless it has numbers proving it is faster than the baseline.

---

## Quickstart

```bash
# Clone the repo
git clone https://github.com/v0idOS/performance-deity
cd performance-deity

# Copy CLAUDE.md into your project
cp CLAUDE.md /path/to/your/project/CLAUDE.md

# Done. Open Claude Code in your project.
```

That's it. Claude Code will load the rules on the next session.

---

## What's Inside CLAUDE.md

Nine performance skills that activate automatically based on what you type:

| Skill | Triggers On | What It Does |
|---|---|---|
| ⚡ Hot-Path Optimizer | "optimize", "speed up", "benchmark" | Benchmarks baseline → analyzes Big-O → refactors → proves improvement with a table |
| 🧠 Leak Hunter | "memory leak", "OOM", "high RAM" | Instruments memory tracking, proves the leak grows, identifies uncollected references, verifies the fix |
| 🧵 Race Condition Killer | "race condition", "deadlock", "threading" | Fires 1,000–10,000 concurrent requests at your function, proves it breaks, adds atomic ops or minimal locks |
| 💾 N+1 Slayer | "slow query", "SQL", "ORM", "N+1" | Runs `EXPLAIN ANALYZE`, identifies missing indexes, rewrites loop queries into batch joins |
| 💥 Chaos Engineer | "stress test", "harden this", "fuzzing" | Bombards code with 1GB payloads, null values, malformed JSON — documents what breaks, then hardens it |
| 🌐 Network Squeezer | "slow api", "payload too large", "bandwidth" | Profiles payload size, enforces Brotli/gzip, migrates heavy REST to GraphQL or protobuf |
| 🏗️ CI/CD Accelerator | "slow build", "docker build slow", "webpack" | Fixes Docker layer order, enables Webpack caching, adds GitHub Actions dependency caching |
| 👁️ The Watcher | "add logging", "telemetry", "datadog" | Wraps critical paths in OpenTelemetry/Sentry spans with metadata, proposes exact alert rules |
| 🎨 Frame-Rate Enforcer | "slow ui", "react optimization", "animation jitter" | Audits re-renders, migrates animations to GPU-composited `transform`, virtualizes long lists |

---

## Included Benchmarking Tools

The `tools/` directory contains cross-platform micro-benchmark runners that `CLAUDE.md` instructs Claude to use automatically:

```
tools/
├── benchmark.py          # Python — timeit, outputs Avg + P95 over 100 iterations
├── benchmark.js          # Node.js — perf_hooks, outputs Avg + P95
├── Measure-Performance.ps1  # PowerShell — outputs Avg + P95
└── benchmark.sh          # Bash/POSIX — outputs Avg + P95
```

---

## Pre-Commit Hook (Optional)

Blocks commits that contain unresolved `TODO: optimize` markers:

```bash
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

---

## Repo Structure

```
.
├── CLAUDE.md             ← The main artifact. Copy this into your project.
├── README.md
├── tools/                ← Benchmark runners (used by CLAUDE.md instructions)
│   ├── benchmark.py
│   ├── benchmark.js
│   ├── Measure-Performance.ps1
│   └── benchmark.sh
├── hooks/
│   └── pre-commit        ← Optional git hook
└── archive/              ← Legacy per-skill SKILL.md files (superseded by CLAUDE.md)
    ├── performance-deity/
    ├── memory-deity/
    ├── concurrency-deity/
    ├── database-deity/
    ├── stress-test-deity/
    ├── network-deity/
    ├── build-deity/
    ├── telemetry-deity/
    └── ui-deity/
```

---

## Philosophy

- **Guessing is a sin.** Measure everything.
- **Algorithmic efficiency beats language tricks.** Fix the Big-O before tuning the constant.
- **Proof is mandatory.** Every optimization ships with a before/after table.
- **Micro-optimizations only matter in proven hot paths.** Don't polish what isn't slow.

---

*Built for developers who demand blazing-fast software.*
