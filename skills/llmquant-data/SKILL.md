---
name: llmquant-data
description: LLMQuant Data 基础数据工作流的路由 Skill。当用户需要 SEC 报告、13F 持有人、宏观快照或基于数据源的宏观简报时使用。
input_data_source: LLMQuant Data
category: data
---

# LLMQuant Data

本类别将基础数据研究任务路由到专项工作流。当用户需要在更高层次的策略或组合分析之前，先获得 LLMQuant Data 支撑的直接答案时，使用本类别。

## 路由规则

1. 识别用户查询的实体、ticker、宏观指标、期间及期望交付物。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及其明确引用的本地资源。
4. 使用 LLMQuant Data 作为外部事实的数据来源。
5. 报告返回日期、报告期间、覆盖范围说明及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 审查公司 10-K 报告中的业务、风险及 MD&A 证据。 | [`workflows/10k-risk-review.md`](workflows/10k-risk-review.md) |
| 识别持有某 ticker 的顶级 13F 管理人及拥挤信号。 | [`workflows/ticker-smart-money-holders.md`](workflows/ticker-smart-money-holders.md) |
| 构建简洁的美国宏观机制快照。 | [`workflows/us-macro-snapshot.md`](workflows/us-macro-snapshot.md) |
| 基于宏观、市场及研究输入撰写面向市场的宏观简报。 | [`workflows/macro-brief.md`](workflows/macro-brief.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 读取 SEC 报告及具体报告章节，如业务、风险因素及 MD&A。
- 查询某 ticker 的 13F 持有人名单、管理人持仓及所有权集中度。
- 获取宏观指标快照、历史数据、发布日期及元数据。
- 获取市场价格、加密资产快照、研究知识及论文/维基背景（相关时）。

回退规则：
- 若 LLMQuant Data 或兼容的数据 MCP 不可用，请求用户提供数据或指明缺失输入。
- 仅使用已获取或用户提供的证据继续，并将推断内容单独标注。
