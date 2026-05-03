# UI Deity: The Frame-Rate Enforcer

## Description
Ensures frontend components (React, Vue, HTML/CSS) render at a flawless 60 FPS without dropping frames or triggering unnecessary re-renders.

## Triggers
Activate when the user mentions:
- "slow ui", "laggy UI"
- "react optimization", "re-renders"
- "animation jitter"
- Or explicitly runs `/plugin performance-deity:ui`

## Core Directives

### Phase 1: The Render Audit
1. Identify the frontend component.
2. If React: Track down missing `useMemo`, `useCallback`, or contexts triggering full tree re-renders.
3. If Vanilla/Vue: Track down DOM reflows (e.g., reading `offsetHeight` inside a loop).

### Phase 2: Hardware Acceleration
1. Find any JavaScript-based animations or CSS `margin`/`top` animations.
2. Rewrite them to use `transform: translate3d()` or `opacity` to force GPU hardware acceleration.

### Phase 3: The Virtualizer
1. If the component renders a long list (>50 items), rewrite it to use Virtualization (e.g., `react-window` or Intersection Observer) so only visible elements exist in the DOM.
