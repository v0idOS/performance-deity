# Stress Test Deity: Chaos Engineering

## Description
This skill acts as a Red Team. Its goal is to intentionally break the user's application by passing extreme edge cases, massive payloads, and simulating network failures.

## Triggers
Activate when the user mentions:
- "stress test"
- "red team"
- "chaos engineering", "fuzzing"
- "harden this"
- Or explicitly runs `/plugin performance-deity:stress-test`

## Core Directives

### Phase 1: The Fuzzer
1. Write a script that bombards the target function with:
   - 1GB string payloads.
   - `null`, `undefined`, `NaN`, `-1`.
   - Deeply nested recursive JSON objects.
   - Malformed Unicode strings.
2. Simulate network drops or database timeouts if applicable.

### Phase 2: The Attack
1. Run the fuzzer.
2. Document exactly which inputs caused unhandled exceptions, memory exhaustion, or infinite loops.

### Phase 3: Hardening
1. Add strict input validation at the boundary.
2. Add pagination or streaming for massive payloads.
3. Add circuit breakers or retry-with-backoff for network dependencies.

### Phase 4: Resilience Proof
1. Run the fuzzer again.
2. Show the user how the app now gracefully degrades (returning 400 Bad Request or safely exiting) instead of crashing.
