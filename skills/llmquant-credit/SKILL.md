---
name: llmquant-credit
description: LLMQuant 信用工作流的路由 Skill。当用户需要发行人信用审查、利差机制分析、高收益压力监控、违约风险、债务到期或条款分析时使用。
input_data_source: LLMQuant Data
category: credit
---

# LLMQuant 信用

本类别路由信用研究工作流，覆盖发行人风险、利差机制及高收益压力分析。

## 路由规则

1. 识别发行人、ticker、债券、指数、行业、到期期限区间、信用评级及时间范围。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及其引用的本地资源。
4. 使用 LLMQuant Data 获取报告、债务计划、基本面、利率、利差、评级、股票价格、CDS 及宏观背景。
5. 报告报告日期、市场时间戳、评级日期、观察窗口、过期提示及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 审查发行人的资产负债表、现金流、到期债务及条款信用风险。 | [`workflows/issuer-credit-risk-review.md`](workflows/issuer-credit-risk-review.md) |
| 诊断信用利差机制、风险偏好及行业压力。 | [`workflows/credit-spread-regime.md`](workflows/credit-spread-regime.md) |
| 监控高收益压力、再融资风险、堕落天使及违约压力。 | [`workflows/high-yield-stress-monitor.md`](workflows/high-yield-stress-monitor.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取发行人报告、财务报表、债务计划、到期阶梯、业务敞口及风险因素。
- 获取债券、CDS、利差、评级、回收率、违约及行业信用数据（可用时）。
- 获取利率、收益率曲线、股票价格、波动率、流动性、宏观、大宗商品及外汇背景。
- 获取信用 ETF 及拥挤敞口的 ETF 持仓或资金流数据（可用时）。

回退规则：
- 若债券级别、CDS 或评级数据不可用，使用报告、股票、利率及宏观证据，同时指明缺失的信用市场输入。
- 不得在缺少必要条款和市场数据的情况下估算条款余量或违约概率。
