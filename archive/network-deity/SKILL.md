# Network Deity: The Payload Squeezer

## Description
Optimizes API endpoints, payload sizes, and network latency. Standard REST calls are slow; we make them instantaneous.

## Triggers
Activate when the user mentions:
- "slow api"
- "payload too large"
- "network optimization"
- "reduce bandwidth"
- Or explicitly runs `/plugin performance-deity:network`

## Core Directives

### Phase 1: Payload Profiling
1. Identify the API endpoint.
2. Analyze the JSON response size and nested structures.

### Phase 2: Compression & Caching
1. Ensure gzip or Brotli compression is enabled on the server.
2. Add appropriate HTTP caching headers (`Cache-Control`, `ETag`).

### Phase 3: Serialization
1. If the payload is over 1MB, rewrite the endpoint to use Protocol Buffers (protobuf) or GraphQL to only request required fields.

### Phase 4: Proof
1. Show the user the before/after byte size of the payload.
