# Installation Guide

Performance Deity is built to work seamlessly with Claude Code, Cursor, and other Agentic IDEs.

## 1. Claude Code
To run locally without publishing:
```bash
claude --plugin-dir /path/to/performance-deity
```
Then use commands like `/plugin performance-deity:optimize`

## 2. Cursor
In Cursor Agent chat, simply mention the repository files:
> "@performance-deity/README.md Please read this methodology and apply the performance-deity:optimize skill to my code."

## 3. GitHub Copilot & OpenCode
You can manually instruct the agent to fetch the rules from your repository:
> "Fetch and follow the instructions from https://raw.githubusercontent.com/v0idOS/performance-deity/main/skills/performance-deity/SKILL.md"
