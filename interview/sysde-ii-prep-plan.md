# 📅 Updated 14‑Day SysDE II Prep Schedule

You’re not going to become fluent in AWS-native reliability language in two weeks. That’s a multi‑year transition. What you _can_ do in that time is build a working mental model of distributed systems trade‑offs, so you stop sounding like an embedded engineer trying to bluff cloud scale. Grokking is a structured way to do that.

---

## Prioritized System Design Plan (next 10–14 days)

1. **Days 1–3:** Caching, load balancing, queues/streams.
2. **Days 4–6:** Database scaling (partitioning, replication, indexes) + CAP/PACELC theorem.
3. **Days 7–9:** Monitoring, fault tolerance, incident response, quorum, leader/follower.
4. **Days 10–12:** Trade‑offs section (consistency models, latency vs throughput, batch vs stream, stateful vs stateless).
5. **Days 13–14:** Full mock designs + polish 3 resume stories in cloud dialect (CI/CD, TVAC bug, multi‑target automation).

---

## 80/20 Split System Design/Coding Plan

- **Daily (1–2 hrs):** Grokking modules (caching, partitioning, CAP/PACELC, monitoring, trade‑offs).
- **Daily (30–45 min):** One SysDE‑relevant LeetCode problem (arrays, strings, hash maps, parsing, simple graph traversal).
- **Weekly (2x):** Full mock system design prompt aloud (URL shortener, telemetry pipeline, monitoring system).
- **Weekly (1x):** Behavioral story drill (CI/CD, TVAC bug, multi‑target automation).

---

### Week 1 — Build Foundations

| **Day** | **Grokking Focus**                                                                  | **LeetCode Problem**                                                                                                               |
| ------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Day 1   | Caching basics (TTL, invalidation, write-through vs write-back)                     | [1. Two Sum](https://leetcode.com/problems/two-sum/)                                                                               |
| Day 2   | Load balancing (round robin, consistent hashing)                                    | [706. Design HashMap](https://leetcode.com/problems/design-hashmap/)                                                               |
| Day 3   | Queues & streams (producer/consumer, backpressure)                                  | [232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/)                                   |
| Day 4   | Database partitioning & replication (sharding, indexes)                             | [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)                                                         |
| Day 5   | CAP theorem + PACELC trade-offs                                                     | [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/) |
| Day 6   | Monitoring & fault tolerance (metrics, alerts, chaos testing)                       | [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)                                                          |
| Day 7   | Full mock design: URL shortener (tie caching + partitioning + consistency together) | [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)                                         |

---

### Week 2 — Apply & Stress-Test

| **Day** | **Grokking Focus**                                                                                 | **LeetCode Problem**                                                                             |
| ------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Day 8   | Incident response drill (cache collapse → DB overload)                                             | [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)             |
| Day 9   | Deployment strategies (canary, rollback, blue/green)                                               | [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)                   |
| Day 10  | Fault isolation & blast radius containment (leader/follower, quorum)                               | [133. Clone Graph](https://leetcode.com/problems/clone-graph/)                                   |
| Day 11  | Streaming pipelines (telemetry/log ingestion, batch vs stream trade-offs)                          | [388. Longest Absolute File Path](https://leetcode.com/problems/longest-absolute-file-path/)     |
| Day 12  | Reliability trade-offs (latency vs throughput, stateful vs stateless, durability vs cost)          | [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/)                             |
| Day 13  | Full mock design: monitoring system for millions of metrics                                        | [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/) |
| Day 14  | Final drill: rehearse 3 resume stories in cloud dialect (CI/CD, TVAC bug, multi-target automation) | [767. Reorganize String](https://leetcode.com/problems/reorganize-string/)                       |

---

## Brutal Guidance

- **Stop grinding random LeetCode.** Only hit the curated SysDE‑relevant set.
- **Anchor every Grokking concept to embedded analogies.** That’s your translation layer.
- **End each day with a 2‑minute LP story rehearsal.** Build muscle memory for behavioral rounds.
- **Mock designs twice per week.** Practice aloud, narrating trade‑offs clearly.

---

## 🎯 Bonus SysDE-Relevant Coding Problem Types with Direct LeetCode Links

| **Category**                     | **Why It Matters for SysDE**                            | **Example Problems (Direct LeetCode Links)**                                                                                                                                                                                                                                                                           |
| -------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **String & Log Parsing**         | Log parsing, config validation, anomaly detection.      | [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/) · [165. Compare Version Numbers](https://leetcode.com/problems/compare-version-numbers/) · [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)                                                                           |
| **Hash Maps / Sets**             | Fast lookups, deduplication, frequency counts.          | [706. Design HashMap](https://leetcode.com/problems/design-hashmap/) · [771. Jewels and Stones](https://leetcode.com/problems/jewels-and-stones/) · [1. Two Sum](https://leetcode.com/problems/two-sum/)                                                                                                               |
| **Arrays & Sliding Windows**     | Monitoring metrics, rolling averages, rate limiting.    | [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/) · [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/) · [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/) |
| **Queues & Stacks**              | Message processing, backpressure, scheduling.           | [225. Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues/) · [232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/) · [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)                                        |
| **Graphs (basic traversal)**     | Service dependency mapping, routing, failure isolation. | [200. Number of Islands](https://leetcode.com/problems/number-of-islands/) · [133. Clone Graph](https://leetcode.com/problems/clone-graph/) · [207. Course Schedule](https://leetcode.com/problems/course-schedule/)                                                                                                   |
| **Scheduling / Priority Queues** | Resource allocation, job scheduling, incident triage.   | [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/) · [767. Reorganize String](https://leetcode.com/problems/reorganize-string/) · [373. Find K Pairs with Smallest Sums](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/)                                                             |
| **File/Stream Processing**       | Automation scripts, parsing structured data.            | [388. Longest Absolute File Path](https://leetcode.com/problems/longest-absolute-file-path/) · [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/) · [415. Add Strings](https://leetcode.com/problems/add-strings/)                                                       |
