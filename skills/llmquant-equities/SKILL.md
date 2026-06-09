---
name: llmquant-equities
description: LLMQuant 股票工作流的路由 Skill。当用户需要股票分析、股票比较、研究备忘录、并购套利备忘录或卖出/止盈分析时使用。
input_data_source: LLMQuant Data
category: equities
---

# LLMQuant 股票

本类别路由股票研究、比较、估值、催化剂及卖出纪律工作流。

## 路由规则

1. 识别 ticker、投资时间范围、基准及期望交付物。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开选中的工作流及所需本地资源。
4. 使用 LLMQuant Data 获取报告、价格、基本面、所有权、宏观、预测及事件数据。
5. 报告数据期间、报告日期、观察日期、过期提示及缺失的未来输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 从基本面、估值、技术面、情绪及资金流五个维度对股票评分。 | [`workflows/five-lens-stock-analysis.md`](workflows/five-lens-stock-analysis.md) |
| 并排比较 2-5 只股票或 ETF。 | [`workflows/equity-compare.md`](workflows/equity-compare.md) |
| 构建完整的股票研究备忘录。 | [`workflows/equity-research-memo.md`](workflows/equity-research-memo.md) |
| 构建以催化剂为锚的并购套利备忘录。 | [`workflows/merger-arb-memo.md`](workflows/merger-arb-memo.md) |
| 分析持有与系统化止盈规则。 | [`workflows/take-profit-lab.md`](workflows/take-profit-lab.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取股票价格、收益率、市值、成交量、技术指标及实现波动率。
- 获取公司基本面、预测、估值倍数、同业背景及公司事件。
- 读取 SEC 报告及具体报告章节，包括业务、MD&A、风险及催化剂。
- 获取机构所有权、顶级持有人、管理人集中度及 13F 发起人背景。

回退规则：
- 若基本面、预测或事件数据不可用，指明缺失输入，并仅使用已获取或用户提供的证据继续。
