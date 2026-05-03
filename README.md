# Performance Deity ⚡

**Performance Deity** is a complete algorithmic optimization methodology for your coding agents, built on top of a set of composable skills. It transforms your AI coding assistant from a standard code generator into an obsessive, world-class performance engineer.

## How it Works

When you tell your agent to optimize a piece of code, it doesn't just guess or apply random best practices. Instead, it activates the `performance-deity` workflow, which enforces a strict, data-driven approach to optimization:

1. **Baselines**: It automatically writes a micro-benchmark for the target code and profiles it to get a ground-truth execution time.
2. **Analyzes**: It calculates Big-O time and space complexity, identifying memory leaks, redundant loops, and GC bottlenecks.
3. **Refactors**: It rewrites the hot-path to be as fast as physically possible (e.g., swapping O(N) arrays for O(1) hash maps, reducing allocations).
4. **Proves**: It runs the benchmark again. If the new code isn't faster, the agent throws it away and tries again. It only presents the final code to you once it has **mathematical proof** of a performance increase.

## Installation

### Claude Code (Standalone)
You can run this plugin locally in your project without needing to publish it to a marketplace.

```bash
claude --plugin-dir /path/to/performance-deity
```

*(Note: To make it permanent for a project, you can copy the `skills/` and `tools/` directories into your project's local `.claude/` directory).*

## The Core Skill

- `performance-deity:optimize` - Activates when you ask to optimize, speed up, or benchmark code. Enforces the strict Profile -> Analyze -> Refactor -> Prove cycle. 

## Included Tooling

The plugin ships with an automated benchmarking suite:
- `tools/Measure-Performance.ps1`: A professional PowerShell benchmarking tool that warms up execution environments and calculates Average, Min, Max, and P95 execution times.

## Philosophy

- **Guessing is a sin.** Measure everything.
- **Micro-optimizations matter** in hot paths.
- **Algorithmic efficiency (Big-O)** beats language-level tricks.

---
*Built for developers who demand blazing-fast software.*
