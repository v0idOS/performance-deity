---
description: Reduce CI/CD build times. Analyzes Dockerfiles, Webpack/Vite configs, and GitHub Actions workflows to identify the slowest step and apply targeted caching and build optimizations.
---

Execute all three phases in order.

## Phase 1 — Bottleneck

Analyze whichever config file applies:
- `Dockerfile`
- `webpack.config.js` / `vite.config.ts`
- `.github/workflows/*.yml`

Identify the single step that consumes the most wall-clock time.

## Phase 2 — Fix

**Docker:**
- Reorder layers: least-changing first (OS deps, runtime), most-changing last (app code).
- Use multi-stage builds: compile in a full image, copy only the output artifact into a minimal runtime image (e.g. `alpine`).

**Webpack / Vite:**
- Enable code splitting and tree-shaking.
- Enable `TerserPlugin` with `parallel: true`.
- Set `cache: { type: 'filesystem' }` for persistent build caching.

**GitHub Actions:**
- Cache `node_modules` using `actions/cache` keyed on the hash of `package-lock.json`.
- Cache `pip` packages keyed on the hash of `requirements.txt`.
- Add `concurrency:` groups to cancel in-progress runs on force-push.

## Phase 3 — Report

State: "This change will save approximately X minutes per PR run" with explicit reasoning.

| Step | Before | After | Saved |
|---|---|---|---|
| Dependency install | Xmin | Ymin | Zmin |
| Build / compile | Xmin | Ymin | Zmin |
| Total pipeline | Xmin | Ymin | Zmin |
