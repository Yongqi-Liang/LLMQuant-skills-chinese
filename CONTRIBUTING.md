# Contributing to LLMQuant Skills

LLMQuant Skills is the workflow layer for LLMQuant Data. Contributions should make agents better at using LLMQuant Data with clear reasoning, explicit evidence, and reproducible outputs.

## What To Contribute

- **Category routers**: `skills/llmquant-*/SKILL.md` files that choose the right workflow and enforce the LLMQuant Data contract.
- **Workflow files**: repeatable research, trading, risk, or portfolio procedures under `workflows/*.md`.
- **Scripts**: optional executable helpers under a category `scripts/` directory.
- **Assets**: templates, sample output skeletons, and reusable resources under `assets/`.

## Required Contract

Every category skill must include:

- A folder name beginning with `llmquant-`.
- A root `SKILL.md` router with `input_data_source: LLMQuant Data` frontmatter.
- A workflow index linking every workflow in `workflows/`.
- Routing rules that tell the agent to load only the relevant workflow.
- Data requirements described as natural-language capabilities, not exact MCP tool names in frontmatter.
- Freshness rules: dates, filing periods, observation dates, and stale-data notices must be reported.
- Fallback rules for missing coverage, unsupported tickers, unavailable filing sections, or stale data.
- Guardrails that prevent invented data or unsupported conclusions.

Every workflow file must include:

- The user intent it handles.
- Required and optional data capabilities, including future LLMQuant Data capabilities if the workflow needs data not yet exposed.
- A repeatable procedure.
- A structured output format.
- Clear data and reasoning boundaries.

## File Layout

Use one folder per category skill:

```text
skills/llmquant-<category>/
├── SKILL.md
├── workflows/
│   └── <workflow-name>.md
├── scripts/
└── assets/
```

The category folder is the install/import unit for Claude Code, Claude.ai, Cursor, and Codex. Do not add standalone `SKILL.md` files outside `skills/llmquant-*/`.

Use `templates/SKILL_TEMPLATE.md` for a category router and `templates/WORKFLOW_TEMPLATE.md` for a workflow file. For Chinese documentation, maintain the repo-level `README.zh-CN.md` first rather than duplicating every workflow.

## Quality Bar

Good workflows are narrow, repeatable, and evidence-first. A reviewer should be able to answer:

- What question does this workflow answer?
- Which data capabilities does it need?
- What order should the agent retrieve or request those data inputs in?
- What evidence must be shown in the final answer?
- What should the agent do when data is missing?
- What should the output look like?

Avoid vague prompts, generic investment advice, or workflows that rely on unstated data.

## Pull Request Checklist

- [ ] Category folder is named `llmquant-*`.
- [ ] Root `SKILL.md` exists and routes to the workflow.
- [ ] Workflow file added or updated under `workflows/`.
- [ ] `input_data_source: LLMQuant Data` is present.
- [ ] Required data capabilities are described in natural language.
- [ ] Missing or future data capabilities are explicitly named.
- [ ] Freshness and fallback behavior are explicit.
- [ ] Output format is structured.
- [ ] README tables are updated if a category or major workflow is added, removed, or renamed.
