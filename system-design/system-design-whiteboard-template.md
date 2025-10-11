Perfect — here’s a **one‑page System Design Whiteboard Template** in Markdown. This is the scaffold you can sketch or mentally walk through in your interview. It’s structured so you don’t freeze under pressure: you always have a starting point (client → LB → servers → cache → DB → queue → monitoring), and you can expand or collapse detail depending on time.

---

# 📝 System Design Whiteboard Template

## 1. Requirements

- **Functional:** What the system must do (features).
- **Non‑Functional:** Scale, latency, availability, durability, consistency, security.

---

## 2. High‑Level Architecture

```txt
[ Client(s) ]
     |
     v
[ Load Balancer ]
     |
     v
[ Stateless App Servers ]  <-->  [ Cache Layer ]
     |
     v
[ Database(s) ]
     |
     v
[ Queue / Stream ]  --->  [ Workers / Consumers ]
     |
     v
[ Storage / External Services ]
```

---

## 3. Key Components to Discuss

- **Clients:** Web, mobile, API consumers.
- **Load Balancer:** Distributes traffic, health checks.
- **App Servers:** Stateless, horizontally scalable.
- **Cache:** Reduce DB load, improve latency (Redis, Memcached, CDN).
- **Database:**
  - SQL (transactions, strong consistency).
  - NoSQL (scale, flexible schema).
  - Sharding / replication strategies.
- **Queue / Stream:** Smooth spikes, async processing (Kafka, SQS, RabbitMQ).
- **Workers:** Background jobs, batch processing.
- **Storage:** Blob store (S3, GCS) for media, backups.
- **Monitoring / Observability:** Metrics, logging, alerts.

---

## 4. Trade‑Offs to Call Out

- **Consistency vs Availability** (CAP).
- **Latency vs Durability** (fast vs safe writes).
- **Cost vs Performance** (optimize ROI).
- **Monolith vs Microservices** (simplicity vs flexibility).
- **Read vs Write Optimization** (caching vs normalization).

---

## 5. Interview Flow (RNL)

1. **Requirements** → Clarify scope.
2. **Numbers** → Estimate users, requests/sec, storage.
3. **Layout** → Draw architecture, explain choices.
4. **Deep Dive** → Pick one component (DB, cache, queue).
5. **Failure Modes** → What breaks, how to recover.
6. **Trade‑Offs** → Why you chose X over Y.

---

✅ With this template, you’ll always have a **default diagram** to start from, and you can adapt it to any prompt (chat app, feed, URL shortener, etc.).

---

Would you like me to **walk you through a dry‑run** using this template on a classic interview prompt (e.g., “Design a URL shortener” or “Design Instagram feed”) so you can see how to apply it step by step?
