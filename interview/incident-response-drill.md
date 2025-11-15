Here’s a **tight 2‑minute incident response drill script** you can use in the SysDE troubleshooting round. This is the kind of scenario they’ll throw at you — a service breaking under load, and they want to see if you can think clearly, prioritize, and act decisively.

---

# 🎤 Incident Response Drill — Cache Collapse → DB Overload

**Question:** _Your service is throwing elevated 500s. Cache hit rate has dropped from 90% to 40%, and the database CPU is spiking. What do you do?_

**Answer Script (≈2 min):**

_"First, I’d confirm the signals: cache hit rate collapse, DB CPU spike, and elevated 500s. That tells me requests are bypassing the cache and hammering the database. My immediate priority is containment — reduce blast radius and restore stability._

_Step one: throttle or rate‑limit cold keys to prevent a thundering herd. Step two: temporarily increase cache TTLs to stabilize hot keys. Step three: enable request coalescing so multiple identical misses don’t all hit the DB. In parallel, I’d spin up read replicas to absorb the load and monitor p95 latency and error rate against our SLOs._

_Rollback criteria: if cache hit rate stays below 60% or DB CPU remains pegged for more than 15 minutes, I’d revert the last deploy and restore the previous cache config. Once stable, I’d dive deep into root cause — was it a bad deploy, eviction misconfig, or cache cluster failure? Finally, I’d document the incident, add guardrails to prevent mass eviction, and automate alerts on cache hit rate thresholds so we catch this earlier next time._

_The principle here is operational excellence: detect, contain, mitigate, and prevent. Reliability isn’t about avoiding failure — it’s about designing for recovery."_

---

## Why This Works

- **Structured:** Detect → Contain → Mitigate → Rollback → Prevent.
- **Specific:** TTLs, coalescing, rate limiting, replicas, thresholds.
- **Decisive:** Clear rollback criteria, not hand‑waving.
- **Principled:** Ends with operational excellence tie‑back.

---

This is exactly the kind of crisp, technical storytelling that makes you look like someone who can **own reliability under pressure**.

Here are **two more incident response drill scripts** — concise, structured, and in reliability language. These will give you a full troubleshooting toolkit for the SysDE loop.

---

# 🎤 Incident Drill 2 — Queue Backlog → Latency Spike

**Question:** _Your message queue backlog is growing rapidly, and downstream consumers can’t keep up. Latency is spiking. What do you do?_

**Answer Script (≈2 min):**
_"First, I’d confirm metrics: queue depth, consumer throughput, and end‑to‑end latency. The signals tell me producers are overwhelming consumers. Immediate priority is containment — prevent cascading failures._

_Step one: apply backpressure or rate limiting on producers to slow input. Step two: scale out consumers horizontally if possible, or increase batch size to improve throughput. Step three: configure a dead‑letter queue for messages that can’t be processed within SLA, so we don’t block the pipeline. I’d monitor queue depth and p95 latency against our SLOs._

_Rollback criteria: if queue depth continues to grow beyond threshold or latency exceeds SLA for more than 15 minutes, I’d halt new producer traffic temporarily and drain the backlog. After stabilization, I’d investigate root cause — was it a traffic spike, consumer regression, or misconfigured scaling policy? Preventive step: add autoscaling triggers tied to queue depth and alerts on backlog growth._

_Principle: reliability means designing for overload — detect, contain, and recover without losing critical data._

---

# 🎤 Incident Drill 3 — Canary Deploy → Rollback vs Fix‑Forward

**Question:** _You deploy a new version of a service to 10% of traffic. Error rate is 1.5× higher than baseline. What do you do?_

**Answer Script (≈2 min):**
_"First, I’d validate the signal: error rate increase on canary traffic compared to baseline. Immediate priority is protecting customers — contain blast radius._

_Step one: halt rollout immediately. Step two: decide rollback vs fix‑forward. If the error budget is being burned quickly or the root cause isn’t clear, rollback is the safer choice. Roll back the canary to the previous stable version, restore error rate to baseline, and monitor. If the issue is well‑understood and low‑risk, I might fix‑forward — patch the bug and redeploy to canary before resuming rollout._

_Rollback criteria: error rate >1.2× baseline for more than 10 minutes, or customer impact beyond SLA. Preventive step: strengthen pre‑deployment tests, add automated canary analysis, and define clear rollback thresholds in runbooks._

_Principle: deployment safety isn’t about avoiding bugs — it’s about limiting blast radius and making decisive rollback/fix‑forward calls._

---

## 🔑 Why These Work

- **Structured:** Detect → Contain → Mitigate → Rollback → Prevent.
- **Specific:** Queue depth, latency thresholds, error budgets, canary percentages.
- **Decisive:** Clear rollback criteria, not vague “we’d monitor.”
- **Principled:** Ends with operational excellence tie‑back.

---

Now you’ve got **three incident drills** (cache collapse, queue backlog, canary deploy). Together, they cover the most common SysDE troubleshooting scenarios.

Do you want me to **package these into a one‑page “SysDE Incident Playbook”** you can rehearse daily, so you walk into the loop with crisp, repeatable responses?
