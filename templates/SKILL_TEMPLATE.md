---
name: llmquant-category-name
description: LLMQuant 类别工作流的路由 Skill。当用户需要……时使用。
input_data_source: LLMQuant Data
category: category-name
---

# LLMQuant 类别名称

这是 `llmquant-category-name` 类别的路由 Skill。它从 `workflows/` 中选择正确的工作流，并确保所有外部证据均来源于 LLMQuant Data。

## 路由规则

1. 识别用户的任务、资产标识、时间范围及期望输出。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开选中的工作流及其引用的本地资源。
4. 使用 LLMQuant Data 作为外部事实的数据来源。
5. 报告数据日期、报告期间、过期提示及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 描述第一个支持的任务。 | [`workflows/example-workflow.md`](workflows/example-workflow.md) |

## LLMQuant Data 契约

本类别可能需要的数据能力：
- 用自然语言描述所需的市场、报告、持仓、宏观、期权、组合或风险数据。
- 由 Agent 路由到当前可用的 LLMQuant Data MCP 工具或兼容的数据 MCP 工具。

未来或可选的数据能力：
- 描述尚未可用但能提升工作流效果的目标数据能力。

回退规则：
- 若 LLMQuant Data 未返回某项必需输入，指明缺失的输入，并仅使用已获取的证据继续。
- 不得凭记忆或第三方来源填补缺失值。

## 输出要求

每个工作流的回复应包含：

1. 结论或建议
2. 证据表
3. 风险与注意事项
4. 所用数据，包括日期和覆盖范围说明
