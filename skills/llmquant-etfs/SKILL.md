---
name: llmquant-etfs
description: LLMQuant ETF 工作流的路由 Skill。当用户需要 ETF 持仓、重叠度、集中度、发行人快照或主题敞口分析时使用。
input_data_source: LLMQuant Data
category: etfs
---

# LLMQuant ETF

本类别将 ETF 分析任务路由到持仓和敞口工作流。

## 路由规则

1. 识别 ETF ticker、比较范围、截止日期及所需输出。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开选中的工作流及所需本地资源。
4. 使用 LLMQuant Data 获取持仓、基金元数据、价格及覆盖范围说明。
5. 报告持仓 `as_of_date`、数据来源、过期标记、不支持的 ticker 及缺失字段。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 比较 ETF 持仓、重叠度、集中度及敞口。 | [`workflows/etf-overlap-report.md`](workflows/etf-overlap-report.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 查询 ETF 身份、发行人、类别、费率、市场价格、NAV 及覆盖状态。
- 获取 ETF 持仓及权重、标识符、行业、国家、数据来源及持仓截止日期。
- 比较 ETF 持仓重叠度、头部集中度及敞口分布。
- 获取价格历史、资金流历史及行业敞口历史（可用时）。

回退规则：
- 若持仓覆盖不支持，报告不支持的 ticker 及所需的 ETF 标识符。
- 若 LLMQuant Data 或兼容的数据 MCP 不可用，请用户提供发行人持仓文件或持仓表。
- 不得凭记忆近似估算持仓。
