# Performance Deity ⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

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

For Cursor or Windsurf, copy and rename:

```bash
cp CLAUDE.md /path/to/your/project/.cursorrules
```

---

## What's Inside CLAUDE.md

Nine performance sections. Apply the relevant one based on what you're working on:

| Section | Apply when working on... |
|---|---|
| ⚡ Hot-Path Optimizer | Slow functions, execution time, algorithmic efficiency |
| 🧠 Leak Hunter | Memory leaks, high RAM usage, OOM errors, GC pauses |
| 🧵 Race Condition Killer | Threading, async concurrency, race conditions, deadlocks |
| 💾 N+1 Slayer | Slow database queries, ORM performance, missing indexes |
| 💥 Chaos Engineer | Input hardening, resilience, stress testing, fuzzing |
| 🌐 Network Squeezer | API payload size, bandwidth, HTTP caching, serialization |
| 🏗️ CI/CD Accelerator | Build times, Docker, Webpack, GitHub Actions pipelines |
| 👁️ Telemetry | Observability, logging, tracing, production monitoring |
| 🎨 Frame-Rate Enforcer | UI rendering performance, React re-renders, CSS animations |

Each section is a phased methodology. Phases must be executed in sequence. Every section ends with a mandatory proof step — a before/after comparison table with real numbers.

### Global rules (enforced across all sections)

- Never suggest a code change for performance without benchmarking the existing code first.
- Every optimization must include a before/after comparison table.
- Prefer algorithmic improvements over micro-optimizations.
- If a proposed change does not measurably beat the baseline, discard it and try a different approach.
- Every final report must include a one-paragraph explanation of *why* the change is faster.

---

## Included Benchmarking Tools

The `tools/` directory contains cross-platform micro-benchmark runners that `CLAUDE.md` instructs Claude to use:

```
tools/
├── benchmark.py             # Python — timeit, outputs Average + P95 over 100 iterations
├── benchmark.js             # Node.js — perf_hooks, outputs Average + P95
├── Measure-Performance.ps1  # PowerShell — outputs Average + P95
└── benchmark.sh             # Bash/POSIX — outputs Average + P95
```

All runners include a warm-up phase. Results are discarded until the runtime is stable.

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
├── CLAUDE.md              ← The main artifact. Copy this into your project.
├── README.md
├── LICENSE                ← MIT
├── tools/                 ← Benchmark runners referenced by CLAUDE.md
│   ├── benchmark.py
│   ├── benchmark.js
│   ├── Measure-Performance.ps1
│   └── benchmark.sh
├── hooks/
│   └── pre-commit         ← Optional git hook
└── archive/               ← Original per-skill SKILL.md files (superseded by CLAUDE.md)
```

---

## Roadmap

- [x] Cross-platform benchmark runners (Python, Node.js, PowerShell, Bash)
- [x] All nine skills compiled into a single `CLAUDE.md`
- [x] Global rules and prohibited patterns section
- [ ] GitHub Actions workflow: run benchmarks on PRs, fail on P95 regression
- [ ] `.cursorrules` and Windsurf variants, kept in sync with `CLAUDE.md`

---

## License

[MIT](LICENSE) — use it, fork it, adapt it.

---

*Built for developers who demand blazing-fast software.*
