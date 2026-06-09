---
name: llmquant-equity-derivatives
description: LLMQuant 股票衍生品工作流的路由 Skill。当用户需要单股衍生品、可转债、权证、结构化收益或混合证券分析时使用。
input_data_source: LLMQuant Data
category: equity-derivatives
---

# LLMQuant 股票衍生品

本类别路由单股衍生品和混合证券工作流，覆盖收益结构、期权性、稀释、借贷成本、波动率及催化剂匹配。

## 路由规则

1. 识别标的 ticker、衍生品类型、到期日、行权价/转换条款及目标。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及相关本地资源。
4. 使用 LLMQuant Data 获取标的价格、期权链、波动率、借贷成本、公司行为、可转债及权证数据。
5. 报告合约条款、估值日期、假设条件、过期提示及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 构建单股衍生品交易手册，包含收益结构、Greeks、催化剂及风险。 | [`workflows/single-stock-derivative-playbook.md`](workflows/single-stock-derivative-playbook.md) |
| 分析可转债、权证或混合股权挂钩证券。 | [`workflows/convertible-and-warrant-lens.md`](workflows/convertible-and-warrant-lens.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取标的股票价格、实现波动率、回撤、流动性及公司行为。
- 获取期权链、隐含波动率历史、Greeks、借贷成本及事件日历。
- 获取可转债、权证、配股权及混合证券的条款说明书，包括行权价、到期日、转换、赎回及反稀释条款。
- 获取信用背景、发行人基本面及报告证据（相关时）。

回退规则：
- 若衍生品条款不可用，说明所需的具体条款说明书字段，不得凭记忆估算。
