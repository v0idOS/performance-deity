---
description: Reduce API payload sizes and network latency. Profiles byte sizes, enforces compression and HTTP caching, and migrates heavy endpoints to GraphQL or protobuf when warranted.
---

Execute all four phases in order.

## Phase 1 — Payload Profiling

1. Identify the API endpoint.
2. Measure the raw JSON response size in bytes.
3. Identify the nested or repeated structures contributing the most bytes.

## Phase 2 — Compression & Caching

1. Check response headers. Verify `Content-Encoding: gzip` or `Content-Encoding: br` is present. If not, enable it server-side.
2. Add HTTP caching headers:
   - `Cache-Control: max-age=<N>, stale-while-revalidate=<N>`
   - `ETag` for conditional GET support

## Phase 3 — Serialization

If the payload exceeds 1MB:
- Migrate to GraphQL so clients request only the fields they need, or
- Migrate to Protocol Buffers (protobuf) for binary serialization.
- For real-time data, use Server-Sent Events or WebSockets to eliminate repeated full-payload polling.

## Phase 4 — Report

| Metric | Before | After |
|---|---|---|
| Payload size | X KB | Y KB |
| Transfer time (3G sim) | Xms | Yms |
| Cache hit rate | 0% | Z% |
