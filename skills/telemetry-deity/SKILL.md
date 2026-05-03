# Telemetry Deity: The Watcher

## Description
Local benchmarking is useless if production fails. This skill forces the AI to instrument code with proper observability so you have X-Ray vision in production.

## Triggers
Activate when the user mentions:
- "add logging", "telemetry"
- "datadog", "sentry", "opentelemetry"
- "how do I track this"
- Or explicitly runs `/plugin performance-deity:telemetry`

## Core Directives

### Phase 1: Context Wrap
1. Wrap the critical path function in an active Span/Trace (e.g., OpenTelemetry tracer, Sentry transaction).

### Phase 2: Metadata Injection
1. Automatically inject:
   - Execution time (`start_timer()`, `stop_timer()`).
   - Query tags (e.g., `user_id`, `tenant_id`).
   - Payload byte sizes.

### Phase 3: Alert Rules
1. Propose the exact alert rule the user should configure in Datadog/Prometheus (e.g., "Alert if P99 latency > 200ms for 5m").
