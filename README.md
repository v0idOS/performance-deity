# Performance Deity ⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**A performance engineering plugin for Claude Code — and a `CLAUDE.md` template for any AI coding assistant.**

Nine benchmark-driven skills that enforce a strict, phased performance methodology. Every skill requires proof before presenting a change: a before/after table with real numbers. No guessing.

---

## Install via Claude Code Plugin

```
/plugin marketplace add https://github.com/v0idOS/performance-deity
/plugin install performance-deity@performance-deity
```

This gives you nine slash commands in Claude Code:

| Command | What it does |
|---|---|
| `/optimize` | Benchmarks, analyzes Big-O, rewrites, proves improvement |
| `/memory` | Instruments memory, proves the leak grows, fixes the reference |
| `/concurrency` | Fires 1k–10k concurrent requests, proves failure, adds atomic ops |
| `/database` | Runs EXPLAIN ANALYZE, kills N+1 loops, provides CREATE INDEX statements |
| `/stress-test` | Bombards code with extreme inputs, documents crashes, hardens the boundary |
| `/network` | Profiles payload bytes, enforces Brotli/ETag, migrates to GraphQL/protobuf |
| `/build` | Fixes Docker layer order, Webpack caching, GitHub Actions pipelines |
| `/telemetry` | Wraps code in OpenTelemetry spans, proposes concrete alert rules |
| `/ui` | Audits React re-renders, GPU-accelerates animations, virtualizes long lists |

---

## Or: Drop One File (No Plugin Required)

If you're not using Claude Code's plugin system, copy `CLAUDE.md` directly into your project root. Claude Code reads it automatically on every session — no flags, no config.

```bash
git clone https://github.com/v0idOS/performance-deity
cp performance-deity/CLAUDE.md /your/project/CLAUDE.md
```

For Cursor or Windsurf:

```bash
cp performance-deity/CLAUDE.md /your/project/.cursorrules
```

---

## Global Rules (Enforced by Both Methods)

- Never suggest a code change for performance without benchmarking the existing code first.
- Every optimization must include a before/after comparison table with real numbers.
- Prefer algorithmic improvements over micro-optimizations.
- If a proposed change does not measurably beat the baseline, discard it and try a different approach.
- Every final report must explain *why* the change is faster, grounded in CPU architecture, memory layout, or I/O behavior.

---

## Included Benchmarking Tools

```
tools/
├── benchmark.py             # Python — timeit, outputs Average + P95 over 100 iterations
├── benchmark.js             # Node.js — perf_hooks, outputs Average + P95
├── Measure-Performance.ps1  # PowerShell — outputs Average + P95
└── benchmark.sh             # Bash/POSIX — outputs Average + P95
```

All runners include a warm-up phase. Results are not recorded until the runtime is stable.

---

## Pre-Commit Hook (Optional)

Blocks commits containing unresolved `TODO: optimize` markers:

```bash
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

---

## Repo Structure

```
.
├── CLAUDE.md                   ← Drop-in template for any AI assistant
├── README.md
├── LICENSE                     ← MIT
├── .claude-plugin/
│   ├── plugin.json             ← Plugin manifest (Claude Code plugin system)
│   └── marketplace.json        ← Marketplace catalog (buildwithclaude.com)
├── skills/                     ← Slash command skill files (Claude Code plugin)
│   ├── optimize/SKILL.md
│   ├── memory/SKILL.md
│   ├── concurrency/SKILL.md
│   ├── database/SKILL.md
│   ├── stress-test/SKILL.md
│   ├── network/SKILL.md
│   ├── build/SKILL.md
│   ├── telemetry/SKILL.md
│   └── ui/SKILL.md
├── tools/                      ← Benchmark runners
│   ├── benchmark.py
│   ├── benchmark.js
│   ├── Measure-Performance.ps1
│   └── benchmark.sh
├── hooks/
│   └── pre-commit              ← Optional git hook
└── archive/                    ← Original SKILL.md files (pre-refactor)
```

---

## Roadmap

- [x] Cross-platform benchmark runners (Python, Node.js, PowerShell, Bash)
- [x] All nine skills in a single `CLAUDE.md`
- [x] Claude Code plugin with proper `marketplace.json` and slash commands
- [x] MIT license
- [ ] GitHub Actions workflow: run benchmarks on PRs, fail on P95 regression
- [ ] `.cursorrules` variant maintained in sync with `CLAUDE.md`

---

## License

[MIT](LICENSE)

---

*Built for developers who demand blazing-fast software.*
