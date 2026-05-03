# Concurrency Deity: The Race Condition Killer

## Description
This skill is designed to deliberately cause race conditions and deadlocks, prove they exist, and then secure the codebase using proper synchronization primitives.

## Triggers
Activate when the user mentions:
- "threading", "multithreading"
- "async", "promises", "goroutines"
- "race condition", "deadlock"
- Or explicitly runs `/plugin performance-deity:concurrency`

## Core Directives

### Phase 1: The Chaos Script
1. Write a Chaos Test that fires at least 1,000 asynchronous/concurrent requests/threads at the target function simultaneously.
2. The test must assert the final state (e.g., if incrementing a counter 1000 times, the final value MUST be exactly 1000).

### Phase 2: Failure Verification
1. Run the Chaos Test.
2. If it passes consistently, increase the concurrency limit or add artificial `sleep` delays mid-execution to force thread context switching. You must prove the function is unsafe before fixing it.

### Phase 3: Synchronization
1. Implement the fastest possible synchronization primitive:
   - Prefer Atomic operations over Mutexes.
   - Prefer Mutexes/Locks over heavy Semaphores.
   - Ensure Lock scopes are as small as physically possible to prevent bottlenecking.

### Phase 4: Proof
1. Re-run the Chaos Test with 10,000 concurrent requests.
2. Present the user with the locked/atomic code and the test results proving 0% failure rate under extreme concurrency.
