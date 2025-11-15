# 📅 14‑Day SysDE II Prep Schedule

You’re not going to become fluent in AWS-native reliability language in two weeks. That’s a multi‑year transition. What you _can_ do in that time is build a working mental model of distributed systems trade‑offs, so you stop sounding like an embedded engineer trying to bluff cloud scale. Grokking is a structured way to do that.

---

## The uncomfortable truth

- **You don’t know the vocabulary.** That’s fine. What kills candidates is pretending.
- **You do know reliability principles.** You’ve lived them in embedded/ground systems.
- **Your gap is translation.** You need to learn enough cloud-scale concepts to map your embedded rigor onto them.

If you walk into the loop without that translation layer, you’ll sound like a visitor. If you spend the next 1–2 weeks drilling Grokking, you’ll at least be able to say: _“In embedded we solved X this way; in cloud, the equivalent is Y. Here’s the trade‑off.”_ That’s credible.

---

## What SysDE II Loop Really Tests

- **Coding:** Yes, but not at the same depth as SDE II. They want to see you can script, automate, and reason cleanly — not grind dynamic programming puzzles.
- **System Design / Ops:** This is the core. Reliability, trade‑offs, incident response, automation.
- **Leadership Principles:** Every round probes them.
- **Troubleshooting:** Unique to SysDE — debugging broken systems, explaining mitigation.

---

## How to use Grokking strategically

Don’t binge it like a textbook. That’s a waste of time. Use it as a **translation bootcamp**:

1. **Pick 5 core patterns**:

   - [x] Load balancing
   - [ ] Caching
   - [ ] Queue/stream processing
   - [ ] Database sharding/replication
   - [ ] Monitoring/fault tolerance

2. **For each pattern:**

   - Learn the cloud vocabulary (e.g., cache invalidation, backpressure, canary deploy).
   - Write a one‑liner mapping to your embedded background.
     - Example: “Cache invalidation → same principle as refreshing telemetry buffers in embedded systems.”

3. **Practice aloud:**
   - Take one Grokking prompt (e.g., design a URL shortener).
   - Force yourself to narrate using both vocabularies: embedded analogy + cloud term.
   - That’s how you’ll sound genuine and adaptable.

---

## Prioritized System design plan (next 10–14 days)

1. **Days 1–3:** Grokking crash course on caching, load balancing, queues.
2. **Days 4–6:** Database scaling (sharding, replication) + CAP theorem.
3. **Days 7–9:** Monitoring, fault tolerance, incident response.
4. **Days 10–12:** Dry‑run 2–3 full system design prompts aloud.
5. **Days 13–14:** Polish 3 resume stories in cloud dialect (CI/CD, TVAC bug, multi‑target automation).

---

## 80/20 Split System Design/Coding Plan

- **Daily (1–2 hrs):** Grokking system design modules (caching, queues, sharding, monitoring).
- **Daily (30–45 min):** One coding problem in Python/C++ that maps to automation tasks (log parsing, deduplication, rate limiting).
- **Weekly (2x):** Full mock system design prompt aloud (URL shortener, telemetry pipeline, monitoring system).
- **Weekly (1x):** Behavioral story drill (CI/CD, TVAC bug, multi-target automation).

---

### Week 1 — Build Foundations

**Daily split:**

- **90 min Grokking** (system design concepts)
- **30–45 min LeetCode** (SysDE‑relevant problems)

| **Day** | **Grokking Focus**                                              | **LeetCode Problem**                                                                                                               |
| ------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Day 1   | Caching basics (TTL, invalidation, write-through vs write-back) | [1. Two Sum](https://leetcode.com/problems/two-sum/)                                                                               |
| Day 2   | Load balancing (round robin, consistent hashing)                | [706. Design HashMap](https://leetcode.com/problems/design-hashmap/)                                                               |
| Day 3   | Queues & streams (producer/consumer, backpressure)              | [232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/)                                   |
| Day 4   | Database replication & sharding                                 | [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)                                                         |
| Day 5   | CAP theorem & consistency trade-offs                            | [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/) |
| Day 6   | Monitoring & fault tolerance (metrics, alerts, chaos testing)   | [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)                                                          |
| Day 7   | Full mock design: URL shortener                                 | [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)                                         |

---

### Week 2 — Apply & Stress-Test

**Daily split:**

- **90 min Grokking** (mock designs + ops scenarios)
- **30–45 min LeetCode** (SysDE‑relevant problems)

| **Day** | **Grokking Focus**                                                                                 | **LeetCode Problem**                                                                             |
| ------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Day 8   | Incident response drill (cache collapse → DB overload)                                             | [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)             |
| Day 9   | Deployment strategies (canary, rollback, blue/green)                                               | [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)                   |
| Day 10  | Fault isolation & blast radius containment                                                         | [133. Clone Graph](https://leetcode.com/problems/clone-graph/)                                   |
| Day 11  | Streaming pipelines (telemetry/log ingestion)                                                      | [388. Longest Absolute File Path](https://leetcode.com/problems/longest-absolute-file-path/)     |
| Day 12  | Reliability trade-offs (latency vs durability vs cost)                                             | [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/)                             |
| Day 13  | Full mock design: monitoring system for millions of metrics                                        | [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/) |
| Day 14  | Final drill: rehearse 3 resume stories in cloud dialect (CI/CD, TVAC bug, multi-target automation) | [767. Reorganize String](https://leetcode.com/problems/reorganize-string/)                       |

---

## Opportunity Cost

- **LeetCode grind:**

  - Gains: marginal improvement in speed/fluency.
  - Cost: hours sunk into problems that won’t show up in SysDE loop.
  - Risk: you walk in fluent in algorithms but shallow in system design vocabulary — the exact gap you admitted.

- **Grokking focus:**
  - Gains: translation fluency, ability to speak cloud reliability language, confidence in design trade‑offs.
  - Cost: less algorithm practice.
  - Risk: you might stumble on a coding round if you haven’t touched problems in weeks.

---

## Brutal Recommendation

- **Stop grinding random LeetCode.** It’s diminishing returns for SysDE.
- **Do a surgical strike on coding prep:**
  - 30–45 minutes/day on _basic scripting problems_ (arrays, strings, hash maps, parsing, simple graph traversal).
  - Focus on clarity, testing, and communication — not obscure optimizations.
- **Put 80% of your time into Grokking/system design.** That’s where you’re weak, and that’s what will decide the loop.

---

## Brutal reality check

If you avoid Grokking and stick to embedded comfort, you’ll get exposed in the loop. If you grind Grokking smartly, you won’t be an expert, but you’ll be credible: someone who can pivot domains, reason about scale, and learn fast. That’s what they’re hiring for.

Here’s the hard truth: you don’t have time to do both at full tilt. You need to prioritize based on **what the SysDE II loop actually measures**.

---
