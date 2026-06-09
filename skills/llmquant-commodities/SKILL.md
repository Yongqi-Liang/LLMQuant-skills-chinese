---
name: llmquant-commodities
description: LLMQuant 大宗商品工作流的路由 Skill。当用户需要大宗商品现货、期货曲线、库存、展期收益或宏观联动分析时使用。
input_data_source: LLMQuant Data
category: commodities
---

# LLMQuant 大宗商品

本类别路由大宗商品研究与期货曲线工作流。即使部分大宗商品接口属于未来产品范围，也在此定义所需的 LLMQuant Data 输入。

## 路由规则

1. 识别商品品种、合约代码、地区、时间范围及输出目标。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及相关本地资源。
4. 使用 LLMQuant Data 获取现货、期货、库存、宏观、外汇及利率输入。
5. 报告合约日期、观察日期、数据来源覆盖范围及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 围绕价格、曲线、库存、宏观和股票市场构建大宗商品市场简报。 | [`workflows/commodity-market-lens.md`](workflows/commodity-market-lens.md) |
| 分析期货期限结构、展期收益、升水/贴水及曲线变动。 | [`workflows/futures-curve-monitor.md`](workflows/futures-curve-monitor.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取大宗商品现货或近月价格、近期变动、成交量及观察时间戳。
- 获取按合约月份排列的期货曲线，包括曲线形态、展期收益、成交量及持仓量。
- 获取库存、产量、需求、进出口、天气及大宗商品事件背景。
- 获取宏观指标、利率、外汇、通胀、增长及相关股票或 ETF 价格代理。

回退规则：
- 若大宗商品数据不可用，列出所需的具体输入，并仅使用可用的宏观、市场价格代理或股票证据继续。
- 不得凭记忆推断现货价格、库存或曲线形态。
