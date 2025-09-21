# 📊 System Design Estimation Cheat Sheet

## 👥 Users & Activity

- Monthly Active Users (MAU) ≈ 10× Daily Active Users (DAU)
- Peak traffic ≈ 2–5× average traffic
- Requests per active user: ~10–50/day (depends on app type)
- Concurrent users: ~1% of MAU

## 📦 Data Sizes

- Text message / small JSON: ~1 KB
- Chat image (compressed): ~100 KB – 1 MB
- Profile picture: ~100 KB
- Short video (30s): ~5–10 MB
- Log entry: ~0.5–1 KB

## 🌐 Network & Bandwidth

- 1 request/sec ≈ 86,400 requests/day
- 100 requests/sec ≈ ~8.6M requests/day
- 1 Gbps link ≈ ~125 MB/s throughput

## 💾 Storage

- 1 GB = 10⁹ bytes ≈ 1,000 MB
- 1 TB = 10³ GB
- 1 PB = 10³ TB
- Rule of thumb: 1M users × 1 MB/user ≈ 1 TB

## ⚡ Latency Targets

- UI response: <100 ms feels instant
- API call: <200 ms is good
- Disk read (SSD): ~0.1 ms
- Network round trip (same region): ~10–50 ms

## 🗄️ Databases

- Single DB server: ~10k writes/sec, ~100k reads/sec (ballpark)
- Cache (Redis/Memcached): ~1M ops/sec
- Sharding: Split by user ID, geography, or hash

## 📚 Common Ratios

- Read-heavy workloads: 80% reads, 20% writes
- Write-heavy (logging, metrics): 90% writes, 10% reads
- Hotspot rule: 20% of users generate 80% of traffic

## 🧮 Quick Math Tricks

- Requests/sec → per day: multiply by 86,400
- Users/day → per sec: divide by 86,400
- Storage/year: daily GB × 365
- Replication factor 3: multiply storage by 3

## 🎯 How to Use in Interviews

- State assumption clearly: “Let’s assume 10M MAU, 1M DAU, each makes 10 requests/day.”
- Do quick math: 1M × 10 = 10M requests/day ≈ 115 requests/sec.
- Map to capacity: “That’s easily handled by a single load balancer, but DB writes would need sharding.”
- Show tradeoffs: “If traffic spikes 5×, we’d need caching and horizontal scaling.”
