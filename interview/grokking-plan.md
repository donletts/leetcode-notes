# 📚 Smart Roadmap After Caching

## 🔑 Immediate Next Steps (High Leverage)

These are the “core primitives” you’ll see in almost every system design prompt:

- **Data Partitioning** → How to scale databases horizontally. You’ll need this for sharding, replication, and consistent hashing later.
- **Indexes** → Critical for query optimization. Interviewers love asking about trade‑offs between read/write performance.
- **Proxies** → Sets you up for understanding API Gateways and reverse proxies later.
- **Redundancy & Replication** → Directly ties into reliability and availability — perfect bridge to your SysDE prep.

👉 These four are the natural continuation after caching. They give you the vocabulary to talk about scaling and reliability.

---

## 🧠 Core Theory You Must Internalize

Once you’ve got the basics, move into the “laws” of distributed systems:

- **SQL vs NoSQL** → Schema flexibility, ACID vs BASE trade‑offs.
- **CAP Theorem** → The unavoidable triangle: consistency, availability, partition tolerance.
- **PACELC Theorem** → Extends CAP with latency vs consistency trade‑offs.
- **Consistent Hashing** → The backbone of scalable partitioning and load distribution.

👉 These are the _conceptual anchors_. If you can explain CAP/PACELC trade‑offs clearly, you’ll sound credible in any design interview.

---

## ⚡ Real‑Time & Reliability Primitives

These are “specialized tools” you’ll need for modern system prompts:

- **Long‑Polling vs WebSockets vs SSE** → Real‑time communication trade‑offs.
- **Bloom Filters** → Space‑efficient membership checks (great for large‑scale systems).
- **Quorum** → Read/write coordination in replicated systems.
- **Leader/Follower, Heartbeat, Checksum** → Reliability and fault detection mechanisms.

👉 These are often tested in “design a chat system” or “design a monitoring system” prompts.

---

## 🎯 Trade‑Offs Section (Interview Gold)

This section is where you’ll practice _thinking like an architect_. Prioritize:

- **Strong vs Eventual Consistency**
- **Latency vs Throughput**
- **ACID vs BASE**
- **Batch vs Stream Processing**
- **Load Balancer vs API Gateway**
- **Serverless vs Traditional**
- **Stateful vs Stateless**

👉 These are the **discussion points** interviewers care about. They don’t want you to memorize; they want you to reason about trade‑offs.

---

## 🗓 Suggested Sequence for You

Since you’ve got ~2 weeks before your loop, here’s a **practical order**:

1. **Data Partitioning → Indexes → Proxies → Replication** (next 3–4 days)
2. **SQL vs NoSQL → CAP → PACELC → Consistent Hashing** (days 5–7)
3. **Real‑time primitives (WebSockets, Bloom Filters, Quorum, Leader/Follower)** (days 8–9)
4. **Trade‑offs section (Consistency, Latency vs Throughput, Batch vs Stream, Stateful vs Stateless)** (days 10–13)
5. **Final day:** Mock a full design prompt (e.g., design a URL shortener or chat system) using all these concepts.

---

## 🔑 Meta‑Tip

Don’t just read. For each concept:

- Write a **one‑liner definition**.
- Write a **real‑world example** (Redis, Kafka, DynamoDB, etc.).
- Write a **trade‑off sentence** (e.g., “CAP forces me to choose consistency vs availability under partition”).

That way, you’ll have interview‑ready soundbites.

---
