---
description: Fix UI rendering performance issues. Audits React re-renders, migrates animations to GPU-composited CSS properties, and virtualizes long lists. Target is 60 FPS.
---

Execute all three phases in order.

## Phase 1 — Render Audit

**React:**
- Find components re-rendering when no props changed → wrap with `React.memo`.
- Find inline function or object literals in JSX props (new reference on every render) → extract with `useCallback` or `useMemo`.
- Find Context providers causing full subtree re-renders → split into separate contexts by update frequency.

**Vanilla JS / Vue:**
- Find DOM reads (`offsetHeight`, `getBoundingClientRect`, `scrollTop`) inside loops. These force synchronous layout. Batch all reads before any writes.

## Phase 2 — GPU Acceleration

Find animations driven by:
- JavaScript timers changing `top`, `left`, or `margin`
- CSS transitions on `width`, `height`, `margin`, or `padding`

Rewrite to use:
- `transform: translate3d(x, y, 0)` — handled by the GPU compositor, triggers zero reflow.
- `opacity` — also compositor-only.
- `will-change: transform` on elements that animate on a known trigger.

## Phase 3 — Virtualization

If a component renders more than 50 list items, replace it with a virtualized list:
- **React:** `react-window` (`FixedSizeList` / `VariableSizeList`) or `@tanstack/react-virtual`.
- **Vanilla / Vue:** `IntersectionObserver` to mount items only when they enter the viewport.

Only visible DOM nodes exist in the document. All others are unmounted.

Target: 60 FPS measured in DevTools Performance panel with zero dropped frames during scroll.
