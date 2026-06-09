---
name: llmquant-crypto
description: LLMQuant 加密资产工作流的路由 Skill。当用户需要加密资产市场机制分析、代币研究、永续合约资金费率、基差、杠杆、流动性或跨资产加密背景分析时使用。
input_data_source: LLMQuant Data
category: crypto
---

# LLMQuant 加密资产

本类别路由加密资产研究与交易背景工作流，覆盖市场机制、代币级尽调及永续合约资金费率或基差监控。

## 路由规则

1. 识别资产、链、交易所、时间范围、基准及决策需求。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及其引用的本地资源。
4. 使用 LLMQuant Data 获取加密资产价格、流动性、资金费率、持仓量、链上背景、宏观、ETF 及风险输入。
5. 报告时间戳、交易所覆盖范围、观察窗口、过期提示及不可用的未来输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 诊断涵盖 BTC、ETH、主流币、流动性、杠杆及宏观的加密市场机制。 | [`workflows/crypto-market-regime.md`](workflows/crypto-market-regime.md) |
| 构建代币或协议研究备忘录，涵盖代币经济学、使用量、估值及风险证据。 | [`workflows/crypto-token-research.md`](workflows/crypto-token-research.md) |
| 监控永续合约资金费率、基差、持仓量及杠杆拥挤度。 | [`workflows/crypto-perp-funding-monitor.md`](workflows/crypto-perp-funding-monitor.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取加密资产现货价格、OHLCV 历史、实现波动率、回撤、相关性及流动性。
- 获取永续合约资金费率、基差、持仓量、爆仓、交易所资金流及交易所级别时间戳。
- 获取代币供应量、解锁计划、协议使用量、收入、TVL、持有人集中度、治理及安全风险背景。
- 获取影响加密资产风险偏好的宏观、利率、流动性、ETF 及股票市场输入。

回退规则：
- 若链上、资金费率或交易所级别数据不可用，指明缺失输入，并仅使用可用的价格、宏观或用户提供的证据继续。
- 不得凭记忆推断实时资金费率、流动性、TVL 或持有人行为。
