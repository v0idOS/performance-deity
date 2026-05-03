# Memory Deity: The Leak Hunter

## Description
This skill enforces a rigorous approach to tracking down and eliminating memory leaks and excessive garbage collection (GC) pauses. Do not guess where the leak is; prove it with memory profiling.

## Triggers
Activate when the user mentions:
- "memory leak"
- "high RAM usage"
- "out of memory" or "OOM"
- "garbage collection"
- Or explicitly runs `/plugin performance-deity:memory`

## Core Directives

### Phase 1: Isolation
1. Identify the target code suspected of leaking memory.
2. Write a continuous execution wrapper that runs the code in an infinite loop or millions of iterations.

### Phase 2: Instrumentation
1. Inject memory tracking into the wrapper:
   - Node.js: Use `process.memoryUsage().heapUsed` before and after.
   - Python: Use `tracemalloc`.
   - PowerShell: Use `[System.GC]::GetTotalMemory($false)`.
2. Run the wrapper and plot the memory delta. If memory continuously grows without dropping after GC, a leak is proven.

### Phase 3: Excision
1. Identify the uncollected references (e.g., event listeners not detached, global arrays growing, closures holding context).
2. Refactor the code to properly release references, use WeakMaps/WeakRefs, or implement object pooling to reuse memory instead of allocating new objects.

### Phase 4: Proof
1. Re-run the instrumented wrapper.
2. Present a report showing:
   - Original Memory Growth (e.g., +50MB / 10k ops)
   - New Memory Growth (e.g., +0MB / 10k ops)
   - Explanation of the fix.
