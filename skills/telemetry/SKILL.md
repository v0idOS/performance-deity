---
description: Add production observability to a function. Wraps it in an OpenTelemetry or Sentry trace span, injects execution metadata, and proposes a concrete alert rule with threshold and severity.
---

Execute all three phases in order.

## Phase 1 — Trace Wrap

Wrap the critical-path function in a trace span:

**OpenTelemetry:**
```js
tracer.startActiveSpan('operation.name', (span) => {
  // ... function body
  span.end();
});
```

**Sentry:**
```js
const transaction = Sentry.startTransaction({ name: 'operation.name' });
// ... function body
transaction.finish();
```

**Datadog:**
```js
tracer.trace('operation.name', () => {
  // ... function body
});
```

## Phase 2 — Attribute Injection

Inside the span, attach:
- Execution time (start and stop timer)
- Query tags: `user_id`, `tenant_id`, `endpoint`
- Input and output payload sizes in bytes

## Phase 3 — Alert Rule

Propose an alert rule with all four fields specified:

| Field | Value |
|---|---|
| Metric | (e.g. `trace.operation.duration`) |
| Threshold | (e.g. `> 200ms`) |
| Evaluation window | (e.g. `last 5 minutes`) |
| Severity | (e.g. P2 / warning) |

**Examples:**
- Datadog: `avg(last_5m):avg:trace.operation.duration{env:prod} > 0.200` → P2
- Prometheus: `histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m])) > 0.2` → warning
