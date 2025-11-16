# Data Partitioning

Dividing a large database into smaller more manageable parts called shards. Each partition is independent and contains a subset of the overall data.

Partitions are typically divided by certain criterion like data range, data size, or data type. Each partition is assigned a separate processing node which can perform operations on it's assigned data subset independently of the others.

Can improve performance and scalability of large-scale data processing applications becasue it allows processing to be distributed across multiple nodes, minimizing data transfer and reducing processing times. The workload can also be balanced because it's distributed across multiple nodes.

Partitioning can be done in several ways, including horizontal partitioning, vertical partitioning and hybrid partitioning.

## Partitioning Methods

1. Horizontal Partitioning (Sharding):
   1. Dividing the database by a subset of `rows`. Each shard is assigned a different server. This allows parallel processing and faster execution.
   2. Could partition by geographic location if queries tend to be localized geographically
   3. If partitioning range isn't chosen carefully it could lead to unbalanced servers and lower latency. Ex: partitioning geographically assumes even distribution across regions which may not be the case (by state but most traffic comes from new york)
2. Vertical Partitioning:
   1. Dividing the database by a subset of `columns` instead of `rows`.
   2. Helpful when certain columns are accessed more frequently than others
   3. Can help minimize the amount of data that needs to be scanned
   4. Partition is not necessarily on a different server, sometimes just in different tables
   5. Example: on an e-commerce site storing customer data in a database. Personal information could be stored in a shard and order history in another shard.
3. Hybrid Partitioning:
   1. Combines horizontal and vertical partitioning.
   2. Distributing data across servers while also minimizing data that needs to be scanned
   3. Example: on an e-commerce site, could partition horizontally by geographic location then partitioned vertically by type (as above)

![partitioning methods](images/data-partitioning.svg)

## Partitioning Criteria

1. Key or Hash-Based Partitioning:
   1. apply a hash function to some key attributes of the entity we are storing which yields the partition number
   2. If we have 100 servers we could just do `ID%100` however this fixes the total number of DB servers.
   3. Adding new servers would need to redistribute the data
   4. Workaround is `Consistent Hashing`
2. List Partitioning:
   1. Each partition is assigned a list of values
   2. When we insert an item, just check which partition our ID goes in
   3. Ex: users living in Iceland, norway, sweden, finland, denmark would be stored in the "Nordic Countries" partition
3. Round-Robin partitioning:
   1. Simple `i%n` partitioning scheme
4. Composite partitioning:
   1. Combining two of the above partitioning schemes into a new scheme
   2. first applying a list partition then a hash-based partition
   3. Consistent hashing could be considered a composite of hash and list
   4. The assignment of keys to nodes is essentially a list partitioning of the hash space
   5. Hash (shrink the universe of keys) -> list (assign ranges to that universe to nodes)

## Common Problems with Data Partitioning

Introduces extra constraints that can be performed because multiple rows or multiple tables are no longer on the same server.

1. Joins and Denormalization:
   1. Performing joins on a database that is spread over several servers is not feasible
   2. Common workaround is to denormalize the database so queries that previously required a join are in the same table.
   3. Denormalization now has to deal with data inconsistency
2. Referential integrity:
   1. Trying to enforce data integrity constraints such as foreign keys in a partitioned database is extremely difficult
   2. Most DBMS do not support foreign key constraints across different servers
   3. Must enforce in application code (applications have to run regular SQL cleanup jobs to handle dangling references)
3. Rebalancing:
   1. Need to change our partitioning scheme
      1. data distribution is not uniform (particular zip cannot fit into a partition)
      2. a lot of load on a single partition
   2. Either create more partitions or rebalance
   3. rebalancing without downtime is extremely difficult
   4. `Directory-based partitioning` makes rebalancing easier at the cost of complexity and creating a single point of failure (i.e. the lookup service for the database)
   5. Rebalancing using a directory-based partitioning scheme with a new lookup service means you can incrementally update keys/ranges to new partitions
