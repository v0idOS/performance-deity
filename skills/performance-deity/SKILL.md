# Performance Deity: Hot-Path Optimization

## Description
This skill enforces a rigorous, math-driven approach to code optimization. The agent is forbidden from guessing what makes code faster. It must prove it through benchmarking.

## Triggers
Activate this skill whenever the user asks to:
- "optimize" a function, file, or script.
- "speed up" or "refactor for speed".
- "benchmark" or "profile" a specific workflow.
- Or explicitly runs the command `/plugin performance-deity:optimize`

## Core Directives

When activated, you (the agent) MUST follow these exact steps sequentially. **Do not skip any steps.**

### Phase 1: Establish Baseline
1. Identify the target code the user wants to optimize.
2. Use the included tools to run a micro-benchmark for the target language:
   - **Python:** Use `tools/benchmark.py "<code snippet>"`
   - **Node/JS:** Use `node tools/benchmark.js "<code snippet>"`
   - **PowerShell:** Use `tools/Measure-Performance.ps1 -Command "<cmd>"`
   - **Bash/Shell:** Use `bash tools/benchmark.sh "<cmd>"`
   - If the language isn't supported by these tools, write a custom micro-benchmark script that calculates Average and P95.
3. Execute the benchmark. Ensure there is a "warm up" phase. Record the `P95` and `Average` execution time over at least 100 iterations.
4. **Report the baseline** to the user. Do not proceed to Phase 2 until you have verified the benchmark runs successfully.

### Phase 2: Algorithmic Analysis
1. Analyze the Time Complexity (Big-O) of the current implementation.
2. Analyze the Space Complexity (Memory allocations).
3. Explicitly identify the bottleneck. State it clearly (e.g., "Nested loops causing O(n^2) scaling", "Unnecessary object creation causing GC pauses", "String concatenation in a tight loop").

### Phase 3: Recursive Refactoring
1. Rewrite the code using a more efficient algorithm or data structure. 
2. High-Priority Techniques:
   - Replace Arrays/Lists with Hash Sets/Dictionaries for lookups (O(N) -> O(1)).
   - Vectorization or batching instead of individual processing.
   - Caching/Memoization of expensive calculations.
   - Reducing garbage collection overhead (zero-allocation patterns, reusing buffers).
   - Bitwise operations where mathematically applicable.
3. Run the micro-benchmark on your *new* code.
4. **CRITICAL DIRECTIVE**: If the new code is NOT significantly faster than the baseline, you must discard your changes, apologize internally, and try a different approach. Do not present failed optimizations to the user.

### Phase 4: Final Proof
1. Present the final, optimized code to the user.
2. Output a **Performance Report** table comparing the:
   - Baseline Execution Time
   - New Execution Time
   - Percentage Improvement (%)
3. Briefly explain *why* the new code is faster based on CPU architecture or memory layout.
