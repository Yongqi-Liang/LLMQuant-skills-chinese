# LLMQuant Skills 中文翻译贡献指南

本仓库是 [LLMQuant/skills](https://github.com/LLMQuant/skills) 的中文翻译镜像，目标是将所有 Skill 文档、工作流及贡献文档翻译为简体中文，使中文用户能够无障碍地使用 LLMQuant Skills 进行金融分析。

## 翻译范围

| 优先级 | 内容                         | 说明                                         |
|--------|------------------------------|----------------------------------------------|
| P0     | `CONTRIBUTING.md`            | 贡献指南（本文件）                            |
| P1     | `skills/*/SKILL.md`          | 各类别 Skill 路由文件                         |
| P2     | `skills/*/workflows/*.md`    | 各工作流文件                                  |
| P3     | `templates/*.md`             | 模板文件                                      |
| P4     | `.github/` 下的模板与配置文档 | Issue/PR 模板等                               |

## 翻译原则

1. **直接替换**：翻译后直接覆盖原英文文件，不另建 `.zh-CN.md` 副本。
2. **术语保留英文**：以下内容保持原文不译：
   - 代码标识符：路径、文件名、命令、frontmatter 字段（如 `input_data_source`）
   - 产品名称：LLMQuant Data、LLMQuant Skills、Claude Code、Cursor、Codex 等
   - 协议/规范名称：Conventional Commits、MCP、OWASP 等
   - 金融代码：ticker 符号（如 `SPY`、`AAPL`）、合约代码
3. **术语统一**：同一术语在全文中保持一致，参考下方术语表。
4. **结构不变**：不改变原文的 Markdown 结构、链接、图片引用。
5. **意译优先**：在准确的前提下，使用自然流畅的中文表达，避免逐词直译。

## 术语表

| 英文                   | 中文             | 备注                                  |
|------------------------|------------------|---------------------------------------|
| Skill                  | Skill            | 不译为"技能"，保持英文                 |
| Workflow               | 工作流           |                                       |
| Category router        | 类别路由         |                                       |
| Frontmatter            | frontmatter      | 保持英文                              |
| Data capability        | 数据能力         |                                       |
| Evidence contract      | 证据契约         |                                       |
| Fallback               | 回退             |                                       |
| Guardrail              | 防护栏           |                                       |
| Stale data             | 过期数据         |                                       |
| Ticker                 | 标的 / ticker    | 视上下文选用                           |
| Agent                  | Agent            | 不译为"智能体"，保持英文               |
| Observation date       | 观察日期         |                                       |
| Filing period          | 报告期间         |                                       |

## 翻译工作流

1. **认领任务**：在 Issue 中标注要翻译的文件，避免重复劳动。
2. **翻译文件**：按上述原则将英文内容替换为中文。
3. **自检**：
   - 通读译文，确认术语一致性。
   - 确认代码块、链接、frontmatter 未被翻译。
   - 确认 Markdown 格式正确。
4. **提交 PR**：
   - 分支命名：`zh-CN/<文件名>`，如 `zh-CN/contributing`。
   - PR 标题格式：`docs(zh-CN): translate <文件名> to Chinese`。
   - 在 PR 描述中注明对应的 Issue 编号。
5. **审阅合并**：至少一位审阅者确认术语准确、行文流畅后合并。

## 注意事项

- 金融领域术语力求准确，有疑问时在 PR 中讨论，不要凭直觉翻译。
- 若原文有更新，译者需同步更新译文，保持与上游仓库一致。
- 本贡献指南本身也是翻译对象，翻译完成后此章节将更新为正式的翻译规范引用。

---

# LLMQuant Skills 官方贡献指南

LLMQuant Skills 是 LLMQuant Data 的工作流层。贡献的目标是让 Agent 更善于使用 LLMQuant Data——推理清晰、证据明确、输出可复现。

## 贡献内容

- **类别路由**：`skills/llmquant-*/SKILL.md` 文件，负责选择正确的工作流并执行 LLMQuant Data 契约。
- **工作流文件**：`workflows/*.md` 下可复现的研究、交易、风控或组合管理流程。
- **脚本**：类别目录下 `scripts/` 中的可选可执行辅助脚本。
- **资产**：`assets/` 下的模板、示例输出骨架及可复用资源。

## 必要契约

每个类别 Skill 必须包含：

- 文件夹名以 `llmquant-` 开头。
- 根目录下的 `SKILL.md` 路由文件，frontmatter 中声明 `input_data_source: LLMQuant Data`。
- 工作流索引，链接 `workflows/` 中的每个工作流。
- 路由规则，指引 Agent 仅加载相关的工作流。
- 数据需求以自然语言能力描述，而非在 frontmatter 中写死具体的 MCP 工具名称。
- 时效性规则：必须报告日期、报告期间、观察日期及数据过期提示。
- 回退规则：覆盖缺失、不支持的标的、无法获取的报告章节或数据过期时的处理方式。
- 防护栏：防止编造数据或得出无依据的结论。

每个工作流文件必须包含：

- 它所处理的用户意图。
- 必需和可选的数据能力，包括工作流需要但 LLMQuant Data 尚未提供的未来能力。
- 可复现的执行流程。
- 结构化的输出格式。
- 清晰的数据与推理边界。

## 文件布局

每个类别 Skill 使用一个独立文件夹：

```text
skills/llmquant-<category>/
├── SKILL.md
├── workflows/
│   └── <workflow-name>.md
├── scripts/
└── assets/
```

该类别文件夹是 Claude Code、Claude.ai、Cursor 和 Codex 的安装/导入单元。不要在 `skills/llmquant-*/` 之外添加独立的 `SKILL.md` 文件。

使用 `templates/SKILL_TEMPLATE.md` 作为类别路由模板，使用 `templates/WORKFLOW_TEMPLATE.md` 作为工作流文件模板。中文文档请优先维护仓库级的 `README.zh-CN.md`，而非为每个工作流单独复制一份中文翻译。

## 质量标准

优秀的工作流应当范围明确、可复现、以证据为先。审阅者应能回答以下问题：

- 这个工作流回答什么问题？
- 需要哪些数据能力？
- Agent 应按什么顺序获取或请求这些数据输入？
- 最终答案中必须展示哪些证据？
- 数据缺失时 Agent 应如何处理？
- 输出应该是什么样的？

避免模糊的提示词、笼统的投资建议，或依赖未声明数据的工作流。

## Pull Request 检查清单

- [ ] 类别文件夹命名为 `llmquant-*`。
- [ ] 根目录存在 `SKILL.md` 并路由到工作流。
- [ ] 工作流文件已在 `workflows/` 下添加或更新。
- [ ] 包含 `input_data_source: LLMQuant Data`。
- [ ] 必需的数据能力以自然语言描述。
- [ ] 缺失或未来的数据能力已明确标注。
- [ ] 时效性和回退行为已明确说明。
- [ ] 输出格式为结构化格式。
- [ ] 如新增、删除或重命名类别或重要工作流，README 表格已更新。

## PR 标题与提交规范

本仓库遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范。
GitHub Action（`.github/workflows/pr-title.yml`）会校验每个 PR 标题。如果仓库使用 squash merge，PR 标题将成为 `main` 分支上的 squash commit subject，因此只需 PR 标题遵循格式——分支上的各个 commit 不做强制要求。

### 格式

```
<type>(<scope>): <subject>
```

### 类型

| 类型         | 使用场景                                                      |
|--------------|---------------------------------------------------------------|
| `feat`       | 新增类别 Skill、工作流或数据能力                               |
| `fix`        | Skill、工作流或脚本中的 bug；损坏的链接；路由错误               |
| `docs`       | README、CONTRIBUTING、注释、模板                               |
| `refactor`   | 重构现有 Skill/工作流，不改变行为                               |
| `chore`      | 仓库维护、脚手架搭建、依赖升级                                  |
| `ci`         | 工作流配置、lint 配置                                          |
| `style`      | 格式调整、空白字符、纯排版变更                                  |

### 作用域（可选）

类别简称（`llmquant-*` 文件夹去掉前缀，如 `options`、`macro`、`crypto`），或跨领域标识：`templates` · `ci` · `infra` · `readme` · `zh-CN`。小型 PR 可省略作用域。

### 主题

- 使用祈使语气，首字母小写（`add`，而非 `Added`）。
- 末尾不加句号。
- 控制在约 72 个字符以内。

### 示例

- `feat(options): add iv-term-structure workflow`
- `fix(macro): correct fallback when CPI release is missing`
- `docs: add issue and PR templates`
- `ci: enforce conventional-commit PR titles`
