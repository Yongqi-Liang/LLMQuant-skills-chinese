---
name: llmquant-events
description: LLMQuant 事件工作流的路由 Skill。当用户需要财报事件简报、并购跟踪、监管风险、催化剂、事件日历或跨资产事件影响分析时使用。
input_data_source: LLMQuant Data
category: events
---

# LLMQuant 事件

本类别路由事件驱动研究工作流，覆盖财报、并购、监管催化剂及事件风险监控。

## 路由规则

1. 识别事件类型、发行人、资产、日期、司法管辖区、受影响工具及期望输出。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及其引用的本地资源。
4. 使用 LLMQuant Data 获取报告、价格、期权、预测、新闻、公司行为、监管记录、预测市场及宏观背景。
5. 报告事件日期、报告日期、数据时间戳、数据来源期间、过期提示及缺失输入。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 构建财报事件简报，包含布局、预期、期权及风险情景。 | [`workflows/earnings-event-brief.md`](workflows/earnings-event-brief.md) |
| 跟踪并购交易、交易价差、审批、融资及交割破裂风险里程碑。 | [`workflows/mna-event-tracker.md`](workflows/mna-event-tracker.md) |
| 监控监管、法律、政策、反垄断、FDA 或地缘政治事件风险。 | [`workflows/regulatory-risk-monitor.md`](workflows/regulatory-risk-monitor.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取事件日历、公司行为、报告、新闻、预测、电话会议记录及发行人概况。
- 获取价格历史、期权、隐含波动幅度、事件窗口收益率、成交量、波动率及情绪。
- 获取并购条款、交易里程碑、融资、监管审批、法院日期及反垄断记录（可用时）。
- 获取预测市场赔率、宏观发布、政策日历及跨资产背景（相关时）。

回退规则：
- 若事件专项数据不可用，指明缺失输入，避免依赖该数据的事件概率或价差结论。
- 不得编造日期、交易条款、法律截止日期或监管决定。
