---
name: llmquant-investor-lenses
description: LLMQuant 投资者视角工作流的路由 Skill。当用户需要基于 LLMQuant Data 证据的投资者风格推理叠加时使用。
input_data_source: LLMQuant Data
category: investor-lenses
---

# LLMQuant 投资者视角

本类别路由投资者风格推理叠加。命名工作流为分析视角，而非代表背书或复刻的声明。所有外部证据必须来源于 LLMQuant Data。

## 路由规则

1. 识别请求的投资者视角、ticker/资产、时间范围及决策类型。
2. 从下方索引中选择最匹配的工作流。
3. 仅打开该工作流及其明确引用的本地资源。
4. 使用 LLMQuant Data 获取报告、价格、基本面、所有权、宏观及估值证据。
5. 将证据与解读分开，避免无依据的人物风格断言。

## 工作流索引

| 用户意图 | 工作流 |
|---|---|
| 长期持有者视角：护城河、能力圈及安全边际。 | [`workflows/warren-buffett.md`](workflows/warren-buffett.md) |
| 量化价值与安全边际纪律。 | [`workflows/ben-graham.md`](workflows/ben-graham.md) |
| 多模型质量投资者，逆向验证纪律。 | [`workflows/charlie-munger.md`](workflows/charlie-munger.md) |
| Dhandho、克隆及低风险翻倍机会。 | [`workflows/mohnish-pabrai.md`](workflows/mohnish-pabrai.md) |
| 新兴市场复合增长及 ROE 优先选股。 | [`workflows/rakesh-jhunjhunwala.md`](workflows/rakesh-jhunjhunwala.md) |
| GARP、十倍股及简单可解释的业务。 | [`workflows/peter-lynch.md`](workflows/peter-lynch.md) |
| 定性增长及 scuttlebutt 式调研。 | [`workflows/phil-fisher.md`](workflows/phil-fisher.md) |
| 颠覆性创新、Wright 法则及指数级 TAM。 | [`workflows/cathie-wood.md`](workflows/cathie-wood.md) |
| 宏观流动性机制及不对称仓位管理。 | [`workflows/stanley-druckenmiller.md`](workflows/stanley-druckenmiller.md) |
| 集中激进价值及催化剂释放。 | [`workflows/bill-ackman.md`](workflows/bill-ackman.md) |
| 逆向深度价值及报告优先的 downside 分析。 | [`workflows/michael-burry.md`](workflows/michael-burry.md) |
| 尾部风险、杠铃策略、凸性及反脆弱思维。 | [`workflows/nassim-taleb.md`](workflows/nassim-taleb.md) |
| 故事加数字的估值纪律。 | [`workflows/aswath-damodaran.md`](workflows/aswath-damodaran.md) |
| 机械化巴菲特式业务、护城河、管理层及估值评分卡。 | [`workflows/warren-buffett-scorecard.md`](workflows/warren-buffett-scorecard.md) |
| 仅限卖方的优质业务期权框架。 | [`workflows/duan-yongping-seller.md`](workflows/duan-yongping-seller.md) |
| 周期位置进攻/防守信号。 | [`workflows/howard-marks-cycle.md`](workflows/howard-marks-cycle.md) |
| 罕见恐慌买入信号，面向流动性优质敞口。 | [`workflows/david-tepper-panic-signal.md`](workflows/david-tepper-panic-signal.md) |

## LLMQuant Data 契约

优先使用 LLMQuant Data。工作流可能需要以下数据能力：
- 获取报告、基本面、估值输入、市场价格、13F 所有权、宏观指标、期权背景、信用背景及情绪证据。
- 以带日期的证据支持投资者视角分析，而非人物风格断言。
- 保持已获取事实、用户假设及所选投资者框架之间的区分。

回退规则：
- 若某视角需要不可用的数据，指明缺失输入，并仅使用已获取或用户提供的证据继续。
- 不得编造引言、持仓、估值输入或传记声明。
