# 🧭 System Design Buzzword Map

1. Load Balancing

   - What: Spread requests across multiple servers.
   - When: Traffic > 1 server’s capacity.
   - Trade‑offs:
     - ✅ Prevents overload, improves availability
     - ❌ Adds a hop, needs health checks

1. Caching

   - What: Store frequently accessed data in faster memory (Redis, Memcached, CDN).
   - When: Read‑heavy workloads, repeated queries.
   - Trade‑offs:
     - ✅ Faster reads, offloads DB
     - ❌ Stale data, invalidation complexity

1. Database Scaling

   - Vertical scaling: Bigger machine.
   - Horizontal scaling: More machines.
   - Sharding: Split data by key (e.g., user ID).
   - Replication: Copies for reads/fault tolerance.
   - Trade‑offs:
     - ✅ Scale capacity, improve resilience
     - ❌ Complexity, consistency issues

1. Queues / Stream Processing

   - What: Buffer between producers and consumers (Kafka, RabbitMQ, SQS).
   - When: Spiky traffic, async tasks (emails, logs).
   - Trade‑offs:
     - ✅ Smooths spikes, decouples services
     - ❌ Adds latency, eventual consistency

1. Consistency vs. Availability (CAP Theorem)

   - Consistency: Everyone sees the same data.
   - Availability: System always responds.
   - Partition tolerance: Must handle network splits.
   - Trade‑offs:
     - ✅ Pick what matters most (banking → consistency, social feed → availability)
     - ❌ Can’t maximize all three

1. Storage Choices

   - SQL (Relational): Strong consistency, structured queries.
   - NoSQL (Key‑Value, Document, Column): Flexible schema, scale‑out.
   - Trade‑offs:
     - ✅ SQL = transactions, joins
     - ✅ NoSQL = scale, flexibility
     - ❌ SQL = harder to scale, NoSQL = weaker guarantees

1. Fault Tolerance & Replication

   - What: Redundant copies, failover strategies.
   - When: Mission‑critical systems, high uptime SLAs.
   - Trade‑offs:
     - ✅ Reliability, availability
     - ❌ More cost, more complexity

## 🧠 How to Use in Interviews

- Step 1: Identify the bottleneck (reads, writes, traffic spikes, failures).
- Step 2: Pick the lever (cache, shard, queue, replicate).
- Step 3: State the trade‑off clearly.

## Example

“If our DB is overloaded with reads, I’d add a cache layer. That speeds up responses but introduces staleness risk, so we’d need an invalidation strategy.”
