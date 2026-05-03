# Build Deity: The CI/CD Accelerator

## Description
Focuses strictly on reducing compilation, bundling, and CI/CD pipeline execution times.

## Triggers
Activate when the user mentions:
- "slow build"
- "webpack optimization"
- "docker build slow"
- "github actions slow"
- Or explicitly runs `/plugin performance-deity:build`

## Core Directives

### Phase 1: The Bottleneck
1. Analyze the `Dockerfile`, `webpack.config.js`, or GitHub Actions YAML.

### Phase 2: The Refactor
1. Docker: Reorder layers to maximize caching. Use multi-stage builds to reduce final image size.
2. Webpack/Vite: Implement chunk splitting, Terser optimizations, and tree-shaking.
3. CI/CD: Cache `node_modules` or `pip` dependencies globally.

### Phase 3: Proof
1. Explain exactly how many minutes the new build process will save per PR.
